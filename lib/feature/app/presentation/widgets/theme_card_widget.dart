import 'package:clean_unittest/feature/app/presentation/bloc_cubits/app_cubit.dart';
import 'package:clean_unittest/feature/app/data/models/lang_status_model.dart';
import 'package:clean_unittest/core/constants/app_route_constant.dart';
import 'package:clean_unittest/config/theme/app_dimension.dart';
import 'package:clean_unittest/config/theme/app_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter/material.dart';

class ThemeCard extends StatefulWidget {
  ThemeCard({Key? key, required this.themeMode}) : super(key: key);
  LangStatus? themeMode;

  @override
  State<ThemeCard> createState() => _ThemeCardState();
}

class _ThemeCardState extends State<ThemeCard> {
  @override
  Widget build(BuildContext context) {
    var brightness = MediaQueryData.fromWindow(WidgetsBinding.instance.window)
        .platformBrightness;
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: DIMENSION_90,
      child: Card(
        color: widget.themeMode!.isSelected
            ? Theme.of(context).selectedRowColor
            : Theme.of(context).cardTheme.color,
        elevation: DIMENSION_2,
        margin: const EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Row(
            children: <Widget>[
              Flexible(
                child: ListTile(
                  leading: Container(
                    height: 50.0,
                    width: 50.0,
                    child: Center(
                      child: Text(widget.themeMode!.buttonText,
                          style: TextStyle(
                              color: widget.themeMode!.isSelected
                                  ? Theme.of(context).listTileTheme.textColor
                                  : Theme.of(context).listTileTheme.textColor,
                              fontSize: 18.0)),
                    ),
                    decoration: BoxDecoration(
                      color: widget.themeMode!.isSelected
                          ? Theme.of(context).listTileTheme.textColor
                          : Theme.of(context).listTileTheme.textColor,
                      border: Border.all(
                          width: 1.0,
                          color: widget.themeMode!.isSelected
                              ? primaryColor
                              : Colors.grey),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(4.0)),
                    ),
                  ),
                  title: Text(widget.themeMode!.title,
                      style: TextStyle(
                          color: widget.themeMode!.isSelected
                              ? Theme.of(context).listTileTheme.textColor
                              : Theme.of(context).listTileTheme.textColor,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold)),
                  onTap: () {
                    if (widget.themeMode!.title == "Light") {
                      context.read<AppCubit>().changeTheme(ThemeMode.light);
                      goToDashboard(context);
                    } else if (widget.themeMode!.title == "Dark") {
                      context.read<AppCubit>().changeTheme(ThemeMode.dark);
                      goToDashboard(context);
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void goToDashboard(BuildContext context) {
    VxNavigator.of(context).push(Uri.parse(AppRouteConstants.homeScreen));
  }
}
