import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

/// Navigator pushNamed shortcut
void nextScreen(BuildContext context, String route) {
  context.router.pushNamed(route);
}
