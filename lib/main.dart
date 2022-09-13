import 'package:clean_unittest/feature/presentation/bloc_cubits/splash_cubit/splash_cubit.dart';
import 'package:clean_unittest/feature/presentation/bloc_cubits/login_cubit/login_cubit.dart';
import 'package:clean_unittest/config/theme/cubit/themes/theme_cubit.dart';
import 'package:clean_unittest/config/theme/cubit/themes/theme_state.dart';
import 'package:clean_unittest/core/localization/app_localization.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:clean_unittest/core/manager/route_manager.dart';
import 'package:clean_unittest/core/manager/hive_manager.dart';
import 'package:clean_unittest/config/theme/app_theme.dart';
import 'package:clean_unittest/di/injection.dart' as di;
import 'package:clean_unittest/di/injection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveBox.create();
  await di.init().whenComplete(() {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<ThemeCubit>()),
        BlocProvider(create: (context) => di.getIt<SplashCubit>()),
        BlocProvider(create: (context) => di.getIt<LoginCubit>())
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(builder: (context, state) {
        return MaterialApp.router(
          useInheritedMediaQuery: true,
          title: 'Clean Arch with unit Test',
          debugShowCheckedModeBanner: false,
          theme: AppThemes.lightTheme,
          darkTheme: AppThemes.darkTheme,
          themeMode: context
              .select((ThemeCubit themeCubit) => themeCubit.state.themeMode),
          routeInformationParser: VxInformationParser(),
          routerDelegate: Routes.routerDelegate,
          locale: state.locale,
          localizationsDelegates: const [
            AppLocalization.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en', ''), // English, no country code
            Locale('hi', ''), // English, no country code
            Locale('es', ''), // Spanish, no country code
          ],
          localeResolutionCallback: (locale, supportedLocales) {
            for (var supportedLocale in supportedLocales) {
              if (supportedLocale.languageCode == locale?.languageCode) {
                return supportedLocale;
              }
            }
            return supportedLocales.first;
          },
        );
      }),
    );
  }
}
