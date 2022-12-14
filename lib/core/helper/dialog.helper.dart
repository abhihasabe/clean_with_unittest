import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DialogHelper {
  /*static Future<void> launchURL(String url) async{
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw "Couldn't launch URL";
    }
  }*/

  static Future<void> showLoadingDialog(BuildContext context) async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return WillPopScope(
            onWillPop: () async => false,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        });
  }

  static showLoaderDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: Row(
        children: [
          const CircularProgressIndicator(),
          Container(
              margin: const EdgeInsets.only(left: 7),
              child: const Text("Loading...")),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  static showToast(BuildContext context, String msg) {
    return Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        fontSize: 16,
        backgroundColor: Colors.black12,
        webShowClose: true,
        textColor: Colors.black);
  }

  static void dismissDialog(BuildContext context) {
    Navigator?.of(context, rootNavigator: true).pop();
  }

  /*static ScaffoldFeatureController<SnackBar, SnackBarClosedReason>
      showSnackBars(String text, Color bgColor, BuildContext context) {
    final snackBar = SnackBar(content: Text(text), backgroundColor: bgColor);
    return Scaffold.of(context).showSnackBar(snackBar);
  }*/

  static void dismissKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  void _onLoading(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              CircularProgressIndicator(),
              Text("Loading"),
            ],
          ),
        );
      },
    );
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pop(context); //pop dialog
    });
  }

  static Future showScaleAlertBox({
    BuildContext? context,
    Widget? yourWidget,
//    Widget icon,
    Widget? title,
    Widget? firstButton,
    Widget? secondButton,
  }) {
    assert(context != null, "context is null!!");
    assert(yourWidget != null, "yourWidget is null!!");
    assert(firstButton != null, "button is null!!");
    return showGeneralDialog(
        barrierColor: Colors.black.withOpacity(0.7),
        transitionBuilder: (context, a1, a2, widget) {
          return Transform.scale(
            scale: a1.value,
            child: Opacity(
              opacity: a1.value,
              child: AlertDialog(
                shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0)),
                title: title,
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
//                    icon,
                    yourWidget!
                  ],
                ),
                actions: <Widget>[
                  firstButton!,
                  secondButton!,
                ],
              ),
            ),
          );
        },
        transitionDuration: const Duration(milliseconds: 250),
        barrierDismissible: false,
        barrierLabel: '',
        context: context!,
        pageBuilder: (context, animation1, animation2) {
          return yourWidget!;
        });
  }

  static buildLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

//DialogHelper.dismissDialog(context);
//DialogHelper.showDialog(context);
