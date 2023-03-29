import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_provider/provider/exampleone_provider.dart';

class MyExampleOne extends StatefulWidget {
  @override
  State<MyExampleOne> createState() => _MyExampleOneState();
}

class _MyExampleOneState extends State<MyExampleOne> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return (Scaffold(
        appBar: AppBar(title: Text('My First Provider App')),
        body: Column(children: [
          Consumer<ExampleOneProvider>(builder: (context, value, child) {
            return Slider(
              min: 0.0,
              max: 1.0,
              value: value.value,
              onChanged: (val) {
                print(val);
                value.setvalue(val);
              },
            );
          }),
          Consumer<ExampleOneProvider>(builder: (context, value, child) {
            return Row(
              children: [
                Expanded(
                    child: Container(
                  height: 100,
                  child: Text('Container 1'),
                  decoration: BoxDecoration(
                      color: Colors.green.withOpacity(value.value)),
                )),
                Expanded(
                    child: Container(
                  height: 100,
                  child: Text('Container 2'),
                  decoration:
                      BoxDecoration(color: Colors.red.withOpacity(value.value)),
                ))
              ],
            );
          })
        ])));
  }
}
