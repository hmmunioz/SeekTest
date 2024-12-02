import 'package:flutter/material.dart';

Future<void> showCustomModal(
  BuildContext context, {
  required Widget child,
}) {
  return showModalBottomSheet(
    useSafeArea: true,
    context: context,
    builder: (context) => child,
  );
}
