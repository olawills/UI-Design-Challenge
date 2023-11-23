// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    CallScreenRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const CallScreen()),
      );
    },
    ContactScreenRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const ContactScreen()),
      );
    },
    CreateGroupRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const CreateGroupScreen()),
      );
    },
    DashboardRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const DashboardScreen(),
      );
    },
    GroupsPageRoute.name: (routeData) {
      final args = routeData.argsAs<GroupsPageRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(
            child: GroupScreen(
          key: args.key,
          chatHeader: args.chatHeader,
        )),
      );
    },
    HomeScreenRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const HomeScreen()),
      );
    },
    SettingsScreenRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const SettingsScreen()),
      );
    },
    SplashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const SplashScreen()),
      );
    },
  };
}

/// generated route for
/// [CallScreen]
class CallScreenRoute extends PageRouteInfo<void> {
  const CallScreenRoute({List<PageRouteInfo>? children})
      : super(
          CallScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'CallScreenRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ContactScreen]
class ContactScreenRoute extends PageRouteInfo<void> {
  const ContactScreenRoute({List<PageRouteInfo>? children})
      : super(
          ContactScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'ContactScreenRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CreateGroupScreen]
class CreateGroupRoute extends PageRouteInfo<void> {
  const CreateGroupRoute({List<PageRouteInfo>? children})
      : super(
          CreateGroupRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateGroupRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [DashboardScreen]
class DashboardRoute extends PageRouteInfo<void> {
  const DashboardRoute({List<PageRouteInfo>? children})
      : super(
          DashboardRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [GroupScreen]
class GroupsPageRoute extends PageRouteInfo<GroupsPageRouteArgs> {
  GroupsPageRoute({
    Key? key,
    required ChatHeader chatHeader,
    List<PageRouteInfo>? children,
  }) : super(
          GroupsPageRoute.name,
          args: GroupsPageRouteArgs(
            key: key,
            chatHeader: chatHeader,
          ),
          initialChildren: children,
        );

  static const String name = 'GroupsPageRoute';

  static const PageInfo<GroupsPageRouteArgs> page =
      PageInfo<GroupsPageRouteArgs>(name);
}

class GroupsPageRouteArgs {
  const GroupsPageRouteArgs({
    this.key,
    required this.chatHeader,
  });

  final Key? key;

  final ChatHeader chatHeader;

  @override
  String toString() {
    return 'GroupsPageRouteArgs{key: $key, chatHeader: $chatHeader}';
  }
}

/// generated route for
/// [HomeScreen]
class HomeScreenRoute extends PageRouteInfo<void> {
  const HomeScreenRoute({List<PageRouteInfo>? children})
      : super(
          HomeScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeScreenRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SettingsScreen]
class SettingsScreenRoute extends PageRouteInfo<void> {
  const SettingsScreenRoute({List<PageRouteInfo>? children})
      : super(
          SettingsScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsScreenRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SplashScreen]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
