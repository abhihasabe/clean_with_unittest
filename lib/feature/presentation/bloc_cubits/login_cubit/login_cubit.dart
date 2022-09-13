import 'package:clean_unittest/core/constants/app_cache_constant.dart';
import 'package:clean_unittest/feature/data/sources/cache_source/cache_source.dart';
import 'package:clean_unittest/feature/presentation/bloc_cubits/login_cubit/login_state.dart';
import 'package:clean_unittest/feature/domain/usecases/login_usecase.dart';
import 'package:clean_unittest/core/validations/password_validation.dart';
import 'package:clean_unittest/core/validations/email_validation.dart';
import 'package:clean_unittest/feature/data/models/login_model.dart';
import 'package:clean_unittest/core/error/failure.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:either_dart/either.dart';
import 'package:formz/formz.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase loginUseCase;
  final CacheDataSource? cacheDataSource;

  LoginCubit({required this.loginUseCase, this.cacheDataSource})
      : super(const LoginState());

  void emailChanged(String value) {
    final email = Email.dirty(value);
    emit(state.copyWith(
      email: email,
      status: Formz.validate([email, state.email, state.password]),
    ));
  }

  void passwordChanged(String value) {
    final password = Password.dirty(value);
    emit(state.copyWith(
      password: password,
      status: Formz.validate([password, state.email, state.password]),
    ));
  }

  Future<void> userLogin() async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    loginUseCase
        .invoke(User(email: state.email.value, password: state.password.value))
        .then((loginResp) {
      _eitherLoadedOrErrorState(loginResp);
    }).catchError((e) {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    });
  }

  // auth_screen logout
  Future logout() async {}

  Future<void> _eitherLoadedOrErrorState(
      Either<Failure, dynamic> loginResp) async {
    loginResp.fold(
        (failure) => {
              emit(state.copyWith(
                  status: FormzStatus.submissionFailure,
                  exceptionError: failure.toString()))
            }, (right) {
          print("right: $right");
      LoginModel loginResp = LoginModel.fromJson(right);
      if (loginResp.success == 0) {
        emit(state.copyWith(
            status: FormzStatus.submissionFailure,
            exceptionError: loginResp.message));
      } else if (loginResp.success == 1) {
        emit(state.copyWith(
            status: FormzStatus.submissionSuccess, outPut: loginResp.message));
        cacheDataSource
            ?.saveStringData(CacheConstants.users, loginResp.data?.email)
            .then((value) async {
          var userData =
              await cacheDataSource?.getStringData(CacheConstants.users);
          print("userData: $userData");
        });
      }
    });
  }
}
