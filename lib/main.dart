import 'package:demo_skill_mine/scoped-models/MainModel.dart';
import 'package:demo_skill_mine/screens/DashboardScreen.dart';
import 'package:demo_skill_mine/screens/DetailsScreen.dart';
import 'package:demo_skill_mine/screens/SplashScreen.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final MainModel _model = MainModel();

  @override
  Widget build(BuildContext context) {
    return ScopedModel<MainModel>(
      model: _model,
      child: ScopedModelDescendant<MainModel>(
        builder: (BuildContext context, Widget child, MainModel model) {
          return MaterialApp(
            title: 'Skill Mine',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: SplashScreen(
              model: _model,
            ),
            routes: {
              "/dashBoard": (context) => DashboardScreen(model: _model,),
              "/details": (context) => DetailsScreen(model: _model,),
            },
          );
        },
      ),
    );
  }
}
