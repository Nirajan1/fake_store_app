import 'package:fake_store_app/binding/controller_binding.dart';
import 'package:fake_store_app/view/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      defaultTransition: Transition.fadeIn,
      transitionDuration: const Duration(seconds: 3),
      initialBinding: ControllerBiding(),
      home: const HomeView(),
    );
  }
}
