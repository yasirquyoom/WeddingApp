import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:wedding_app/app/routes/app_pages.dart';
import 'package:wedding_app/utilities/check_internet_connection.dart';
import 'package:wedding_app/utilities/veriable_utilites.dart';

///0 - USER
///
///1 - PHOTOGRAPHER
///2 - EVENTCREATOR

int userCode = 2;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  VariableUtilities.storage = GetStorage("WeddingApp");
  DependencyInjection.init();
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}