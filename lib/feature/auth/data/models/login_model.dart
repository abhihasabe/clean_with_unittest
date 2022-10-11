

import 'package:clean_unittest/feature/auth/domain/entities/login_entity.dart';
import 'package:equatable/equatable.dart';

class LoginModel extends Equatable {
  String? token;

  LoginModel({this.token});

  LoginModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    return data;
  }

  LoginEntity toEntity() => LoginEntity(token: token);

  @override
  List<Object?> get props => [token];
}
