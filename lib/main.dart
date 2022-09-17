import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:local_database2/pages/home_page.dart';
import 'package:local_database2/pages/sign_up.dart';

void main() async{
  await Hive.initFlutter();
  await Hive.openBox('data');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SignUp(),
      routes: {
        SignUp.id: (context) => SignUp(),
        HomePage.id: (context) => HomePage()
      },
    );
  }
}

