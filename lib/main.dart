import 'package:flutter/material.dart';
import 'package:student_info/home_page.dart';
import 'data_provider.dart';
import 'package:provider/provider.dart';

import 'listView.dart';
import 'listviewprovider.dart';
void main() {
  runApp(MultiProvider(
    providers: [
    ChangeNotifierProvider(create: (context) => DataProvider(),),
    ChangeNotifierProvider(create: (context) => ListViewDataProvider(),)
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       
        primarySwatch: Colors.blue,
      ),
      home: ListViewData(),
    );
  }
}

