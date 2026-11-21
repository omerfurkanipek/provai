import 'package:flutter_riverpod/misc.dart' show Override;
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:mocktail/mocktail.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:provai/data/repositories/interview_repository_impl.dart';
import 'package:provai/data/repositories/mock_subscription_repository.dart';
import 'package:provai/data/repositories/profile_repository_impl.dart';
import 'package:provai/data/services/analytics_service.dart';
import 'package:provai/data/services/local_storage_service.dart';
import 'package:provai/data/services/speech_service.dart';
import 'package:provai/domain/models/interview.dart';
import 'package:provai/domain/models/paywall_placement.dart';
import 'package:provai/domain/models/subscription.dart';
import 'package:provai/domain/models/user_profile.dart';
import 'package:provai/domain/repositories/interview_repository.dart';
import 'package:provai/domain/repositories/profile_repository.dart';
import 'package:provai/domain/repositories/subscription_repository.dart';
import 'package:provai/ui/features/home/views/home_screen.dart';
import 'package:provai/ui/features/onboarding/views/onboarding_screen.dart';
import 'package:provai/ui/features/paywall/views/paywall_screen.dart';
import 'package:provai/ui/features/profile/views/profile_screen.dart';
import 'package:provai/ui/features/result/views/result_screen.dart';
import 'package:provai/ui/features/session/views/session_screen.dart';
import 'package:provai/utils/result.dart';

import '../helpers/pump_app.dart';

class _Profiles extends Mock implements ProfileRepository;

class _Subscriptions extends Mock implements SubscriptionRepository;

class _Interviews extends Mock implements InterviewRepository;

class _Speech extends Mock implements SpeechService;

class _Storage extends Mock implements LocalStorageService;

/// Küçük telefondan tablete kadar test edilen mantıksal ekran boyutları.
const _sizes = {
  'küçük telefon (320×568)': Size(320, 568),
  'standart Android (360×640)': Size(360, 640),
  'büyük telefon (412×915)': Size(412, 915),
  'tablet (800×1280)': Size(800, 1280),
};

const _profile = UserProfile(
  name: 'Ömer Furkan İpek',
  targetRole: 'Kıdemli Mobil Uygulama Geliştiricisi',
  seniority: Seniority.senior,
);

const _feedback = AnswerFeedback(
  score: 6,
  criteria: CriteriaScores(
    structure: 6,
    relevance: 7,
    specificity: 4,
    clarity: 6,
  ),
  summary: 'Cevabın sorunu anlatıyor ama sonucu ölçülebilir değil.',
  strengths: ['Problemi net tanımladın.', 'Çözüm adımlarını sıraladın.'],
  improvements: [
    Improvement(quote: 'epey hızlandı', fix: 'Sonucu bir rakamla anlat.'),
    Improvement(fix: 'Teşhis sürecinden bahset.'),
  ],
  improvedAnswer:
      'Ödeme ekranında kaydırma takılıyordu. Önce profilleme yaptım, sonra '
      'görselleri önbelleğe aldım ve kare süresini [X ms] seviyesine indirdim.',
  followUpQuestion: 'Profillemede hangi araçları kullandın?',
);

InterviewSession _session({required bool answered}) => InterviewSession(
  id: 's1',
  createdAt: DateTime(2026, 11, 21),
  targetRole: _profile.targetRole,
  seniority: Seniority.senior,
  language: InterviewLanguage.tr,
  roleSummary: 'Performans ve mimari odaklı mobil rol.',
  jobPosting: 'Kıdemli mobil geliştirici arıyoruz.',
  questions: const [
    InterviewQuestion(
      id: 'q1',
      text:
          'Son projende karşılaştığın en zor teknik problemi ve bunu çözmek '
          'için izlediğin adımları ayrıntılı olarak anlatır mısın?',
      type: QuestionType.technical,
    ),
  ],
  answers: answered
      ? const [
          InterviewAnswer(
            questionId: 'q1',
            transcript:
                'Ödeme ekranında takılma vardı, görselleri önbelleğe aldım ve '
                'uygulama epey hızlandı.',
            inputMode: AnswerInputMode.voice,
            durationSeconds: 84,
            feedback: _feedback,
          ),
        ]
      : const [],
);

void main() {
  late _Profiles profiles;
  late _Subscriptions subscriptions;
  late _Interviews interviews;
  late _Speech speech;
  late _Storage storage;

  setUpAll(() {
    PackageInfo.setMockInitialValues(
      appName: 'provAi',
      packageName: 'com.omerfi.provai',
      version: '1.0.0',
      buildNumber: '1',
      buildSignature: '',
    );
  });

  setUp(() {
    profiles = _Profiles();
    subscriptions = _Subscriptions();
    interviews = _Interviews();
    speech = _Speech();
    storage = _Storage();

    when(profiles.getProfile).thenReturn(_profile);
    when(() => profiles.isOnboardingCompleted).thenReturn(true);
    when(() => subscriptions.currentStatus)
        .thenReturn(const SubscriptionStatus());
    when(subscriptions.watchStatus).thenAnswer((_) => const Stream.empty());
    when(
      subscriptions.fetchPlans,
    ).thenAnswer((_) async => const Success(MockSubscriptionRepository.plans));
    when(() => interviews.startedSessionCount).thenReturn(1);
    when(interviews.getSessions).thenReturn([_session(answered: true)]);
    when(() => speech.statusStream).thenAnswer((_) => const Stream.empty());
    when(() => speech.errorStream).thenAnswer((_) => const Stream.empty());
    when(speech.cancel).thenAnswer((_) async {});
    when(() => storage.getString(any())).thenReturn(null);
  });

  List<Override> overrides() => [
    profileRepositoryProvider.overrideWithValue(profiles),
    subscriptionRepositoryProvider.overrideWithValue(subscriptions),
    interviewRepositoryProvider.overrideWithValue(interviews),
    speechServiceProvider.overrideWithValue(speech),
    localStorageServiceProvider.overrideWithValue(storage),
    analyticsServiceProvider.overrideWithValue(const DebugAnalyticsService()),
  ];

  // Taşma (overflow) Flutter'da test hatası olarak raporlanır; her ekran her
  // boyutta hatasız çizilmeli.
  Future<void> expectRenders(
    WidgetTester tester,
    Widget screen,
    Size size,
  ) async {
    await tester.pumpApp(screen, overrides: overrides(), size: size);
    await tester.pump();
    await tester.pump(const Duration(seconds: 3));
    // Taşma olursa test çerçevesi hatayı widget konumuyla birlikte raporlar.
  }

  for (final MapEntry(key: label, value: size) in _sizes.entries) {
    group(label, () {
      testWidgets('Onboarding', (tester) async {
        when(profiles.getProfile).thenReturn(null);
        await expectRenders(tester, const OnboardingScreen(), size);
      });

      testWidgets('Paywall', (tester) async {
        await expectRenders(
          tester,
          const PaywallScreen(placement: PaywallPlacement.onboarding),
          size,
        );
      });

      testWidgets('Ana sayfa', (tester) async {
        await expectRenders(tester, const HomeScreen(), size);
      });

      testWidgets('Prova: cevaplama', (tester) async {
        when(() => interviews.getSession('s1'))
            .thenReturn(_session(answered: false));
        await expectRenders(tester, const SessionScreen(sessionId: 's1'), size);
      });

      testWidgets('Prova: geri bildirim', (tester) async {
        when(() => interviews.getSession('s1'))
            .thenReturn(_session(answered: true));
        await expectRenders(tester, const SessionScreen(sessionId: 's1'), size);
      });

      testWidgets('Rapor', (tester) async {
        when(() => interviews.getSession('s1'))
            .thenReturn(_session(answered: true));
        await expectRenders(tester, const ResultScreen(sessionId: 's1'), size);
      });

      testWidgets('Profil', (tester) async {
        await expectRenders(tester, const ProfileScreen(), size);
      });
    });
  }
}
