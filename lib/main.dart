import 'dart:async';

import 'package:crypto_currencies_test_app/core/utils/logger.dart';
import 'package:crypto_currencies_test_app/features/app/logic/app_launcher.dart';
import 'package:flutter/foundation.dart';

void main() {
  logger.runLogging(
    () => runZonedGuarded(
      () async => await const AppLauncher().initializeAndRun(),
      logger.logZoneError,
    ),
    const LogOptions(
      level: kDebugMode ? LoggerLevel.debug : LoggerLevel.info,
    ),
  );
}
