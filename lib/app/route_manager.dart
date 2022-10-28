import 'package:flutter/material.dart';

class RouteManager {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.arguments) {
      default:
        throw Exception('Invalid route');
    }
  }
}
