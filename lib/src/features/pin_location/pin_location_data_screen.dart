import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:map_assignment/src/core/core.dart';
import 'package:map_assignment/src/core/utils/latlng_x.dart';
import 'package:map_assignment/src/features/map_display/presentations/cubit/map_display_cubit.dart';

class PinLocationDataScreen extends StatelessWidget {
  const PinLocationDataScreen({super.key});
  
  void _copyToClipboard(BuildContext context, String textToCopy) {
    Clipboard.setData(ClipboardData(text: textToCopy)).then((_) {
      AppSnackBar.showInfoSnackBar(context.tr.messageCopyToClipboard);
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<MapDisplayCubit>().state;
    return Scaffold(
      appBar: AppBar(title: Text(context.tr.titlePinLocation)),
      body: Padding(
        padding: kPadding20,
        child: Center(
          child: RichText(
            text: TextSpan(
              text: context.tr.selectedPinLocation(
                  state.selectedLocation.getLocationString(),
                  ),
              style: context.getTextTheme().labelLarge,
              children: [
                TextSpan(
                  text: context.tr.actionCopy,
                  style: const TextStyle(color: Colors.red),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      _copyToClipboard(context, state.selectedLocation.toString());
                    },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
