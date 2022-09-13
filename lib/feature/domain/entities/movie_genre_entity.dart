import 'package:equatable/equatable.dart';

class MovieGenreEntity extends Equatable {
  final int id;
  final String name;

  const MovieGenreEntity({
    required this.id,
    required this.name
  });

  @override
  List<Object> get props => [id, name];
}