import 'package:flutter/material.dart';

extension StateExtensions<T extends StatefulWidget> on State<T> {
  void setStateIfMounted(
    VoidCallback fn, {
    VoidCallback? orElse,
  }) {
    if (!mounted) {
      orElse?.call();
      return;
    }
    // ignore: invalid_use_of_protected_member
    setState(fn);
  }
}
