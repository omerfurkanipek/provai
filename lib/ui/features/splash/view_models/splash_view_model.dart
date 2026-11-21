import 'package:provai/data/repositories/profile_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'splash_view_model.g.dart';

enum SplashDestination { onboarding, home }

/// Açılışta nereye gidileceğine karar verir. Marka ekranı en az [minDuration]
/// görünür; kısa bir an titreyip kaybolmasın diye.
@riverpod
class SplashViewModel extends _$SplashViewModel {
  static const minDuration = Duration(milliseconds: 1100);

  @override
  Future<SplashDestination> build() async {
    await Future<void>.delayed(minDuration);
    final completed = ref.read(profileRepositoryProvider).isOnboardingCompleted;
    return completed ? SplashDestination.home : SplashDestination.onboarding;
  }
}
