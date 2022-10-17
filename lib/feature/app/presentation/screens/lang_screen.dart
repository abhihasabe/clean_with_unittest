import 'package:clean_unittest/feature/app/presentation/widgets/lang_card_widget.dart';
import 'package:clean_unittest/feature/app/data/models/lang_status_model.dart';
import 'package:clean_unittest/core/localization/app_localization.dart';
import 'package:clean_unittest/config/theme/app_colors.dart';
import 'package:flutter/material.dart';

class LangScreen extends StatefulWidget {
  const LangScreen({Key? key}) : super(key: key);

  @override
  createState() {
    return _LangScreen();
  }
}

class _LangScreen extends State<LangScreen> {
  List<LangStatus> langData = <LangStatus>[];
  bool? enStatus, spStatus, hiStatus;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => getData());
  }

  getData() {
    enStatus = AppLocalization.of(context)?.isEnLocale;
    spStatus = AppLocalization.of(context)?.isSpLocale;
    hiStatus = AppLocalization.of(context)?.isHiLocale;
    langData.add(LangStatus(enStatus!, 'E', 'English', 'English'));
    langData.add(LangStatus(spStatus!, 'S', 'Spanish', 'Spanish'));
    langData.add(LangStatus(hiStatus!, 'H', 'Hindi', 'Hindi'));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        elevation: 1,
        title: Text("${AppLocalization.of(context)?.translate('lang')}"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 4.0),
        child: ListView.builder(
          itemCount: langData.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              splashColor: primaryColor,
              onTap: () {
                setState(() {
                  for (var element in langData) {
                    element.isSelected = false;
                  }
                  langData[index].isSelected = true;
                });
              },
              child: LangCard(langData[index]),
            );
          },
        ),
      ),
    );
  }
}
