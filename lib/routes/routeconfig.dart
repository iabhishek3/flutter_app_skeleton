import 'package:flutter/material.dart';
import 'package:flutter_widget/screens/chats.dart';
import 'package:flutter_widget/screens/setting.dart';
import 'package:flutter_widget/screens/profile.dart';
import 'package:flutter_widget/screens/login.dart';
import 'package:flutter_widget/screens/signup.dart';
import '../main.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => MyApp());
      case '/Profile':
        return MaterialPageRoute(builder: (_) => profile());
      case '/Settings':
        return MaterialPageRoute(builder: (_) => setting());
      case '/Logout':
        return MaterialPageRoute(builder: (_) => LoginPage());
      case '/Signup':
        return MaterialPageRoute(builder: (_) => Signup());

      case '/Chat':
      // Validation of correct data type
        if (args is String) {
          return MaterialPageRoute(
            builder: (_) => Chats(
              data: args,
            ),
          );
        }
        // If args is not of the correct type, return an error page.
        // You can also throw an exception while in development.
        return _errorRoute();
      default:
      // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}