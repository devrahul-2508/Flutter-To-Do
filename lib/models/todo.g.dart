// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ToDOAdapter extends TypeAdapter<ToDO> {
  @override
  final int typeId = 1;

  @override
  ToDO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ToDO(
      todo: fields[0] as String,
    )..isCompleted = fields[1] as bool;
  }

  @override
  void write(BinaryWriter writer, ToDO obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.todo)
      ..writeByte(1)
      ..write(obj.isCompleted);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ToDOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
