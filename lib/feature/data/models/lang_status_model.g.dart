// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lang_status_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LangStatusAdapter extends TypeAdapter<LangStatus> {
  @override
  final int typeId = 2;

  @override
  LangStatus read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LangStatus(
      fields[0] as bool,
      fields[1] as String,
      fields[2] as String,
      fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, LangStatus obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.isSelected)
      ..writeByte(1)
      ..write(obj.buttonText)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.subtitle);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LangStatusAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
