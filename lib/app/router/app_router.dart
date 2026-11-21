import 'package:go_router/go_router.dart';
import 'package:provai/app/router/routes.dart';
import 'package:provai/data/services/http_inspector.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router.g.dart';

/// Uygulama router'ı. Yönlendirme kararı (onboarding mi, home mu) Splash
/// ViewModel'inde verilir; burada yalnızca route tablosu tanımlanır.
@Riverpod(keepAlive: true)
GoRouter appRouter(Ref ref) {
  final router = GoRouter(
    routes: $appRoutes,
    // Debug'da HTTP inspector'ın kendi ekranını açabilmesi için.
    navigatorKey: ref.watch(httpInspectorProvider)?.getNavigatorKey(),
  );
  ref.onDispose(router.dispose);
  return router;
}
