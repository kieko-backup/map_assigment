import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:map_assignment/src/core/core.dart';

export 'app_snack_bar.dart';
export 'dialogs/message_dialog.dart';



extension DialogContextX on BuildContext {
  Future<void> showMessageDialog({
    required String message,
    String? title,
    LogType type = LogType.info,
    Widget? icon,
    String? closeText,
    VoidCallback? onClosePressed,
    bool isDismissible = true,
  }) async {
    if (type == LogType.debug && !kDebugMode) return;
    await showModalBottomSheet(
      context: this,
      builder: (_) => MessageDialog(
        message: message,
        title: title,
        type: type,
        icon: icon,
        closeText: closeText,
      ),
      backgroundColor: Colors.transparent,
      enableDrag: false,
      isDismissible: isDismissible,
    );
    onClosePressed?.call();
  }

  showErrorDialog(String message,
      {String? title, VoidCallback? onClosePressed}) {
    Future.delayed(Duration.zero, () {
      showMessageDialog(
        title: title ?? 'ERROR',
        message: message,
        type: LogType.error,
        onClosePressed: onClosePressed,
      );
    });
  }
}


enum LogType {
  debug(Icons.bug_report_rounded, Colors.blue, Colors.white),
  info(Icons.info_rounded, Colors.green, Colors.white),
  warning(Icons.warning_rounded, Colors.amber, Colors.white),
  error(Icons.cancel_rounded, Colors.red, Colors.white),
  confirm(Icons.question_mark_rounded, Colors.green, Colors.white);

  final IconData icon;
  final Color background;
  final Color foreground;

  const LogType(this.icon, this.background, this.foreground);
}
