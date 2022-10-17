import 'package:clean_unittest/core/localization/app_localization.dart';
import 'package:clean_unittest/widgets/nav_drawer_widget.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      drawer: const NavDrawer(),
      appBar: AppBar(
        title: Text(
          "${AppLocalization.of(context)!.translate('home')}",
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
        actions: [
          Icon(
            Icons.exit_to_app,
            size: 30,
            color: Theme.of(context).appBarTheme.iconTheme?.color,
          ),
          const SizedBox(
            width: 20,
          )
        ],
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        elevation: 1,
      ),
      body: Center(
          child: Text("${AppLocalization.of(context)!.translate('home')}",
              style: Theme.of(context).textTheme.titleLarge)),
    );
  }
}
