// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'metamorphic_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MetamorphicRockModelAdapter extends TypeAdapter<MetamorphicRockModel> {
  @override
  final int typeId = 1;

  @override
  MetamorphicRockModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MetamorphicRockModel(
      name: fields[0] as String,
      desc: fields[1] as String,
      image: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, MetamorphicRockModel obj) {
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
      other is MetamorphicRockModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
