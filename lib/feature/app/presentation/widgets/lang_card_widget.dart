import 'package:clean_unittest/feature/app/presentation/bloc_cubits/app_cubit.dart';
import 'package:clean_unittest/feature/app/data/models/lang_status_model.dart';
import 'package:clean_unittest/core/constants/app_route_constant.dart';
import 'package:clean_unittest/config/theme/app_dimension.dart';
import 'package:clean_unittest/config/theme/app_colors.dart';
import 'package:provider/src/provider.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter/material.dart';

class LangCard extends StatelessWidget {
  final LangStatus langStatus;

  const LangCard(this.langStatus, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var brightness = MediaQueryData.fromWindow(WidgetsBinding.instance.window)
        .platformBrightness;
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: DIMENSION_100,
      child: Card(
        color: langStatus.isSelected
            ? (brightness == Brightness.dark)
                ? cardDarkColor
                : const Color(0xffece2e4)
            : cardColor,
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
                      child: Text(langStatus.buttonText,
                          style: TextStyle(
                              color: langStatus.isSelected
                                  ? Colors.white
                                  : Colors.black,
                              //fontWeight: FontWeight.bold,
                              fontSize: 18.0)),
                    ),
                    decoration: BoxDecoration(
                      color: langStatus.isSelected
                          ? primaryColor
                          : Colors.transparent,
                      border: Border.all(
                          width: 1.0,
                          color: langStatus.isSelected
                              ? primaryColor
                              : Colors.grey),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(2.0)),
                    ),
                  ),
                  title: Text(langStatus.title,
                      style: TextStyle(
                          color:
                              langStatus.isSelected ? textColor : Colors.black,
                          fontSize: 18.0)),
                  subtitle: Text(langStatus.subtitle,
                      style: TextStyle(
                          color:
                              langStatus.isSelected ? textColor : Colors.black,
                          fontSize: 14.0)),
                  onTap: () {
                    if (langStatus.subtitle == "English") {
                      context.read<AppCubit>().changeLang('en');
                      goToDashboard(context);
                    } else if (langStatus.subtitle == "Spanish") {
                      context.read<AppCubit>().changeLang('es');
                      goToDashboard(context);
                    } else if (langStatus.subtitle == "Hindi") {
                      context.read<AppCubit>().changeLang('hi');
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
