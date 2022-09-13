import 'package:clean_unittest/feature/domain/entities/movie_genre_entity.dart';
import 'package:clean_unittest/feature/domain/usecases/login_usecase.dart';
import 'package:clean_unittest/core/error/failure.dart';
import 'package:either_dart/either.dart';

abstract class ThemeRepository {
  Future<dynamic> getThemeData(String key);
  Future<dynamic> addThemeData(String key, String value);
}