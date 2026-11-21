import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import 'package:provai/app/app.dart';
import 'package:provai/config/env.dart';
import 'package:provai/data/services/local_storage_service.dart';
import 'package:provai/utils/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/// Uygulama başlangıcı: binding, global hata yakalama, Supabase, tercihler
/// ve ProviderScope.
Future<void> bootstrap() async {
  WidgetsFlutterBinding.ensureInitialized();

  FlutterError.onError = (details) {
    appLogger.e(
      'Flutter error',
      error: details.exception,
      stackTrace: details.stack,
    );
    if (kDebugMode) FlutterError.presentError(details);
  };
  PlatformDispatcher.instance.onError = (error, stack) {
    appLogger.e('Uncaught error', error: error, stackTrace: stack);
    return true;
  };

  // Supabase yalnızca anonim oturum ve Edge Function çağrıları için kullanılır.
  // env dosyası verilmeden çalıştırılırsa uygulama açılır, AI istekleri hata döner.
  if (Env.isConfigured) {
    await Supabase.initialize(
      url: Env.supabaseUrl,
      publishableKey: Env.supabasePublishableKey,
    );
  } else {
    appLogger.w(
      'Env eksik: --dart-define-from-file=env/dev.json ile çalıştırın',
    );
  }

  // Tercihler ilk karede senkron okunabilsin diye önbellekli instance önceden yüklenir.
  final prefs = await SharedPreferencesWithCache.create(
    cacheOptions: const SharedPreferencesWithCacheOptions(),
  );

  runApp(
    ProviderScope(
      overrides: [
        localStorageServiceProvider.overrideWithValue(
          LocalStorageService(prefs),
        ),
      ],
      child: const ProvaiApp(),
    ),
  );
}
