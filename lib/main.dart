import 'package:flutter/material.dart';
import 'package:myvcapp/blocs/user_infromation_bloc.dart';
import 'package:provider/provider.dart';
import './routes/routeconfig.dart';
import 'screens/splash.dart';

void main() => runApp(
  stateMag()
);

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final PageStorageBucket bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
            body: SplashScreen(),
          ),
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}

class stateMag extends StatefulWidget {
  @override
  _stateMagState createState() => _stateMagState();
}

class _stateMagState extends State<stateMag> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=>UserInformation(),
      child: MyApp());
  }
}