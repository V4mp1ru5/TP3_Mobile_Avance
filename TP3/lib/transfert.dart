import 'package:json_annotation/json_annotation.dart';

part 'transfert.g.dart';


@JsonSerializable()
class Task {
  Task();


  String id = '';
  String name = '';
  int percentageDone = 0;
  double percentageTimePassed = 0;
  DateTime creationDate = DateTime.now();
  DateTime deadline = DateTime.now();

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);

  Map<String, dynamic> toJson() => _$TaskToJson(this);
}