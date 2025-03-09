import 'package:flutter/material.dart';
import 'package:flutter_golang_yt/screens/Home_screen.dart';
import 'package:flutter_golang_yt/screens/add_task.dart';
import 'package:flutter_golang_yt/screens/all_task.dart';
import 'package:flutter_golang_yt/screens/login.dart';
import 'package:flutter_golang_yt/screens/register.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyRegister(),
    );
  }
}
