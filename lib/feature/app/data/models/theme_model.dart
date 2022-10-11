import 'package:hive/hive.dart';
part 'theme_model.g.dart';

@HiveType(typeId: 3)
class ThemeEntity {
  @HiveField(0)
  int id = 0;
  @HiveField(1)
  String? appTheme;

  ThemeEntity({this.appTheme});

  get getTheme => appTheme;

  set setTheme(theme) => appTheme = theme;

  @override
  String toString() {
    return 'ThemeEntity(id: $id, fullName: $appTheme)';
  }
}
