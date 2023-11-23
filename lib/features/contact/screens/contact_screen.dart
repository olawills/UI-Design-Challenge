library contact_screen.dart;

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage(name: 'ContactScreenRoute')
class ContactScreen extends StatefulWidget implements AutoRouteWrapper {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return this;
  }
}

class _ContactScreenState extends State<ContactScreen> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
