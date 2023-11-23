import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:livestream_app/managers/navigation/app_router.dart';
import 'package:livestream_app/utils/extensions/dynamic_extension.dart';


// This is the Navigator. Calling this getter will return the top-most StackRouter.
StackRouter get navigator => AppRouter();

BuildContext? get navigatorContext {
  try {
    return navigator.navigatorKey.currentContext;
  } catch (e, tr) {
    log(e.toString());
    log(e.toString());
    log(tr.toString());
    return null;
  }
}
/// give access to the current platform
TargetPlatform get currentPlatform => navigatorContext?.let((it) => Theme.of(it).platform) ?? defaultTargetPlatform;
