import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';

class AppNavigationObserver extends NavigatorObserver {
  /// The logged message.
  final Logger logger;

  AppNavigationObserver._(this.logger);

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) =>
      logger.info(
          'didPop: ${route.toStr()}, previousRoute= ${previousRoute?.toStr()}');

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) =>
      logger.info(
          'didPush: ${route.toStr()}, previousRoute= ${previousRoute?.toStr()}');

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) =>
      logger.info(
          'didRemove: ${route.toStr()}, previousRoute= ${previousRoute?.toStr()}');

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) =>
      logger.info(
          'didReplace: new= ${newRoute?.toStr()}, old= ${oldRoute?.toStr()}');

  @override
  void didStartUserGesture(
          Route<dynamic> route, Route<dynamic>? previousRoute) =>
      logger.info(
          'didStartUserGesture: ${route.toStr()}, previousRoute= ${previousRoute?.toStr()}');

  @override
  void didStopUserGesture() => logger.info('didStopUserGesture');

  static AppNavigationObserver boot() {
    final navLogger = Logger('DefaultNavigationObserver');

    navLogger.onRecord.listen((LogRecord rec) {
      if (rec.error != null && rec.stackTrace != null) {
        log(
          'message: ${rec.message}',
          name: rec.loggerName,
          time: rec.time,
          level: rec.level.value,
          error: rec.error,
          stackTrace: rec.stackTrace,
        );
      } else if (rec.error != null) {
        log(
          'message: ${rec.message}',
          name: rec.loggerName,
          time: rec.time,
          level: rec.level.value,
          error: rec.error,
        );
      } else {
        log(
          'message: ${rec.message}',
          name: rec.loggerName,
          time: rec.time,
          level: rec.level.value,
        );
      }
    });

    return AppNavigationObserver._(navLogger);
  }
}

extension on Route<dynamic> {
  // String _limitArgumentsChars(int limit) {
  //   final arguments = settings.arguments.toString();
  //   return arguments.length > limit ? '${arguments.substring(0, limit)}...' : arguments;
  // }

  String toStr() => '(Route: ${settings.name})';
}
