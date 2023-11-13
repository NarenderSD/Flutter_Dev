import 'package:admin1/screens/category_screen.dart';
import 'package:admin1/screens/inventory_management_screen.dart';
import 'package:admin1/screens/product_management_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/dashboard_screen.dart';
import 'screens/user_management_screen.dart';
import 'screens/settings_screen.dart';
import 'screens/logs_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Admin Panel',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginScreen(),
        '/dashboard': (context) => DashboardScreen(),
        '/user_management': (context) => UserManagementScreen(),
        '/settings': (context) => SettingsScreen(),
        '/logs': (context) => LogsScreen(),
        '/product_management': (context) => ProductManagementScreen(),
        '/inventory_management' : (context) => InventoryManagementApp(),
        '/category' : (context) => CategoryScreen(),
      },
    );
  }
}
