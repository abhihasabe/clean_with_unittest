import 'package:clean_unittest/core/error/failure.dart';
import 'package:equatable/equatable.dart';
import 'package:either_dart/either.dart';

abstract class UseCaseNoInput<Output> {
  Future<Either<Failure, Output>> invoke();
}

abstract class UseCaseOneInput<Input, Output> {
  Future<Either<Failure, Output>> invoke(Input params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}