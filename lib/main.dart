import 'package:flutter/material.dart';
import 'package:intermediate1/screens/details_screen.dart';
import 'package:intermediate1/screens/navigation_screen.dart';

import 'models/db_helper.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await DBHelper.instance.createDatabase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: Home(),
      routes: {
        '/': (context) => NavigationScreen(),
        'details': (context) => DetailsScreen()
      },
    );
  }
}
