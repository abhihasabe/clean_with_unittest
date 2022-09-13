import 'package:clean_unittest/config/theme/cubit/themes/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.line_weight_sharp,
          size: 30,
          color: Theme.of(context).appBarTheme.iconTheme?.color,
        ),
        title: Text(
          "Home",
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
        actions: [
          Icon(
            Icons.login_outlined,
            size: 30,
            color: Theme.of(context).appBarTheme.iconTheme?.color,
          ),
          const SizedBox(
            width: 20,
          )
        ],
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 50,
            child: FlatButton(
              color: Theme.of(context).buttonTheme.colorScheme?.background,
              textColor: Theme.of(context).buttonTheme.colorScheme?.primary,
              onPressed: () {
                context.read<ThemeCubit>().changeTheme(ThemeMode.light);
              },
              child: const Text(
                'LIGHT',
                style: TextStyle(fontSize: 20.0),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 50,
            child: FlatButton(
              color: Theme.of(context).buttonTheme.colorScheme?.background,
              textColor: Theme.of(context).buttonTheme.colorScheme?.primary,
              onPressed: () {
                context.read<ThemeCubit>().changeTheme(ThemeMode.dark);
              },
              child: const Text(
                'DARK',
                style: TextStyle(fontSize: 20.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
