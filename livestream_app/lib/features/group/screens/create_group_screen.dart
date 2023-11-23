library create_group_screen.dart;

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:livestream_app/utils/extensions/num_extension.dart';

@RoutePage()
class CreateGroupScreen extends StatelessWidget implements AutoRouteWrapper {
  const CreateGroupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        actions: const [],
      ),
      body: SafeArea(
        child: Column(
          children: [
            20.sbh,
            const Text('Group Description'),
            const Text('Make Group for Team Work'),
            10.sbh,
            Row(
              children: [
                Container(),
                Container(),
              ],
            ),
            20.sbh,
          ],
        ),
      ),
    );
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return this;
  }
}
