import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provai/data/repositories/interview_repository_impl.dart';
import 'package:provai/data/repositories/mock_subscription_repository.dart';
import 'package:provai/data/repositories/profile_repository_impl.dart';
import 'package:provai/data/services/analytics_service.dart';
import 'package:provai/data/services/speech_service.dart';
import 'package:provai/domain/models/interview.dart';
import 'package:provai/domain/models/subscription.dart';
import 'package:provai/domain/models/user_profile.dart';
import 'package:provai/domain/repositories/interview_repository.dart';
import 'package:provai/domain/repositories/profile_repository.dart';
import 'package:provai/domain/repositories/subscription_repository.dart';
import 'package:provai/ui/features/session/view_models/session_state.dart';
import 'package:provai/ui/features/session/view_models/session_view_model.dart';
import 'package:provai/utils/cancel_handle.dart';
import 'package:provai/utils/result.dart';

class _Interviews extends Mock implements InterviewRepository;

class _Profiles extends Mock implements ProfileRepository;

class _Subscriptions extends Mock implements SubscriptionRepository;

class _Speech extends Mock implements SpeechService;

const _question = InterviewQuestion(
  id: 'q1',
  text: 'Kendinden bahseder misin?',
  type: QuestionType.motivation,
);

final _session = InterviewSession(
  id: 's1',
  createdAt: DateTime(2026, 11, 21),
  targetRole: 'Flutter Developer',
  seniority: Seniority.mid,
  language: InterviewLanguage.tr,
  roleSummary: '',
  questions: const [_question],
);

void main() {
  late _Interviews interviews;
  late ProviderContainer container;
  final provider = sessionViewModelProvider('s1');

  setUpAll(() {
    registerFallbackValue(_session);
    registerFallbackValue(_question);
    registerFallbackValue(AnswerInputMode.text);
    registerFallbackValue(const UserProfile());
    registerFallbackValue(CancelHandle());
  });

  setUp(() {
    interviews = _Interviews();
    final profiles = _Profiles();
    final subscriptions = _Subscriptions();
    final speech = _Speech();
    when(() => interviews.getSession('s1')).thenReturn(_session);
    when(profiles.getProfile).thenReturn(const UserProfile());
    when(() => subscriptions.currentStatus)
        .thenReturn(const SubscriptionStatus());
    when(() => speech.statusStream).thenAnswer((_) => const Stream.empty());
    when(() => speech.errorStream).thenAnswer((_) => const Stream.empty());
    when(speech.cancel).thenAnswer((_) async {});

    container = ProviderContainer(
      overrides: [
        interviewRepositoryProvider.overrideWithValue(interviews),
        profileRepositoryProvider.overrideWithValue(profiles),
        subscriptionRepositoryProvider.overrideWithValue(subscriptions),
        speechServiceProvider.overrideWithValue(speech),
        analyticsServiceProvider.overrideWithValue(
          const DebugAnalyticsService(),
        ),
      ],
    );
    addTearDown(container.dispose);
    container.listen(provider, (_, _) {});
  });

  SessionViewModel vm() => container.read(provider.notifier);
  SessionState state() => container.read(provider);

  test(
    'kısa cevapta istek atılmaz, nedenini söyleyen effect üretilir',
    () async {
      vm().onAnswerEdited('Maaşı iyiydi..');
      await vm().submit();

      expect(state().effect, const SessionEffect.answerTooShort());
      expect(state().phase, SessionPhase.answering);
      verifyNever(
        () => interviews.submitAnswer(
          session: any(named: 'session'),
          question: any(named: 'question'),
          transcript: any(named: 'transcript'),
          inputMode: any(named: 'inputMode'),
          profile: any(named: 'profile'),
          durationSeconds: any(named: 'durationSeconds'),
          fillerWordCount: any(named: 'fillerWordCount'),
          cancel: any(named: 'cancel'),
        ),
      );
    },
  );

  test('klavyeyle yazılan cevap yazılı olarak gönderilir', () async {
    when(
      () => interviews.submitAnswer(
        session: any(named: 'session'),
        question: any(named: 'question'),
        transcript: any(named: 'transcript'),
        inputMode: any(named: 'inputMode'),
        profile: any(named: 'profile'),
        durationSeconds: any(named: 'durationSeconds'),
        fillerWordCount: any(named: 'fillerWordCount'),
        cancel: any(named: 'cancel'),
      ),
    ).thenAnswer((_) async => Success(_session));

    vm().onAnswerEdited(
      'Üç yıldır mobil geliştirme yapıyorum ve Flutter seviyorum.',
    );
    await vm().submit();

    final captured = verify(
      () => interviews.submitAnswer(
        session: any(named: 'session'),
        question: any(named: 'question'),
        transcript: captureAny(named: 'transcript'),
        inputMode: captureAny(named: 'inputMode'),
        profile: any(named: 'profile'),
        durationSeconds: captureAny(named: 'durationSeconds'),
        fillerWordCount: any(named: 'fillerWordCount'),
        cancel: any(named: 'cancel'),
      ),
    ).captured;
    expect(captured[0], startsWith('Üç yıldır'));
    expect(captured[1], AnswerInputMode.text);
    expect(captured[2], isNull, reason: 'yazılı cevapta süre gönderilmez');
  });
}
