

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:taskmanager/Controller/binding.dart';
import 'package:taskmanager/Helper/theme.dart';
import 'package:taskmanager/Services/Service.dart';
import 'package:taskmanager/Services/Themes_Service.dart';
import 'package:taskmanager/View/home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Get.putAsync(() => StorageService().init());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Task Manager',
      debugShowCheckedModeBanner: false,
      theme: Themes.light,
      darkTheme: Themes.light,
      themeMode: ThemeServices().theme,

      home: const HomePage(),
      initialBinding: HomeBinding(),
      builder: EasyLoading.init(),

    );
  }
}


