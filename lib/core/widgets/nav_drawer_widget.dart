import 'package:clean_unittest/core/constants/app_route_constant.dart';
import 'package:clean_unittest/core/localization/app_localization.dart';
import 'package:clean_unittest/feature/auth/presentation/bloc_cubits/auth_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter/material.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).backgroundColor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          SizedBox(
            height: 190,
            child: UserAccountsDrawerHeader(
              accountName: const Text("Abhijeet Patel",
                  style: TextStyle(color: Colors.white, fontSize: 20)),
              accountEmail: const Text("abhihasabe8@gmail.com",
                  style: TextStyle(color: Colors.white, fontSize: 14)),
              currentAccountPicture: Padding(
                padding: const EdgeInsets.only(top: 18.0),
                child: CircleAvatar(
                  backgroundColor: Theme.of(context).backgroundColor,
                  child: Image.asset("assets/icons/human.png", scale: 5),
                ),
              ),
            ),
          ),
          ListTile(
            title: Text("${AppLocalization.of(context)!.translate('home')}",
                style: Theme.of(context).textTheme.titleSmall),
            leading: Icon(Icons.home, color: Theme.of(context).iconTheme.color),
            onTap: () {
              Navigator.of(context).pop(false);
            },
          ),
          ListTile(
            title: Text("${AppLocalization.of(context)!.translate('lang')}",
                style: Theme.of(context).textTheme.titleSmall),
            leading:
                Icon(Icons.language, color: Theme.of(context).iconTheme.color),
            onTap: () {
              Navigator.of(context).pop(false);
              VxNavigator.of(context)
                  .push(Uri.parse(AppRouteConstants.langScreen));
            },
          ),
          ListTile(
            title: Text("${AppLocalization.of(context)!.translate('theme')}",
                style: Theme.of(context).textTheme.titleSmall),
            leading: Icon(Icons.color_lens_outlined,
                color: Theme.of(context).iconTheme.color),
            onTap: () {
              Navigator.of(context).pop(false);
              VxNavigator.of(context)
                  .push(Uri.parse(AppRouteConstants.themeScreen));
            },
          ),
          ListTile(
            title: Text("${AppLocalization.of(context)!.translate('logout')}",
                style: Theme.of(context).textTheme.titleSmall),
            leading:
                Icon(Icons.logout, color: Theme.of(context).iconTheme.color),
            onTap: () {
              context.read<AuthCubit>().logout();
              Navigator.of(context).pop(false);
              VxNavigator.of(context)
                  .clearAndPush(Uri.parse(AppRouteConstants.loginScreen));
            },
          ),
        ],
      ),
    );
  }
}
