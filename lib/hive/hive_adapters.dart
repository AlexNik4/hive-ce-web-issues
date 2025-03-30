import 'package:hive_ce/hive.dart';
import 'package:hive_ce_web_issue/hive_model.dart';

part 'hive_adapters.g.dart';

@GenerateAdapters([AdapterSpec<HiveModel>()])
// Annotations must be on some element
// ignore: unused_element
void _() {}
