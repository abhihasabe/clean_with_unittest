import 'package:clean_unittest/feature/splash/presentation/bloc_cubits/splash_cubit.dart';
import 'package:clean_unittest/feature/splash/presentation/bloc_cubits/splash_state.dart';
import 'package:clean_unittest/feature/splash/presentation/widgets/logo_widget.dart';
import 'package:clean_unittest/core/constants/app_cache_constant.dart';
import 'package:clean_unittest/core/constants/app_route_constant.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(milliseconds: 3000), () {
      context.read<SplashCubit>().checkAccount(CacheConstants.users);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          body: BlocConsumer<SplashCubit, SplashState>(
              listener: (context, state) {
            if (state is SplashToLogin) {
              showScreen(SplashToLogin);
            }
            if (state is SplashToHome) {
              showScreen(SplashToHome);
            }
          }, builder: (context, state) {
            return const LogoWidget();
          })),
    );
  }

  showScreen(Type screenType) async {
    if (screenType == SplashToLogin) {
      VxNavigator.of(context)
          .clearAndPush(Uri.parse(AppRouteConstants.loginScreen));
    } else if (screenType == SplashToHome) {
      VxNavigator.of(context)
          .clearAndPush(Uri.parse(AppRouteConstants.homeScreen));
    }
  }
}
