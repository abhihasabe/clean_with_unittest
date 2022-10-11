import 'package:clean_unittest/feature/auth/presentation/bloc_cubits/auth_cubit.dart';
import 'package:clean_unittest/feature/auth/presentation/bloc_cubits/auth_state.dart';
import 'package:clean_unittest/core/localization/app_localization.dart';
import 'package:clean_unittest/core/constants/app_route_constant.dart';
import 'package:clean_unittest/core/helper/dialog.helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:formz/formz.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool get isPopulated =>
      userNameController.text.isNotEmpty && passwordController.text.isNotEmpty;

  @override
  void dispose() {
    // TODO: implement dispose
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: BlocConsumer<AuthCubit, AuthState>(listener: (context, state) {
        if (state.status.isSubmissionFailure) {
          DialogHelper.dismissDialog(context);
          DialogHelper.showToast(context, state.exceptionError.toString());
        } else if (state.status.isSubmissionSuccess) {
          DialogHelper.dismissDialog(context);
          DialogHelper.showToast(context, state.outPut.toString());
          VxNavigator.of(context)
              .clearAndPush(Uri.parse(AppRouteConstants.homeScreen));
        } else if (state.status.isSubmissionInProgress) {
          DialogHelper.showLoaderDialog(context);
        }
      }, builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: ListView(
              shrinkWrap: true,
              children: [
                Image.asset(
                  "assets/images/logo.png",
                  height: 55,
                ),
                Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    child: Text('Sign in',
                        style: Theme.of(context).textTheme.headline5)),
                TextFormField(
                    controller: userNameController,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        errorText: state.email.invalid
                            ? AppLocalization.of(context)!.translate('peeid')
                            : null,
                        border: const OutlineInputBorder(),
                        labelText: 'Email'),
                    validator: (value) {
                      AppLocalization.of(context)!.translate('peeid');
                    },
                    onChanged: (name) {
                      context.read<AuthCubit>().emailChanged(name);
                    }),
                const SizedBox(height: 10),
                TextFormField(
                    controller: passwordController,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: 'Password',
                      errorText: state.password.invalid
                          ? AppLocalization.of(context)!.translate('pepass')
                          : null,
                    ),
                    validator: (value) {
                      AppLocalization.of(context)!.translate('pepass');
                    },
                    onChanged: (password) {
                      context.read<AuthCubit>().passwordChanged(password);
                    }),
                const SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    //forgot password screen
                    VxNavigator.of(context).push(
                        Uri.parse(AppRouteConstants.forgotPasswordScreen));
                  },
                  child: Text('Forgot Password',
                      style: Theme.of(context).textTheme.bodyText1),
                ),
                Container(
                    height: 50,
                    padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                    child: ElevatedButton(
                      style: Theme.of(context).elevatedButtonTheme.style,
                      onPressed: isPopulated && state.status.isValidated
                          ? () {
                              context.read<AuthCubit>().userLogin();
                            }
                          : null,
                      child: const Text('LOGIN'),
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text('Does not have account?'),
                    TextButton(
                      child: Text('SIGN UP',
                          style: Theme.of(context).textTheme.bodyText1),
                      onPressed: () {
                        VxNavigator.of(context)
                            .push(Uri.parse(AppRouteConstants.registerScreen));
                      },
                    )
                  ],
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
