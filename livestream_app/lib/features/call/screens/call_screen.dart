library call_screen.dart;

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage(name: 'CallScreenRoute')
class CallScreen extends StatefulWidget implements AutoRouteWrapper {
  const CallScreen({super.key});

  @override
  State<CallScreen> createState() => _CallScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return this;
  }
}

class _CallScreenState extends State<CallScreen> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
