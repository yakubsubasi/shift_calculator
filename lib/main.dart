import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shift_calculator/state/shift_state.dart';
import 'package:shift_calculator/view/pages/main_landing_page.dart';

import 'package:shift_calculator/view/pages/shift_table_page.dart';

import 'view/pages/first_form_page.dart';
import 'view/pages/naming_page.dart';
import 'view/pages/second_form_page.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => ShiftController()),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => MainLandingPage(),
        'first': (context) => FirstFormPage(),
        'second': (context) => SecondFormPage(),
        'naming': (context) => NamingPage(),
        'shift': (context) => ShiftTablePage(),
      },
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.indigo,
          textTheme: const TextTheme(
            button: TextStyle(color: Colors.white),
          )),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shift Hesaplayıcı'),
      ),
    );
  }
}

// ShiftListView
