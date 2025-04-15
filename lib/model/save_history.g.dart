// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'save_history.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SaveHistoryAdapter extends TypeAdapter<SaveHistory> {
  @override
  final int typeId = 4;

  @override
  SaveHistory read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SaveHistory(
      answer: fields[0] as String,
      base64Image: fields[1] as String,
      time: fields[2] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, SaveHistory obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.answer)
      ..writeByte(1)
      ..write(obj.base64Image)
      ..writeByte(2)
      ..write(obj.time);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SaveHistoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
