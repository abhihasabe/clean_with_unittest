// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ThemeEntityAdapter extends TypeAdapter<ThemeEntity> {
  @override
  final int typeId = 3;

  @override
  ThemeEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ThemeEntity(
      appTheme: fields[1] as String?,
    )..id = fields[0] as int;
  }

  @override
  void write(BinaryWriter writer, ThemeEntity obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.appTheme);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ThemeEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
