import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:map_assignment/src/core/core.dart';


class MessageDialog extends StatelessWidget {
  const MessageDialog({
    super.key,
    required this.message,
    this.title,
    this.type = LogType.info,
    this.icon,
    this.closeText,
  }) : assert(message.length > 0);

  final String? title;
  final String message;
  final LogType type;

  final Widget? icon;
  final String? closeText;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return IconTheme(
      data: IconThemeData(color: type.background, size: 60),
      child: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            color: context.getColorScheme().background,
            borderRadius: kBorderRadiusGeometry20,
          ),
          child: Padding(
            padding: kPaddingHorizontal12 + kPaddingVertical8,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title ?? 'ALERT',
                  style: GoogleFonts.codaTextTheme(textTheme).titleMedium,
                ),
                SizedBox(height: 8),
                Divider(color: type.background),
                SizedBox(height: 8),
                Flexible(
                  child: SingleChildScrollView(
                    child: Text(
                            message,
                            style: textTheme.bodyMedium,
                            textAlign: TextAlign.center,
                          ),
                  ),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: type.background,
                    foregroundColor: type.foreground,
                    minimumSize: const Size(128, 38),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(closeText ?? 'Close'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
