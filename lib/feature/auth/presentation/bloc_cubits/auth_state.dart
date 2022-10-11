import 'package:clean_unittest/core/validations/field_validation.dart';
import 'package:clean_unittest/core/validations/number_validation_dart.dart';
import 'package:clean_unittest/core/validations/password_validation.dart';
import 'package:clean_unittest/core/validations/email_validation.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

class AuthState extends Equatable {
  const AuthState(
      {this.fName = const Field.pure(),
      this.lName = const Field.pure(),
      this.number = const Number.pure(),
      this.email = const Email.pure(),
      this.password = const Password.pure(),
      this.status = FormzStatus.pure,
      this.exceptionError = "",
      this.outPut = ""});

  final Field fName;
  final Field lName;
  final Number number;
  final Email email;
  final Password password;
  final FormzStatus status;
  final String exceptionError;
  final Object outPut;

  @override
  List<Object> get props =>
      [fName, lName, number, email, password, status, exceptionError, outPut];

  AuthState copyWith({
    Field? fName,
    Field? lName,
    Number? number,
    Email? email,
    Password? password,
    FormzStatus? status,
    String? exceptionError,
    Object? outPut,
  }) {
    return AuthState(
        fName: fName ?? this.fName,
        lName: lName ?? this.lName,
        number: number ?? this.number,
        email: email ?? this.email,
        password: password ?? this.password,
        status: status ?? this.status,
        exceptionError: exceptionError ?? this.exceptionError,
        outPut: outPut ?? this.outPut);
  }
}
