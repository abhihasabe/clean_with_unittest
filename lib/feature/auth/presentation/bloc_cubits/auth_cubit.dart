import 'package:clean_unittest/core/validations/field_validation.dart';
import 'package:clean_unittest/core/validations/number_validation_dart.dart';
import 'package:clean_unittest/feature/auth/domain/entities/login_entity.dart';
import 'package:clean_unittest/feature/auth/domain/entities/reg_entity.dart';
import 'package:clean_unittest/feature/auth/presentation/bloc_cubits/auth_state.dart';
import 'package:clean_unittest/feature/auth/domain/usecases/login_usecase.dart';
import 'package:clean_unittest/feature/auth/domain/usecases/reg_usecase.dart';
import 'package:clean_unittest/core/validations/password_validation.dart';
import 'package:clean_unittest/core/validations/email_validation.dart';
import 'package:clean_unittest/core/error/failure.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:either_dart/either.dart';
import 'package:formz/formz.dart';

class AuthCubit extends Cubit<AuthState> {
  final LoginUseCase loginUseCase;
  final RegUseCase regUseCase;

  AuthCubit({required this.loginUseCase, required this.regUseCase})
      : super(const AuthState());

  void fNameChanged(String value) {
    final fName = Field.dirty(value);
    emit(state.copyWith(
      fName: fName,
      status: Formz.validate([fName, state.email, state.password]),
    ));
  }

  void lNameChanged(String value) {
    final lName = Field.dirty(value);
    emit(state.copyWith(
      lName: lName,
      status: Formz.validate([lName, state.email, state.password]),
    ));
  }

  void numberChanged(String value) {
    final number = Number.dirty(value);
    emit(state.copyWith(
      number: number,
      status: Formz.validate([number, state.email, state.password]),
    ));
  }

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
    final data = await loginUseCase
        .invoke(LoginParams(
            email: state.email.value, password: state.password.value))
        .then((resp) => _eitherLoadedOrErrorState(resp));
  }

  Future<void> userReg() async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    regUseCase
        .invoke(RegisterParams(
            fName: state.fName.value,
            lName: state.lName.value,
            number: state.number.value,
            email: state.email.value,
            password: state.password.value))
        .then((resp) => _eitherLoadedOrErrorState(resp));
  }

  Future<void> _eitherLoadedOrErrorState(Either<Failure, dynamic> resp) async {
    resp.fold((failure) {
      if (failure is ServerFailure) {
        emit(state.copyWith(
            status: FormzStatus.submissionFailure,
            exceptionError: failure.message));
      }
    }, (success) {
      if (success is LoginEntity) {
        emit(state.copyWith(
            status: FormzStatus.submissionSuccess, outPut: success.token));
      } else if (success is RegEntity) {
        emit(state.copyWith(
            status: FormzStatus.submissionSuccess, outPut: success));
      }
    });
  }

  // auth_screen logout
  Future logout() async {}
}
