// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'advisormodel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AdvisorAdapter extends TypeAdapter<Advisor> {
  @override
  final int typeId = 1;

  @override
  Advisor read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Advisor(
      fields[0] as String,
      fields[2] as String,
      fields[3] as String,
      fields[1] as String,
      fields[4] == null ? false : fields[4] as bool,
      fields[5] == null ? [] : (fields[5] as List).cast<ServiceModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, Advisor obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.avatar)
      ..writeByte(2)
      ..write(obj.introduction)
      ..writeByte(3)
      ..write(obj.about)
      ..writeByte(4)
      ..write(obj.liked)
      ..writeByte(5)
      ..write(obj.services);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AdvisorAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Advisor _$AdvisorFromJson(Map<String, dynamic> json) => Advisor(
      json['advisor_name'] as String,
      json['advisor_desc'] as String,
      json['about'] as String,
      json['advisor_avatar'] as String,
      json['liked'] as bool,
      (json['services'] as List<dynamic>)
          .map((e) => ServiceModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AdvisorToJson(Advisor instance) => <String, dynamic>{
      'advisor_name': instance.name,
      'advisor_avatar': instance.avatar,
      'advisor_desc': instance.introduction,
      'about': instance.about,
      'liked': instance.liked,
      'services': instance.services,
    };
