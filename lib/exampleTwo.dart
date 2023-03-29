import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyExampleTwo extends StatefulWidget {
  @override
  State<MyExampleTwo> createState() => _MyExampleTwoState();
}

class _MyExampleTwoState extends State<MyExampleTwo> {
  List<Photos> photosList = [];
  Future<List<Photos>> getPhotos() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map i in data) {
        Photos photos = Photos(title: i['title'], url: i['url']);
        photosList.add(photos);
      }
      return photosList;
    } else
      return photosList;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return (Scaffold(
      appBar: AppBar(title: Text('Example Two')),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getPhotos(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Text('Loading');
                } else {
                  return ListView.builder(
                    itemCount: photosList.length,
                    itemBuilder: (context, index) {
                      return (ListTile(
                        title: Text(
                          photosList[index].title.toString(),
                        ),
                        leading: CircleAvatar(
                            backgroundImage:
                                NetworkImage(photosList[index].url.toString())),
                      ));
                    },
                  );
                }
              },
            ),
          )
        ],
      ),
    ));
  }
}

class Photos {
  String title, url;
  Photos({required this.title, required this.url});
}
