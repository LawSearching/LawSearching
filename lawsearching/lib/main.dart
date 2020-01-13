import 'package:flutter/material.dart';
import 'main_page.dart';

void main() => runApp(LawSearching());

class LawSearching extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "LawSearchingApp",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
    );
  }
}