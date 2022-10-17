import 'package:hive/hive.dart';

part 'lang_status_model.g.dart';

@HiveType(typeId: 2)
class LangStatus {
  @HiveField(0)
  bool isSelected;
  @HiveField(1)
  final String buttonText;
  @HiveField(2)
  final String title;
  @HiveField(3)
  final String subtitle;

  LangStatus(this.isSelected, this.buttonText, this.title, this.subtitle);
}
