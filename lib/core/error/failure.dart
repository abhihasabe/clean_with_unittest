import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  @override
  List<Object?> get props => [];
}

class ServerFailure extends Failure {
  String? message;

  ServerFailure({this.message = ""});

  @override
  List<Object?> get props => [this.message];
}
