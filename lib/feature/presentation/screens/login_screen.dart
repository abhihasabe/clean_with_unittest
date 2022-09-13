import 'package:clean_unittest/feature/presentation/bloc_cubits/login_cubit/login_cubit.dart';
import 'package:clean_unittest/feature/presentation/bloc_cubits/login_cubit/login_state.dart';
import 'package:clean_unittest/core/constants/app_route_constant.dart';
import 'package:clean_unittest/core/helper/dialog.helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<LoginCubit, LoginState>(listener: (context, state) {
        if (state.status.isSubmissionFailure) {
          DialogHelper.dismissDialog(context);
          DialogHelper.showSnackBars(state.exceptionError, Colors.red, context);
        } else if (state.status.isSubmissionSuccess) {
          DialogHelper.dismissDialog(context);
          DialogHelper.showSnackBars(
              state.outPut.toString(), Colors.green, context);
          VxNavigator.of(context)
              .clearAndPush(Uri.parse(AppRouteConstants.homeScreen));
        } else if (state.status.isSubmissionInProgress) {
          DialogHelper.showLoaderDialog(context);
        }
      }, builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextField(
                controller: userNameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'User Name',
                ),
                onChanged: (name) =>
                    context.read<LoginCubit>().emailChanged(name),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
                onChanged: (password) =>
                    context.read<LoginCubit>().passwordChanged(password),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: FlatButton(
                  color: Colors.blueAccent,
                  textColor: Colors.white,
                  onPressed: () {
                    context.read<LoginCubit>().userLogin();
                  },
                  child: const Text(
                    'LOGIN',
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
