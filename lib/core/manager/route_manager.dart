import 'package:clean_unittest/feature/splash/presentation/screens/splash_screen.dart';
import 'package:clean_unittest/feature/auth/presentation/screens/login_screen.dart';
import 'package:clean_unittest/feature/app/presentation/screens/theme_screen.dart';
import 'package:clean_unittest/feature/home/presentation/screens/home_screen.dart';
import 'package:clean_unittest/feature/app/presentation/screens/lang_screen.dart';
import 'package:clean_unittest/feature/auth/presentation/screens/reg_screen.dart';
import 'package:clean_unittest/core/constants/app_route_constant.dart';
import 'package:velocity_x/velocity_x.dart';

class Routes {
  static VxNavigator routerDelegate = VxNavigator(routes: {
    AppRouteConstants.initialScreen: (uri, params) {
      return VxRoutePage(pageName: "/splash", child: const Splash());
    },
    AppRouteConstants.loginScreen: (uri, params) {
      return VxRoutePage(pageName: "/login", child: const Login());
    },
    AppRouteConstants.registerScreen: (uri, params) {
      return VxRoutePage(pageName: "/register", child: const Registration());
    },
    AppRouteConstants.homeScreen: (uri, params) {
      return VxRoutePage(pageName: "/home", child: const Home());
    },
    AppRouteConstants.forgotPasswordScreen: (uri, params) {
      return VxRoutePage(pageName: "/forgotPassword", child: const Home());
    },
    AppRouteConstants.langScreen: (uri, params) {
      return VxRoutePage(pageName: "/languages", child: const LangScreen());
    },
    AppRouteConstants.themeScreen: (uri, params) {
      return VxRoutePage(pageName: "/theme", child: const Themes());
    },
  });
}
