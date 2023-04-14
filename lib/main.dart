// ignore_for_file: use_key_in_widget_constructors, unused_import

import 'package:flutter/material.dart';
import '/pages/nav.dart';
import '/pages/home.dart';
import 'pages/api.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CS101',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                  Color.fromARGB(255, 5, 2, 2),
                  Color.fromARGB(255, 61, 0, 0)
                ])),
            child: Column(
              children: [
              Nav(),
              HomePage()
              ],
            ),
          ),
          ),
      )
    );
  }
}
