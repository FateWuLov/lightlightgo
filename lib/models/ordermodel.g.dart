// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ordermodel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OrderAdapter extends TypeAdapter<Order> {
  @override
  final int typeId = 2;

  @override
  Order read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Order(
      fields[0] as Advisor,
      fields[1] as String,
      fields[2] as String,
    )..date = fields[3] as DateTime;
  }

  @override
  void write(BinaryWriter writer, Order obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.advisor)
      ..writeByte(1)
      ..write(obj.situation)
      ..writeByte(2)
      ..write(obj.question)
      ..writeByte(3)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrderAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Order _$OrderFromJson(Map<String, dynamic> json) => Order(
      Advisor.fromJson(json['advisor'] as Map<String, dynamic>),
      json['situation'] as String,
      json['question'] as String,
    )..date = DateTime.parse(json['date'] as String);

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
      'advisor': instance.advisor,
      'situation': instance.situation,
      'question': instance.question,
      'date': instance.date.toIso8601String(),
    };
