import 'package:clean_unittest/feature/language/data/models/lang_status_model.dart';
import 'package:clean_unittest/feature/theme/data/models/theme_model.dart';
import 'package:clean_unittest/feature/language/data/models/lang_model.dart';
import 'package:clean_unittest/core/constants/app_db_constants.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveBox {
  static Future create() async {
    await Hive.initFlutter();
    Hive.registerAdapter(LangEntityAdapter());
    Hive.registerAdapter(LangStatusAdapter());
    Hive.registerAdapter(ThemeEntityAdapter());
    await Hive.openBox(AppDBConstants.dbName);
  }
}
