import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:map_assignment/src/core/core.dart';

class AppSnackBar {
  static final scaffoldMessageKey = GlobalKey<ScaffoldMessengerState>();

  static showErrorSnackBar(String message) {
    message.showErrorSnackBar(scaffoldMessageKey.currentContext!);
  }

  static showWarningSnackBar(String message) {
    message.showErrorSnackBar(scaffoldMessageKey.currentContext!);
  }

  static showInfoSnackBar(String message) {
    message.showInfoSnackBar(scaffoldMessageKey.currentContext!);
  }

  static _showSnackBar(BuildContext context, String message, LogType type) {
    if (scaffoldMessageKey.currentState == null) return;
    scaffoldMessageKey.currentState!
        .showSnackBar(_createAppSnackBar(message, type: type));
  }
}

extension SnackBarX on String {
  showErrorSnackBar(BuildContext context) {
    AppSnackBar._showSnackBar(context, this, LogType.error);
  }

  showWarningSnackBar(BuildContext context) {
    AppSnackBar._showSnackBar(context, this, LogType.warning);
  }

  showInfoSnackBar(BuildContext context) {
    AppSnackBar._showSnackBar(context, this, LogType.info);
  }

  showDebugSnackBar(BuildContext context) {
    if (!kDebugMode) return;
    AppSnackBar._showSnackBar(context, this, LogType.debug);
  }
}

const Duration _snackBarDisplayDuration = Duration(milliseconds: 2000);
SnackBar _createAppSnackBar(
  String message, {
  LogType type = LogType.info,
}) {
  return SnackBar(
    content: Row(
      children: [
        Icon(type.icon, color: type.foreground),
        kSpaceHorizontal16,
        Expanded(
          child: Text(message, style: TextStyle(color: type.foreground)),
        ),
      ],
    ),
    duration: _snackBarDisplayDuration,
    backgroundColor: type.background,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(16)),
    ),
    behavior: SnackBarBehavior.floating,
  );
}
