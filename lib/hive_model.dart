import 'package:hive_ce/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'hive_model.g.dart';

@JsonSerializable()
class HiveModel extends HiveObject {
  final int id;
  final String name;

  HiveModel({required this.id, required this.name});

  factory HiveModel.fromJson(Map<String, dynamic> json) =>
      _$HiveModelFromJson(json);

  Map<String, dynamic> toJson() => _$HiveModelToJson(this);
}
