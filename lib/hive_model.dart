import 'package:hive_ce/hive.dart';

class HiveModel extends HiveObject {
  final int id;
  final String name;

  HiveModel({required this.id, required this.name});
}
