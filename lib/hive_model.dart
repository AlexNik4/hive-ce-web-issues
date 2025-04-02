import 'package:hive_ce/hive.dart';

class HiveModel extends HiveObject {
  final int id;
  final String name;

  HiveModel({required this.id, required this.name});

  factory HiveModel.fromJson(Map<String, dynamic> json) {
    return HiveModel(id: json['id'] as int, name: json['name'] as String);
  }

  Map<String, dynamic> toJson() => {'id': id, 'name': name};
}
