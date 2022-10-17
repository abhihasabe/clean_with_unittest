import 'package:clean_unittest/config/theme/app_colors.dart';
import 'package:clean_unittest/feature/app/presentation/widgets/theme_card_widget.dart';
import 'package:clean_unittest/feature/app/presentation/bloc_cubits/app_cubit.dart';
import 'package:clean_unittest/feature/app/presentation/bloc_cubits/app_state.dart';
import 'package:clean_unittest/feature/app/data/models/lang_status_model.dart';
import 'package:clean_unittest/core/localization/app_localization.dart';
import 'package:clean_unittest/core/helper/dialog.helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class Themes extends StatefulWidget {
  const Themes({Key? key}) : super(key: key);

  @override
  State<Themes> createState() => _ThemeState();
}

class _ThemeState extends State<Themes> {
  List<LangStatus> langStatus = <LangStatus>[];
  bool isLight = false, isDark = false;

  getData(ThemeMode themeMode) {
    themeMode == ThemeMode.light ? isLight = true : isDark = true;
    langStatus.add(LangStatus(isDark, 'D', 'Dark', 'dark'));
    langStatus.add(LangStatus(isLight, 'L', 'Light', 'light'));
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<AppCubit>().getTheme();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          title: Text(
            "${AppLocalization.of(context)?.translate('theme')}",
            style: Theme.of(context).appBarTheme.titleTextStyle,
          ),
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          elevation: 1,
        ),
        body: BlocConsumer<AppCubit, AppState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is AppState) {
                WidgetsBinding.instance
                    .addPostFrameCallback((_) => getData(state.themeMode!));
                return Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: ListView.builder(
                    itemCount: 2,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        splashColor: primaryColor,
                        onTap: () {
                          setState(() {
                            for (var element in langStatus) {
                              element.isSelected = false;
                            }
                            langStatus[index].isSelected = true;
                          });
                        },
                        child: langStatus.isNotEmpty
                            ? ThemeCard(themeMode: langStatus[index])
                            : Container(),
                      );
                    },
                  ),
                ); //ThemeCard(themeMode: langStatus);
              }
              return DialogHelper.buildLoading();
            }));
  }
}
