// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../app/data/models/lang_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LangEntityAdapter extends TypeAdapter<LangEntity> {
  @override
  final int typeId = 1;

  @override
  LangEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LangEntity(
      appLang: fields[1] as String?,
    )..id = fields[0] as int;
  }

  @override
  void write(BinaryWriter writer, LangEntity obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.appLang);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LangEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
