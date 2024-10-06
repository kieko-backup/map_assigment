import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router_flow/go_router_flow.dart';
import 'package:latlong2/latlong.dart';
import 'package:map_assignment/src/features/map_display/presentations/map_display_screen.dart';
import 'package:map_assignment/src/features/map_download/presentations/cubit/map_download_cubit.dart';
import 'package:map_assignment/src/features/map_download/presentations/map_download_screen.dart';
import 'package:map_assignment/src/features/pin_location/pin_location_data_screen.dart';

class AppRoutes {
  static const String download = '/download';
  static const String home = '/';
  static const String pinLocation = '/pin-location';

  static String? routeNavigate;
  static void setRouteNavigate(String route) {
    routeNavigate = route;
  }
}

GoRouter createRouter(BuildContext context, {String? initialLocation}) {
  return GoRouter(
    routes: [
      GoRoute(
        path: AppRoutes.download,
        builder: (_, __) => const MapDownloadScreen(),
      ),
      GoRoute(
        path: AppRoutes.home,
        builder: (_, state) => MapDisplayScreen(
          filePath: state.queryParams["filePath"] ?? "",
        ),
      ),
      GoRoute(
        path: AppRoutes.pinLocation,
        builder: (_, __) => const PinLocationDataScreen(),
      ),
    ],
    initialLocation: initialLocation,
    debugLogDiagnostics: kDebugMode,
    refreshListenable:
        GoRouterRefreshStream(context.watch<MapDownloadCubit>().stream),
    redirect: (context, state) {
      final isAlreadyDownload =
          context.read<MapDownloadCubit>().state.data ?? false;
      const downloadLocation = '/download';
      final inDownLoadPage = state.subloc == downloadLocation;
      if (!isAlreadyDownload) {
        return inDownLoadPage ? null : downloadLocation;
      }
      if (isAlreadyDownload && inDownLoadPage) {
        return AppRoutes.routeNavigate ?? '/';
      }
      return null;
    },
  );
}

class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen(
          (dynamic _) => notifyListeners(),
        );
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
