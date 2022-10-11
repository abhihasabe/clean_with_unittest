import 'package:equatable/equatable.dart';

class LoginEntity extends Equatable {
  String? token;

  LoginEntity({this.token});

  @override
  // TODO: implement props
  List<Object?> get props => [token];
}
