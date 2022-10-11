import 'package:clean_unittest/feature/auth/presentation/bloc_cubits/auth_cubit.dart';
import 'package:clean_unittest/feature/language/presentation/bloc_cubits/lang_cubit.dart';
import 'package:clean_unittest/feature/splash/presentation/bloc_cubits/splash_cubit.dart';
import 'package:clean_unittest/feature/theme/presentation/bloc_cubits/theme_cubit.dart';
import 'package:clean_unittest/feature/app/presentation/bloc_cubits/app_state.dart';
import 'package:clean_unittest/feature/app/presentation/bloc_cubits/app_cubit.dart';
import 'package:clean_unittest/core/localization/app_localization.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:clean_unittest/core/manager/route_manager.dart';
import 'package:clean_unittest/core/local_db/hive_box.dart';
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

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => locator<AppCubit>()),
        BlocProvider(create: (context) => locator<ThemeCubit>()),
        BlocProvider(create: (context) => locator<LangCubit>()),
        BlocProvider(create: (context) => di.locator<SplashCubit>()),
        BlocProvider(create: (context) => di.locator<AuthCubit>())
      ],
      child: BlocBuilder<AppCubit, AppState>(builder: (context, state) {
        return MaterialApp.router(
          useInheritedMediaQuery: true,
          title: 'Clean Arch with unit Test',
          debugShowCheckedModeBanner: false,
          theme: AppThemes.lightTheme,
          darkTheme: AppThemes.darkTheme,
          themeMode:
              context.select((AppCubit appCubit) => appCubit.state.themeMode),
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
