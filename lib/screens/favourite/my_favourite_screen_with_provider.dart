import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_provider/provider/favourite_screen_provider.dart';

class MyFavouriteScreenwithProvider extends StatefulWidget {
  @override
  State<MyFavouriteScreenwithProvider> createState() =>
      _MyFavouriteScreenwithProviderState();
}

class _MyFavouriteScreenwithProviderState
    extends State<MyFavouriteScreenwithProvider> {
  List<int> selectedItems = [];
  @override
  Widget build(BuildContext context) {
    print('object');
    final favouritescreenProvider =
        Provider.of<FavouriteScreenProvider>(context, listen: true);
    // TODO: implement build
    return (Scaffold(
      appBar: AppBar(title: Text('Favourite Screen')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: favouritescreenProvider.selectedItems.length,
                itemBuilder: (context, index) =>
                    Consumer<FavouriteScreenProvider>(
                      builder: (context, value, child) {
                        return ListTile(
                          onTap: () {
                            value.removeItems(index);
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
