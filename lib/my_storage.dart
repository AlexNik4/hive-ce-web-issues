import 'package:hive_ce/hive.dart';
import 'package:hive_ce_web_issue/hive_model.dart';

class MyStorage {
  static final MyStorage instance = MyStorage._internal();
  MyStorage._internal();

  static const String _myBoxName = 'simple_box';
  late CollectionBox _simpleBox;

  Future<void> init() async {
    final collection = await BoxCollection.open('collection_storage', {
      _myBoxName,
    });

    _simpleBox = await collection.openBox<HiveModel>(
      _myBoxName,
      fromJson: HiveModel.fromJson,
    );
  }

  /// Update/Create an entry in the sounds metadata box.
  Future<void> putData(HiveModel model) {
    return _simpleBox.put(model.id.toString(), model);
  }

  /// Get all the sounds metadata.
  Future<List<HiveModel>> getAllData() async {
    final data = <HiveModel>[];
    try {
      final keys = await _simpleBox.getAllKeys();
      for (String key in keys) {
        final sound = await _simpleBox.get(key);
        if (sound != null) {
          data.add(sound);
        }
      }
    } catch (e) {
      print('Error getting all data: $e');
    }
    return data;
  }
}
