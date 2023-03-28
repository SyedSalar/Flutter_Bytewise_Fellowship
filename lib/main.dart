import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:simple_provider/provider/counter_provider.dart';
import 'package:simple_provider/screens/counter.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => CountProvider(),
        child: MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: MyProviderCounter()));
  }
}