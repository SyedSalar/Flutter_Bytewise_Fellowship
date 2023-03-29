import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_provider/provider/favourite_screen_provider.dart';
import 'package:simple_provider/screens/favourite/my_favourite_screen_with_provider.dart';

class FavouriteScreenwithProvider extends StatefulWidget {
  @override
  State<FavouriteScreenwithProvider> createState() =>
      _FavouriteScreenwithProviderState();
}

class _FavouriteScreenwithProviderState
    extends State<FavouriteScreenwithProvider> {
  List<int> selectedItems = [];
  @override
  Widget build(BuildContext context) {
    print('object');
    final favouritescreenProvider =
        Provider.of<FavouriteScreenProvider>(context, listen: false);
    // TODO: implement build
    return (Scaffold(
      appBar: AppBar(
        title: Text('Favourite Screen'),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyFavouriteScreenwithProvider(),
                  ));
            },
            child: Icon(Icons.favorite),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: 100,
                itemBuilder: (context, index) =>
                    Consumer<FavouriteScreenProvider>(
                      builder: (context, value, child) {
                        return ListTile(
                          onTap: () {
                            if (value.selectedItems.contains(index)) {
                              value.removeItems(index);
                            } else
                              value.addItems(index);
                          },
                          title: Text('Item' + '${index}'),
                          trailing: value.selectedItems.contains(index)
                              ? Icon(Icons.favorite, color: Colors.red)
                              : Icon(
                                  Icons.favorite_outline,
                                  color: Colors.red,
                                ),
                        );
                      },
                    )),
          )
        ],
      ),
    ));
  }
}
