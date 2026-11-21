import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

/// Tek log noktası. Release build'de yalnızca uyarı ve üstü yazılır.
final Logger appLogger = Logger(
  level: kReleaseMode ? Level.warning : Level.debug,
  printer: PrettyPrinter(methodCount: 0, errorMethodCount: 6, lineLength: 100),
);
