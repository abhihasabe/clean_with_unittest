import 'package:clean_unittest/feature/presentation/bloc_cubits/splash_cubit/splash_state.dart';
import 'package:clean_unittest/feature/presentation/bloc_cubits/splash_cubit/splash_cubit.dart';
import 'package:clean_unittest/feature/presentation/widgets/logo_widget.dart';
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
    context.read<SplashCubit>().checkAccount();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: Center(
            child: BlocListener<SplashCubit, SplashState>(
          listener: (_, state) {
            if (state is SplashToWelcome) {
              VxNavigator.of(context)
                  .push(Uri.parse(AppRouteConstants.loginScreen));
            }
            if (state is SplashToHome) {
              VxNavigator.of(context)
                  .push(Uri.parse(AppRouteConstants.homeScreen));
            }
          },
          child: const LogoWidget(),
        )));
  }
}
