import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:map_assignment/src/core/core.dart';
import 'package:map_assignment/src/features/map_download/presentations/cubit/map_download_cubit.dart';

class MapDownloadScreen extends StatelessWidget {
  const MapDownloadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<MapDownloadCubit, UiState<bool>>(
        listener: (context, state) {
          state.handleStateWithEasyLoading(
            context,
            onSuccess: (_) {
              context.go(AppRoutes.home);
            },
          );
        },
        child: Scaffold(
          appBar: AppBar(title: Text(context.tr.titleMapDownload)),
          body: Center(
            child: ElevatedButton(
              onPressed: () {
                context.read<MapDownloadCubit>().download();
              },
              child: Text(context.tr.actionProceed),
            ),
          ),
        ));
  }
}
