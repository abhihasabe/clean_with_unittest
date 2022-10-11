import 'package:equatable/equatable.dart';

class RegEntity extends Equatable {
  int? userId;
  String? firstName;
  String? lastName;
  String? email;
  String? mobileNumber;
  String? profileId;
  bool? isActive;
  String? token;

  RegEntity(
      {this.userId,
      this.firstName,
      this.lastName,
      this.email,
      this.mobileNumber,
      this.profileId,
      this.isActive,
      this.token});

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
