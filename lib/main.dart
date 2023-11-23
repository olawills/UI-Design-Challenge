import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:livestream_app/managers/navigation/app_router.dart';
import 'package:livestream_app/managers/navigation/observers/navigation_observers.dart';
import 'package:livestream_app/utils/assets.gen.dart';

void main() {
  runApp(const MyApp());
}

final _router = AppRouter();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Livestream app',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          useMaterial3: true, fontFamily: AssetsFonts.poppinsMediumTTF),
      routerConfig: _router.config(
        navigatorObservers: () => [
          AutoRouteObserver(),
          AppNavigationObserver.boot(),
        ],
      ),
      builder: (_, widget) => ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        useInheritedMediaQuery: true,
        child: widget,
        builder: (_, child) => child!,
      ),
    );
  }
}
