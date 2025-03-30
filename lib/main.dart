import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive_ce/hive.dart';
import 'package:hive_ce_web_issue/hive/hive_registrar.g.dart';
import 'package:hive_ce_web_issue/hive_model.dart';
import 'package:hive_ce_web_issue/my_storage.dart';

void main() async {
  Hive
    ..init(kIsWeb ? null : Directory.current.path)
    ..registerAdapters();
  await MyStorage.instance.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          spacing: 12,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton(
              onPressed: () {
                MyStorage.instance.putData(HiveModel(id: 1, name: 'Test Data'));
              },
              child: const Text('Add/Update'),
            ),
            FilledButton(
              onPressed: () async {
                List<HiveModel> loaded = await MyStorage.instance.getAllData();
                if (loaded.isEmpty) {
                  print('No data found');
                } else {
                  for (var sound in loaded) {
                    print('Data: ${sound.name}');
                  }
                }
              },
              child: const Text('Load All'),
            ),
          ],
        ),
      ),
    );
  }
}
