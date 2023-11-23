library settings_screen.dart;

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage(name: 'SettingsScreenRoute')
class SettingsScreen extends StatefulWidget implements AutoRouteWrapper {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return this;
  }
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
