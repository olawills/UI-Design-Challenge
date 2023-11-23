// ignore_for_file: deprecated_member_use

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:livestream_app/app/core/presentation/widgets/adaptive/adaptive_bottom_navigation.dart';
import 'package:livestream_app/managers/navigation/app_router.dart';
import 'package:livestream_app/utils/assets.gen.dart';
import 'package:livestream_app/utils/palette/colors.dart';

class Destination {
  final int id;
  final String icon;
  final String label;
  final PageRouteInfo<dynamic> router;

  const Destination({
    required this.id,
    required this.icon,
    required this.label,
    required this.router,
  });

  @override
  bool operator ==(other) {
    if (identical(this, other)) return true;
    return other is Destination &&
        identical(other.id, id) &&
        identical(other.label, label);
  }

  static List<Destination> get list => [
        const Destination(
          id: 1,
          icon: AssetsIcons.icMessageSVG,
          label: 'Message',
          router: HomeScreenRoute(),
        ),
        const Destination(
          id: 2,
          icon: AssetsIcons.icPhoneCallSVG,
          label: 'Calls',
          router: CallScreenRoute(),
        ),
        const Destination(
          id: 3,
          icon: AssetsIcons.icAccountSVG,
          label: 'Contact',
          router: ContactScreenRoute(),
        ),
        const Destination(
          id: 4,
          icon: AssetsIcons.icSettingsSVG,
          label: 'Settings',
          router: SettingsScreenRoute(),
        ),
      ];

  @override
  int get hashCode => Object.hash(id, label);

  @override
  String toString() => 'Destination(id: $id, label: $label)';

  static List<AdaptiveNavigationBarItem> buildNav(BuildContext context) {
    return list
        .map((e) => AdaptiveNavigationBarItem(
              // backgroundColor: Colors.white,
              icon: SvgPicture.asset(
                e.icon,
                color: const Color(0xFF797C7B),
              ),
              activeIcon: SvgPicture.asset(
                e.icon,
                color: DesignColors.initialIcon,
              ),
              label: e.label,
              tooltip: e.label,
            ))
        .toList();
  }
}
