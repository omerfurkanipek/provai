import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import 'package:provai/app/app.dart';
import 'package:provai/utils/logger.dart';

/// Uygulama başlangıcı: binding, global hata yakalama ve ProviderScope.
/// SDK init'leri (Supabase vb.) ilgili servis eklendiğinde buraya gelir.
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

  runApp(const ProviderScope(child: ProvaiApp()));
}
