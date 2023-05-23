import 'package:flutter/material.dart';

/// Navigator pushNamed shortcut
void nextScreen(BuildContext context, String route) {
  Navigator.of(context).pushNamed(route);
}
