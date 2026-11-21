import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provai/data/repositories/interview_repository_impl.dart';
import 'package:provai/data/repositories/mock_subscription_repository.dart';
import 'package:provai/data/repositories/profile_repository_impl.dart';
import 'package:provai/domain/models/interview.dart';
import 'package:provai/domain/models/subscription.dart';
import 'package:provai/domain/models/user_profile.dart';
import 'package:provai/domain/repositories/interview_repository.dart';
import 'package:provai/domain/repositories/profile_repository.dart';
import 'package:provai/domain/repositories/subscription_repository.dart';
import 'package:provai/ui/features/home/view_models/home_state.dart';
import 'package:provai/ui/features/home/view_models/home_view_model.dart';
import 'package:provai/utils/cancel_handle.dart';

class _Interviews extends Mock implements InterviewRepository;

class _Profiles extends Mock implements ProfileRepository;

class _Subscriptions extends Mock implements SubscriptionRepository;

InterviewSession _session(String id) => InterviewSession(
  id: id,
  createdAt: DateTime(2026, 11, 21),
  targetRole: 'Flutter Developer',
  seniority: Seniority.mid,
  language: InterviewLanguage.tr,
  roleSummary: '',
  questions: const [],
);

void main() {
  late _Interviews interviews;
  late StreamController<void> changes;
  late ProviderContainer container;

  setUpAll(() {
    // any(named: ...) eşleştiricileri için örnek değerler.
    registerFallbackValue(const UserProfile());
    registerFallbackValue(InterviewLanguage.tr);
    registerFallbackValue(CancelHandle());
  });

  setUp(() {
    interviews = _Interviews();
    changes = StreamController<void>.broadcast();
    final profiles = _Profiles();
    final subscriptions = _Subscriptions();
    when(profiles.getProfile)
        .thenReturn(const UserProfile(targetRole: 'Flutter Developer'));
    when(() => subscriptions.currentStatus)
        .thenReturn(const SubscriptionStatus());
    when(subscriptions.watchStatus).thenAnswer((_) => const Stream.empty());
    when(() => interviews.startedSessionCount).thenReturn(0);
    when(interviews.getSessions).thenReturn([]);
    when(interviews.watchChanges).thenAnswer((_) => changes.stream);

    container = ProviderContainer(
      overrides: [
        interviewRepositoryProvider.overrideWithValue(interviews),
        profileRepositoryProvider.overrideWithValue(profiles),
        subscriptionRepositoryProvider.overrideWithValue(subscriptions),
      ],
    );
    addTearDown(container.dispose);
    addTearDown(changes.close);
    container.listen(homeViewModelProvider, (_, _) {});
  });

  HomeState state() => container.read(homeViewModelProvider);

  test('repository değişince geçmiş ve sayaç tazelenir', () async {
    expect(state().recentSessions, isEmpty);

    when(interviews.getSessions).thenReturn([_session('a')]);
    when(() => interviews.startedSessionCount).thenReturn(1);
    changes.add(null);
    await Future<void>.delayed(Duration.zero);

    expect(state().recentSessions.map((s) => s.id), ['a']);
    expect(state().freeSessionsLeft, 0);
  });

  test(
    'ilan boşken başlatılırsa istek atılmaz, uyarı effect üretilir',
    () async {
      await container.read(homeViewModelProvider.notifier).startSession();

      expect(state().effect, const HomeEffect.postingRequired());
      verifyNever(
        () => interviews.createSession(
          profile: any(named: 'profile'),
          jobPosting: any(named: 'jobPosting'),
          questionCount: any(named: 'questionCount'),
          language: any(named: 'language'),
          cancel: any(named: 'cancel'),
        ),
      );
    },
  );
}
