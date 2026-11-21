import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'auth_service.g.dart';

/// Anonim Supabase oturumu. Kullanıcıdan hesap istenmez; oturum yalnızca
/// sunucudaki kullanıcı başına AI kotası için vardır.
class AuthService {
  const AuthService(this._authProvider);

  /// Supabase yalnızca env verildiğinde başlatılır; bu yüzden erişim tembeldir.
  final GoTrueClient Function() _authProvider;

  GoTrueClient get _auth => _authProvider();

  /// Geçerli bir erişim token'ı döner; oturum yoksa anonim oturum açar.
  /// Süresi dolan token'ı supabase_flutter kendisi yeniler.
  Future<String> accessToken() async {
    final session = _auth.currentSession;
    if (session != null && !session.isExpired) return session.accessToken;
    if (session != null) {
      final refreshed = await _auth.refreshSession();
      final token = refreshed.session?.accessToken;
      if (token != null) return token;
    }
    final response = await _auth.signInAnonymously();
    return response.session!.accessToken;
  }

  Future<void> signOut() => _auth.signOut();
}

@Riverpod(keepAlive: true)
AuthService authService(Ref ref) =>
    AuthService(() => Supabase.instance.client.auth);
