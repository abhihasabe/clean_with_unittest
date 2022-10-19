import 'package:clean_unittest/feature/auth/presentation/bloc_cubits/auth_cubit.dart';
import 'package:clean_unittest/feature/auth/presentation/bloc_cubits/auth_state.dart';
import 'package:clean_unittest/core/localization/app_localization.dart';
import 'package:clean_unittest/core/constants/app_route_constant.dart';
import 'package:clean_unittest/core/helper/dialog.helper.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';

class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  TextEditingController fNameController = TextEditingController();
  TextEditingController lNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool get isPopulated =>
      fNameController.text.isNotEmpty &&
      lNameController.text.isNotEmpty &&
      emailController.text.isNotEmpty &&
      phoneController.text.isNotEmpty &&
      passwordController.text.isNotEmpty;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  }

  @override
  Widget build(BuildContext context) {
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
              .clearAndPush(Uri(path: AppRouteConstants.loginScreen));
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
                    child: Text(
                      '${AppLocalization.of(context)!.translate('signup')}',
                      style: const TextStyle(fontSize: 20),
                    )),
                TextFormField(
                  controller: fNameController,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: AppLocalization.of(context)!.translate('fName'),
                    errorText: state.fName.invalid
                        ? AppLocalization.of(context)!.translate('pefName')
                        : null,
                  ),
                  validator: (value) {
                    AppLocalization.of(context)!.translate('pefName');
                  },
                  onChanged: (name) {
                    context.read<AuthCubit>().fNameChanged(name);
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: lNameController,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: AppLocalization.of(context)!.translate('lName'),
                    errorText: state.lName.invalid
                        ? AppLocalization.of(context)!.translate('pelName')
                        : null,
                  ),
                  validator: (value) {
                    AppLocalization.of(context)!.translate('pelName');
                  },
                  onChanged: (password) {
                    context.read<AuthCubit>().lNameChanged(password);
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: AppLocalization.of(context)!.translate('email'),
                    errorText: state.email.invalid
                        ? AppLocalization.of(context)!.translate('peeid')
                        : null,
                  ),
                  validator: (value) {
                    AppLocalization.of(context)!.translate('peeid');
                  },
                  onChanged: (name) {
                    context.read<AuthCubit>().emailChanged(name);
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: phoneController,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText:
                        AppLocalization.of(context)!.translate('mnumber'),
                    errorText: state.number.invalid
                        ? AppLocalization.of(context)!.translate('pemn')
                        : null,
                  ),
                  validator: (value) {
                    AppLocalization.of(context)!.translate('pemn');
                  },
                  onChanged: (name) {
                    context.read<AuthCubit>().numberChanged(name);
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: passwordController,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText:
                        AppLocalization.of(context)!.translate('password'),
                    errorText: state.password.invalid
                        ? AppLocalization.of(context)!.translate('pepass')
                        : null,
                  ),
                  validator: (value) {
                    AppLocalization.of(context)!.translate('pepass');
                  },
                  onChanged: (password) {
                    context.read<AuthCubit>().passwordChanged(password);
                  },
                ),
                const SizedBox(height: 20),
                SizedBox(
                    height: 50,
                    child: ElevatedButton(
                        style: Theme.of(context).elevatedButtonTheme.style,
                        onPressed: isPopulated && state.status.isValidated
                            ? () {
                                context.read<AuthCubit>().userReg();
                              }
                            : null,
                        child: Text('${AppLocalization.of(context)!.translate('signup')}'))),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('${AppLocalization.of(context)!.translate('dhaccount')}'),
                    TextButton(
                      child: Text('${AppLocalization.of(context)!.translate('signin')}',
                          style: Theme.of(context).textTheme.bodyText1),
                      onPressed: () {
                        VxNavigator.of(context).clearAndPush(
                            Uri.parse(AppRouteConstants.loginScreen));
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
