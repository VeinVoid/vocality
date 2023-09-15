import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocality/config/cf_routing.dart';
import 'package:vocality/view/vw_main.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0x444466)),
        useMaterial3: true,
      ),
      initialRoute: '/',
      getPages: RouteConfig().routes,
    );
  }
}