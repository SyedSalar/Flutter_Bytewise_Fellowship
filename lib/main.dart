import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:simple_provider/provider/counter_provider.dart';
import 'package:simple_provider/provider/exampleone_provider.dart';
import 'package:simple_provider/provider/favourite_screen_provider.dart';
import 'package:simple_provider/screens/counter.dart';
import 'package:provider/provider.dart';
import 'package:simple_provider/screens/example_one.dart';
import 'package:simple_provider/screens/favourite/favourite_screen.dart';
import 'package:simple_provider/screens/favourite/favourite_screen_with_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => CountProvider()),
          ChangeNotifierProvider(create: (_) => ExampleOneProvider()),
          ChangeNotifierProvider(create: (_) => FavouriteScreenProvider())
        ],
        child: MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: FavouriteScreenwithProvider()));
  }
}
