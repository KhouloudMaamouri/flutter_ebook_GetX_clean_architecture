import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/app_routes.dart';
import 'package:getx/routes.dart';
import 'package:hive/hive.dart';
import 'features/get_books/data/data_sources/local/entityCache/books_cache_entity.dart';
import 'features/get_books/data/data_sources/local/entityCache/new_books_cache_entity.dart';
import 'injection_container.dart' as di;
import 'package:path_provider/path_provider.dart' as path_provider;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
  initHiveAndRegisterAdapters();
}

void initHiveAndRegisterAdapters() async{
  final appDocumentDirectory =
  await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  Hive.registerAdapter(NewBooksCacheEntityAdapter());
  Hive.registerAdapter(BooksCacheEntityAdapter());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'GetxTuto',
      initialRoute: AppRoutes.books,
      getPages: routes,
    );
  }
}
