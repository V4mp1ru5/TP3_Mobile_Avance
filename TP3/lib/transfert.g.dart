// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transfert.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpecialUlrichTask _$TaskFromJson(Map<String, dynamic> json) => SpecialUlrichTask()
  ..id = json['id'] as String
  ..name = json['name'] as String
  ..percentageDone = (json['percentageDone'] as num).toInt()
  ..percentageTimePassed = (json['percentageTimePassed'] as num).toDouble()
  ..imageUrl = json['imageUrl'] as String
  ..creationDate = DateTime.parse(json['creationDate'] as String)
  ..deadline = DateTime.parse(json['deadline'] as String);

Map<String, dynamic> _$TaskToJson(SpecialUlrichTask instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'percentageDone': instance.percentageDone,
      'percentageTimePassed': instance.percentageTimePassed,
      'imageUrl': instance.imageUrl,
      'creationDate': instance.creationDate.toIso8601String(),
      'deadline': instance.deadline.toIso8601String(),
    };
