import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_marketplace/app/config/routes/app_pages.dart';
import 'package:mobile_marketplace/app/config/themes/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.basic,
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
    );
  }
}