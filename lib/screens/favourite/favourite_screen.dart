import 'package:flutter/material.dart';

class FavouriteScreen extends StatefulWidget {
  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  List<int> selectedItems = [];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return (Scaffold(
      appBar: AppBar(title: Text('Favourite Screen')),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
            itemCount: 100,
            itemBuilder: (context, index) => ListTile(
              onTap: () {
                selectedItems.add(index);
                setState(() {});
              },
              title: Text('Item' + '${index}'),
              trailing: selectedItems.contains(index)
                  ? Icon(Icons.favorite, color: Colors.red)
                  : Icon(
                      Icons.favorite_outline,
                      color: Colors.red,
                    ),
            ),
          )),
        ],
      ),
    ));
  }
}
