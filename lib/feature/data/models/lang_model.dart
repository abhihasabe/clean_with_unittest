import 'package:hive/hive.dart';
part 'lang_model.g.dart';

@HiveType(typeId: 1)
class LangEntity {
  @HiveField(0)
  int id = 0;
  @HiveField(1)
  String? appLang;

  LangEntity({this.appLang});

  get getLang => appLang;

  set setLang(lang) => appLang = lang;

  @override
  String toString() {
    return 'LangEntity(id: $id, fullName: $appLang)';
  }
}
