import 'package:json_annotation/json_annotation.dart';

part 'transfert.g.dart';


@JsonSerializable()
class SpecialUlrichTask {
  SpecialUlrichTask();


  String id = '';
  String name = '';
  int percentageDone = 0;
  double percentageTimePassed = 0;
  String imageUrl = '';
  DateTime creationDate = DateTime.now();
  DateTime deadline = DateTime.now();

  factory SpecialUlrichTask.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);

  Map<String, dynamic> toJson() => _$TaskToJson(this);
}