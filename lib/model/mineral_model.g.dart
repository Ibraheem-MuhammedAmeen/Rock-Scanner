// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mineral_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MineralRockModelAdapter extends TypeAdapter<MineralRockModel> {
  @override
  final int typeId = 3;

  @override
  MineralRockModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MineralRockModel(
      name: fields[0] as String,
      desc: fields[1] as String,
      image: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, MineralRockModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.desc)
      ..writeByte(2)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MineralRockModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
