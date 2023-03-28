import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_provider/provider/counter_provider.dart';

class MyProviderCounter extends StatefulWidget {
  @override
  State<MyProviderCounter> createState() => _MyProviderCounterState();
}

class _MyProviderCounterState extends State<MyProviderCounter> {
  // @override
  @override
  void initState() {
    final countProvider = Provider.of<CountProvider>(context, listen: false);
    // TODO: implement initState
    super.initState();
    Timer.periodic(Duration(seconds: 1), (timer) {
      countProvider.setCount();
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final countProvider = Provider.of<CountProvider>(context, listen: false);
    return (Scaffold(
      appBar: AppBar(title: Text('My First Provider App')),
      body: Center(child: Consumer<CountProvider>(
        builder: (context, value, child) {
          return Text(countProvider.count.toString());
        },
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {countProvider.setCount()},
        child: Icon(Icons.add),
      ),
    ));
  }
}
