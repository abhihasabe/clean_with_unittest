import 'package:equatable/equatable.dart';

abstract class SplashState extends Equatable {
  const SplashState();

  @override
  List<Object> get props => [];
}

class SplashInitial extends SplashState {}

class SplashToHome extends SplashState {
  final String? message;

  const SplashToHome({this.message});
}

class SplashToLogin extends SplashState {
  final String? message;

  const SplashToLogin({this.message});
}
