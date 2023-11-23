library app_router.dart;

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:livestream_app/app/core/presentation/screens/dashboard_screen.dart';
import 'package:livestream_app/features/call/screens/call_screen.dart';
import 'package:livestream_app/features/contact/screens/contact_screen.dart';
import 'package:livestream_app/features/group/screens/create_group_screen.dart';
import 'package:livestream_app/features/group/screens/group_screen.dart';
import 'package:livestream_app/features/home/domain/chat_header.dart';
import 'package:livestream_app/features/home/presentation/screens/home_screen.dart';
import 'package:livestream_app/features/settings/screens/settings_screen.dart';
import 'package:livestream_app/features/splash/splash_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page|Screen,Route')
class AppRouter extends _$AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          initial: true,
          fullMatch: true,
          page: SplashRoute.page,
          restorationId: (m) => m.fullPath,
        ),
        AutoRoute(
          fullMatch: true,
          page: DashboardRoute.page,
          restorationId: (m) => m.fullPath,
          children: [
            AutoRoute(
              fullMatch: true,
              page: HomeScreenRoute.page,
              restorationId: (m) => m.fullPath,
            ),
            AutoRoute(
              fullMatch: true,
              page: CallScreenRoute.page,
              restorationId: (m) => m.fullPath,
            ),
            AutoRoute(
              fullMatch: true,
              page: ContactScreenRoute.page,
              restorationId: (m) => m.fullPath,
            ),
            AutoRoute(
              fullMatch: true,
              page: SettingsScreenRoute.page,
              restorationId: (m) => m.fullPath,
            ),
          ],
        ),
        AutoRoute(
          fullMatch: true,
          page: GroupsPageRoute.page,
          restorationId: (m) => m.fullPath,
        ),
        AutoRoute(
          fullMatch: true,
          page: CreateGroupRoute.page,
          restorationId: (m) => m.fullPath,
        ),
      ];
}
