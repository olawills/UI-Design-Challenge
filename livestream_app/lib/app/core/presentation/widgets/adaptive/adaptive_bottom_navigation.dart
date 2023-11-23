import 'package:flutter/material.dart';

const _CupertinoBottomNavData __cupertinoData = _CupertinoBottomNavData();
const _MaterialBottomNavData __materialData = _MaterialBottomNavData();

class AdaptiveBottomNavigation extends StatelessWidget {
  final List<AdaptiveNavigationBarItem> items;
  // final PlatformType? platform;
  final Color? backgroundColor;
  final double? elevation;
  final int selectedIndex;
  final void Function(int) onDestinationSelected;

  /// Additional configurations for Cupertino Navigation.
  final _CupertinoBottomNavData Function(_CupertinoBottomNavData)?
      cupertinoData;

  /// Additional configurations for Material Navigation.
  final _MaterialBottomNavData Function(_MaterialBottomNavData)? materialData;

  const AdaptiveBottomNavigation({
    super.key,
    required this.items,
    // this.platform,
    this.backgroundColor,
    this.elevation,
    this.selectedIndex = 0,
    required this.onDestinationSelected,
    this.cupertinoData,
    this.materialData,
  });

  _CupertinoBottomNavData get _cupertinoData =>
      cupertinoData?.call(__cupertinoData) ?? __cupertinoData;
  _MaterialBottomNavData get _materialData =>
      materialData?.call(__materialData) ?? __materialData;

  List<BottomNavigationBarItem> get bottomNavigationItems =>
      items.map((e) => e.bottomNavigationBarItem).toList();

  List<NavigationDestination> get navigationDestinations =>
      items.map((e) => e.navigationDestination).toList();

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      animationDuration: _materialData.animationDuration,
      backgroundColor: backgroundColor,
      selectedIndex: selectedIndex,
      elevation: elevation,
      height: _materialData.height,
      indicatorColor: _materialData.indicatorColor,
      // indicatorShape: _materialData.indicatorShape,
      labelBehavior: _materialData.labelBehavior,
      onDestinationSelected: onDestinationSelected,
      shadowColor: _materialData.shadowColor,
      // surfaceTintColor: _materialData.surfaceTintColor,
      destinations: navigationDestinations,
    );
    //   return PlatformBuilder.builder(
    //     // platform: platform,
    //     material: (_) => NavigationBar(
    //       animationDuration: _materialData.animationDuration,
    //       backgroundColor: backgroundColor,
    //       selectedIndex: selectedIndex,
    //       elevation: elevation,
    //       height: _materialData.height,
    //       indicatorColor: _materialData.indicatorColor,
    //       indicatorShape: _materialData.indicatorShape,
    //       labelBehavior: _materialData.labelBehavior,
    //       onDestinationSelected: onDestinationSelected,
    //       shadowColor: _materialData.shadowColor,
    //       surfaceTintColor: _materialData.surfaceTintColor,
    //       destinations: navigationDestinations,
    //     ),
    //     cupertino: (_) => BottomNavigationBar(
    //       backgroundColor: backgroundColor,
    //       currentIndex: selectedIndex,
    //       elevation: elevation,
    //       fixedColor: _cupertinoData.fixedColor,
    //       iconSize: _cupertinoData.iconSize,
    //       landscapeLayout: _cupertinoData.landscapeLayout,
    //       onTap: onDestinationSelected,
    //       showSelectedLabels: _cupertinoData.showSelectedLabels,
    //       showUnselectedLabels: _cupertinoData.showUnselectedLabels,
    //       type: _cupertinoData.type,
    //       selectedItemColor: _cupertinoData.selectedItemColor,
    //       unselectedItemColor: _cupertinoData.unselectedItemColor,
    //       selectedFontSize: _cupertinoData.selectedFontSize,
    //       unselectedFontSize: _cupertinoData.unselectedFontSize,
    //       items: bottomNavigationItems,
    //     ),
    //   );
  }
}

class _MaterialBottomNavData {
  final Duration animationDuration;
  final double? height;
  final Color? indicatorColor;
  final Color? selectedLabel;
  // final ShapeBorder? indicatorShape;
  final NavigationDestinationLabelBehavior labelBehavior;
  final Color? shadowColor;
  // final Color? surfaceTintColor;

  const _MaterialBottomNavData({
    this.animationDuration = const Duration(milliseconds: 270),
    this.height,
    this.indicatorColor,
    this.selectedLabel,
    // this.indicatorShape,
    this.labelBehavior = NavigationDestinationLabelBehavior.alwaysShow,
    this.shadowColor,
    // this.surfaceTintColor,
  });

  _MaterialBottomNavData copyWith({
    Duration? animationDuration,
    double? height,
    Color? indicatorColor,
    Color? selectedLabel,
    // ShapeBorder? indicatorShape,
    NavigationDestinationLabelBehavior? labelBehavior,
    Color? shadowColor,
    Color? surfaceTintColor,
  }) =>
      _MaterialBottomNavData(
        animationDuration: animationDuration ?? this.animationDuration,
        height: height ?? this.height,
        indicatorColor: indicatorColor ?? this.indicatorColor,
        selectedLabel: selectedLabel ?? this.selectedLabel,
        // indicatorShape: indicatorShape ?? this.indicatorShape,
        labelBehavior: labelBehavior ?? this.labelBehavior,
        shadowColor: shadowColor ?? this.shadowColor,
        // surfaceTintColor: surfaceTintColor ?? this.surfaceTintColor,
      );
}

class _CupertinoBottomNavData {
  final Color? selectedItemColor;
  final Color? unselectedItemColor;
  final BottomNavigationBarLandscapeLayout landscapeLayout;
  final Color? fixedColor;
  final double iconSize;
  final bool? showSelectedLabels;
  final bool? showUnselectedLabels;
  final BottomNavigationBarType type;
  final double selectedFontSize;
  final double unselectedFontSize;

  const _CupertinoBottomNavData({
    this.selectedItemColor,
    this.unselectedItemColor,
    this.landscapeLayout = BottomNavigationBarLandscapeLayout.linear,
    this.fixedColor,
    this.iconSize = 24.0,
    this.showSelectedLabels,
    this.showUnselectedLabels,
    this.type = BottomNavigationBarType.fixed,
    this.selectedFontSize = 14.0,
    this.unselectedFontSize = 12.0,
  });

  _CupertinoBottomNavData copyWith({
    Color? selectedItemColor,
    Color? unselectedItemColor,
    BottomNavigationBarLandscapeLayout? landscapeLayout,
    Color? fixedColor,
    double? iconSize,
    bool? showSelectedLabels,
    bool? showUnselectedLabels,
    BottomNavigationBarType? type,
    double? selectedFontSize,
    double? unselectedFontSize,
  }) =>
      _CupertinoBottomNavData(
        selectedItemColor: selectedItemColor ?? this.selectedItemColor,
        unselectedItemColor: unselectedItemColor ?? this.unselectedItemColor,
        landscapeLayout: landscapeLayout ?? this.landscapeLayout,
        fixedColor: fixedColor ?? this.fixedColor,
        iconSize: iconSize ?? this.iconSize,
        showSelectedLabels: showSelectedLabels ?? this.showSelectedLabels,
        showUnselectedLabels: showUnselectedLabels ?? this.showUnselectedLabels,
        type: type ?? this.type,
        selectedFontSize: selectedFontSize ?? this.selectedFontSize,
        unselectedFontSize: unselectedFontSize ?? this.unselectedFontSize,
      );
}

class AdaptiveNavigationBarItem {
  final Widget icon;
  final Widget? activeIcon;
  final String label;
  // final Color activeLabel;
  final Color? backgroundColor;
  final String? tooltip;

  const AdaptiveNavigationBarItem({
    required this.icon,
    this.activeIcon,
    required this.label,
    // required this.activeLabel,
    this.backgroundColor,
    this.tooltip,
  });

  BottomNavigationBarItem get bottomNavigationBarItem =>
      BottomNavigationBarItem(
        icon: icon,
        label: label,
        activeIcon: activeIcon,
        backgroundColor: backgroundColor,
        tooltip: tooltip,
      );

  NavigationDestination get navigationDestination => NavigationDestination(
        icon: icon,
        label: label,
        tooltip: tooltip,
        selectedIcon: activeIcon,
      );
}
