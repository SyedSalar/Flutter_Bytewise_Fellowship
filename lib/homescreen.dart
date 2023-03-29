import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rest_apis/Models/sampleApiProviders.dart';
import 'package:http/http.dart' as http;

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<ModelClass> getList = [];
  Future<List<ModelClass>> getPostApi() async {
    final response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map i in data) {
        getList.add(ModelClass.fromJson(i));
      }
      return getList;
    } else
      return getList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: FutureBuilder(
                future: getPostApi(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Text('Loading');
                  } else {
                    return ListView.builder(
                      itemCount: getList.length,
                      itemBuilder: (context, index) {
                        return (Card(
                          child: Center(
                              child: Column(
                            children: [
                              Text(index.toString()),
                              Text(getList[index].title.toString()),
                            ],
                          )),
                        ));
                      },
                    );
                  }
                },
              ),
            )
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
