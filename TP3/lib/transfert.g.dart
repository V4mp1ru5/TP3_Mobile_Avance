// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transfert.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Task _$TaskFromJson(Map<String, dynamic> json) => Task()
  ..id = json['id'] as String
  ..name = json['name'] as String
  ..percentageDone = (json['percentageDone'] as num).toInt()
  ..percentageTimePassed = (json['percentageTimePassed'] as num).toDouble()
  ..creationDate = DateTime.parse(json['creationDate'] as String)
  ..deadline = DateTime.parse(json['deadline'] as String);

Map<String, dynamic> _$TaskToJson(Task instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'percentageDone': instance.percentageDone,
      'percentageTimePassed': instance.percentageTimePassed,
      'creationDate': instance.creationDate.toIso8601String(),
      'deadline': instance.deadline.toIso8601String(),
    };
