import 'package:flutter/material.dart';
import 'package:my_app/CalculateGame.dart';
import 'package:my_app/WrapDemo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

//  @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(primaryColor: Colors.black),
//       home: CalculateGame(),
//     );
//   }

  // @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     debugShowCheckedModeBanner: false,
  //     theme: ThemeData(primaryColor: Colors.black),
  //     home: LayoutDemo(),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.black),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter App'),
          toolbarHeight: 24,
        ),
        body: LayoutDemo(),
      ),
    );
  }
}
