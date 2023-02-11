
import 'package:covid_api_api/view/animated_first_page.dart';
import 'package:flutter/material.dart';


void main(){
  runApp(MyApp());
}


class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Covid App",
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blueGrey,

      ),

      home: animatedFirstPage(),
    );
  }
}


