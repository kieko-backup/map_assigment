import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:map_assignment/src/core/core.dart';
import 'package:map_assignment/src/features/map_display/presentations/cubit/map_display_cubit.dart';
import 'package:map_assignment/src/features/map_download/presentations/cubit/map_download_cubit.dart';

import 'app/presentations/cubit/app_cubit.dart';

class AssigmentApp extends StatefulWidget {
  const AssigmentApp({super.key});

  static Future<Widget> create() async {
    await configureDependencies();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => di.get<AppCubit>()..loadSettings(),
        ),
        BlocProvider(
          create: (context) => di.get<MapDownloadCubit>()..loadMapStatus(),
        ),
         BlocProvider(
          create: (context) => di.get<MapDisplayCubit>()..load(),
        ),
      ],
      child: Builder(builder: (context) => const AssigmentApp()),
    );
  }
  @override
  State<AssigmentApp> createState() => _AssigmentAppState();
}

class _AssigmentAppState extends State<AssigmentApp> {
  late final router = createRouter(context);

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppCubit>().state;
    return MaterialApp.router(
      restorationScopeId: 'assigment-app',
      scaffoldMessengerKey: AppSnackBar.scaffoldMessageKey,
      locale: Locale(appState.languageCode),
      localizationsDelegates: delegates,
      supportedLocales: supportedLocales,
      debugShowCheckedModeBanner: false,
      onGenerateTitle: (context) => context.tr.appTitle,
      themeMode: appState.themeMode,
      theme: Themes.lightTheme,
      darkTheme: Themes.darkTheme,
      builder: EasyLoading.init(),
      routerDelegate: router.routerDelegate,
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
    );
  }
}
