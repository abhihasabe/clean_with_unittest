import 'package:clean_unittest/feature/data/models/login_model.dart';
import 'package:equatable/equatable.dart';

class LoginEntity extends Equatable{
  int? success;
  String? message;
  Data? data;

  LoginEntity({this.success, this.message, this.data});

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}