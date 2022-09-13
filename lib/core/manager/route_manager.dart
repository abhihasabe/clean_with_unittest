import 'package:clean_unittest/core/constants/app_route_constant.dart';
import 'package:clean_unittest/feature/presentation/screens/home_screen.dart';
import 'package:clean_unittest/feature/presentation/screens/login_screen.dart';
import 'package:clean_unittest/feature/presentation/screens/reg_screen.dart';
import 'package:clean_unittest/feature/presentation/screens/splash_screen.dart';
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
  });
}
