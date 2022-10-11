import 'package:clean_unittest/feature/auth/domain/entities/reg_entity.dart';
import 'package:equatable/equatable.dart';

class RegModel extends Equatable {
  int? userId;
  String? firstName;
  String? lastName;
  String? email;
  String? mobileNumber;
  String? profileId;
  bool? isActive;
  String? token;

  RegModel(
      {this.userId,
      this.firstName,
      this.lastName,
      this.email,
      this.mobileNumber,
      this.profileId,
      this.isActive,
      this.token});

  RegModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    mobileNumber = json['mobileNumber'];
    profileId = json['profileId'];
    isActive = json['isActive'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['email'] = email;
    data['mobileNumber'] = mobileNumber;
    data['profileId'] = profileId;
    data['isActive'] = isActive;
    data['token'] = token;
    return data;
  }

  RegEntity toEntity() => RegEntity(
      userId: userId,
      firstName: firstName,
      lastName: lastName,
      email: email,
      mobileNumber: mobileNumber,
      profileId: profileId,
      isActive: isActive,
      token: token);

  @override
  // TODO: implement props
  List<Object?> get props => [
        userId,
        firstName,
        lastName,
        email,
        mobileNumber,
        profileId,
        isActive,
        token
      ];
}
