// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usermodel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserAdapter extends TypeAdapter<User> {
  @override
  final int typeId = 0;

  @override
  User read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return User(
      fields[0] as String,
      fields[1] as String,
      fields[2] == null ? 'Male' : fields[2] as String,
      fields[3] as DateTime,
      fields[4] as String,
      fields[5] == null
          ? 'https://samantha2022.s3.amazonaws.com/1.png'
          : fields[5] as String,
      fields[6] == null ? [] : (fields[6] as List).cast<Advisor>(),
      fields[7] == null ? [] : (fields[7] as List).cast<Advisor>(),
    );
  }

  @override
  void write(BinaryWriter writer, User obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.bio)
      ..writeByte(2)
      ..write(obj.gender)
      ..writeByte(3)
      ..write(obj.birth)
      ..writeByte(4)
      ..write(obj.about)
      ..writeByte(5)
      ..write(obj.avatar)
      ..writeByte(6)
      ..write(obj.likedList)
      ..writeByte(7)
      ..write(obj.orders);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      json['name'] as String,
      json['bio'] as String,
      json['gender'] as String? ?? '',
      json['birth'] == null ? DateTime(1999,1,1) : DateTime.parse(json['birth'] as String),
      json['aboutMe'] as String,
      json['avatar'] as String? ??
          'https://samantha2022.s3.amazonaws.com/1.png',
      (json['likedList'] as List<dynamic>?)
              ?.map((e) => Advisor.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      (json['orders'] as List<dynamic>?)
              ?.map((e) => Advisor.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'name': instance.name,
      'bio': instance.bio,
      'gender': instance.gender,
      'birth': instance.birth.toIso8601String(),
      'aboutMe': instance.about,
      'avatar': instance.avatar,
      'likedList': instance.likedList,
      'orders': instance.orders,
    };
