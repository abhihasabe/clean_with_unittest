import 'package:clean_unittest/core/manager/route_manager.dart';
import 'package:clean_unittest/injection.dart' as di;
import 'package:clean_unittest/feature/presentation/bloc_cubits/splash_cubit/splash_cubit.dart';
import 'package:clean_unittest/feature/presentation/screens/splash_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter/material.dart';

void main() async {
  /*await di.init();
  runApp(const MyApp());*/

  await di.init().whenComplete(() {
    Future.delayed(Duration(seconds: 2)).whenComplete(() {
      runApp(const MyApp());
    });
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => di.getIt<SplashCubit>())],
      child: const MaterialApp(
        useInheritedMediaQuery: true,
        title: 'Clean Arch with unit Test',
        debugShowCheckedModeBanner: false,
        home: Splash(),
      ),
    );
  }
}
