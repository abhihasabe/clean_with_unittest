import 'package:clean_unittest/feature/domain/entities/movie_genre_entity.dart';

class MovieGenreDto {
  final List<MovieGenreEntity> genres;

  MovieGenreDto({required this.genres});

  factory MovieGenreDto.fromJson(Map<String, dynamic> json) {
    return MovieGenreDto(genres: parseMovieGenres(json['genres']));
  }
  static List<MovieGenreEntity> parseMovieGenres(json) {
    var list = json as List;
    List<MovieGenreEntity> movieGenres =
        list.map((data) => MovieGenreModel.toMovieGenre(MovieGenreModel.fromJson(data))).toList();
    return movieGenres;
  }
}

class MovieGenreModel extends MovieGenreEntity {
  final int id;
  final String name;

  MovieGenreModel({required this.id, required this.name}) : super(id: id, name: name);

  factory MovieGenreModel.fromJson(Map<String, dynamic> json) {
    return MovieGenreModel(id: json['id'], name: json['name']);
  }
  static MovieGenreEntity toMovieGenre(MovieGenreModel input) {
    return MovieGenreEntity(id: input.id, name: input.name);
  }
}
