import 'dart:ui' as ui;
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:movie_c17_me/di.dart';
import 'package:movie_c17_me/features/home/presentation/screen/home_screen.dart';
import 'core/resources/auto_route.dart';
import 'core/resources/internet_checker.dart';
import 'features/home/data/model/MoviseResponse.dart';
import 'features/home/data/model/movies_adapter.dart';
import 'features/profile/presentation/bloc/user_bloc.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Hive.initFlutter();

  configureDependencies();
  getIt<InternetConnectivity>().initialize();


  Hive.registerAdapter(MoviesResponseAdapter());
  Hive.registerAdapter(MetaAdapter());
  Hive.registerAdapter(MigrationAdapter());
  Hive.registerAdapter(DataAdapter());
  Hive.registerAdapter(MoviesAdapter());
  Hive.registerAdapter(TorrentsAdapter());
  runApp(
    Directionality(
      textDirection: ui.TextDirection.ltr,
      child: EasyLocalization(
        supportedLocales: [Locale('en'), Locale('ar')],
        path: 'assets/translations',
        fallbackLocale: Locale('en'),
        child: BlocProvider(
          create: (context) => getIt<UserBloc>(),
          child: Directionality(
            textDirection: ui.TextDirection.ltr,
              child: MyApp()),
        ),
      ),
    ),
  );
}


class MyApp extends StatelessWidget {
  MyApp({super.key});
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          debugShowCheckedModeBanner: false,
          routerConfig: _appRouter.config(),
        );
      },
    );
  }
}
