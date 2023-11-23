library dashboard_screen.dart;

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:livestream_app/app/core/domain/entities/destination.dart';
import 'package:livestream_app/app/core/presentation/widgets/adaptive/adaptive_bottom_navigation.dart';
import 'package:livestream_app/app/core/presentation/widgets/lazy_index_stack.dart';
import 'package:livestream_app/utils/extensions/setstate_extension.dart';

@RoutePage()
class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter.builder(
      routes: Destination.list.map((e) => e.router).toList(),
      inheritNavigatorObservers: true,
      navigatorObservers: () => [
        AutoRouteObserver(),
      ],
      onRouterReady: (router) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          router.setActiveIndex(_currentIndex); // Update Router
          setStateIfMounted(
              () => _currentIndex = router.activeIndex); // Set State
        });
      },
      builder: (c, children, router) => Scaffold(
        body: LazyIndexedStack(
          index: c.watchTabsRouter.activeIndex,
          children: children,
        ),
        bottomNavigationBar: AdaptiveBottomNavigation(
          items: Destination.buildNav(c),
          materialData: (d) => d.copyWith(
            labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
          ),
          selectedIndex: c.watchTabsRouter.activeIndex,
          onDestinationSelected: (i) {
            router.setActiveIndex(i); // Update Router
            setStateIfMounted(() => _currentIndex = i);
          },
        ),
      ),
    );
  }
}
