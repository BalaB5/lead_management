// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'followup_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FollowUpModelAdapter extends TypeAdapter<FollowUpModel> {
  @override
  final int typeId = 1;

  @override
  FollowUpModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FollowUpModel(
      id: fields[0] as String,
      leadId: fields[1] as String,
      followUpDate: fields[2] as DateTime,
      reason: fields[3] as String,
      status: fields[4] as String,
      notes: fields[5] as String,
      createdAt: fields[6] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, FollowUpModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.leadId)
      ..writeByte(2)
      ..write(obj.followUpDate)
      ..writeByte(3)
      ..write(obj.reason)
      ..writeByte(4)
      ..write(obj.status)
      ..writeByte(5)
      ..write(obj.notes)
      ..writeByte(6)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FollowUpModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
