// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lead_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LeadModelAdapter extends TypeAdapter<LeadModel> {
  @override
  final int typeId = 0;

  @override
  LeadModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LeadModel(
      id: fields[0] as String,
      name: fields[1] as String,
      phone: fields[2] as String,
      city: fields[3] as String,
      state: fields[4] as String,
      type: fields[5] as String,
      notes: fields[6] as String,
      createdAt: fields[7] as DateTime,
      isActive: fields[8] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, LeadModel obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.phone)
      ..writeByte(3)
      ..write(obj.city)
      ..writeByte(4)
      ..write(obj.state)
      ..writeByte(5)
      ..write(obj.type)
      ..writeByte(6)
      ..write(obj.notes)
      ..writeByte(7)
      ..write(obj.createdAt)
      ..writeByte(8)
      ..write(obj.isActive);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LeadModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
