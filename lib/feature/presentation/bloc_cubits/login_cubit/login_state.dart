import 'package:clean_unittest/core/validations/password_validation.dart';
import 'package:clean_unittest/core/validations/email_validation.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

class LoginState extends Equatable {
  const LoginState(
      {this.email = const Email.pure(),
      this.password = const Password.pure(),
      this.status = FormzStatus.pure,
      this.exceptionError = "",
      this.outPut = ""});

  final Email email;
  final Password password;
  final FormzStatus status;
  final String exceptionError;
  final Object outPut;

  @override
  List<Object> get props => [email, password, status, exceptionError, outPut];

  LoginState copyWith({
    Email? email,
    Password? password,
    FormzStatus? status,
    String? exceptionError,
    Object? outPut,
  }) {
    return LoginState(
        email: email ?? this.email,
        password: password ?? this.password,
        status: status ?? this.status,
        exceptionError: exceptionError ?? this.exceptionError,
        outPut: outPut ?? this.outPut);
  }
}
