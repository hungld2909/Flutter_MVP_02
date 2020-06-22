import 'package:MVP_flutter/view/my_home_page.dart';
import 'package:flutter/material.dart';
import 'package:MVP_flutter/presenter/presenter.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "",
      home: MyHomePage(new BasicAppPresenter(),title: "Demo MVP"), //! sử dụng BasicAppPresenter()
    );
  }
}