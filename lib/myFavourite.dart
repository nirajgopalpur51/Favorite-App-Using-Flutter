import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'favourate_provider.dart';

class myFavouriteScreen extends StatefulWidget {
  const myFavouriteScreen({Key? key}) : super(key: key);

  @override
  State<myFavouriteScreen> createState() => _myFavouriteScreenState();
}

class _myFavouriteScreenState extends State<myFavouriteScreen> {
  @override
  Widget build(BuildContext context) {

    final favouriteProvider=Provider.of<FavouriateItemProvider>(context);

    print("build");
    return Scaffold(
      appBar: AppBar(
        title: Text("favourate screen"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: favouriteProvider.selectedItem.length,
                itemBuilder: (context, index){

                  return Consumer<FavouriateItemProvider>(builder: (context,value,child){
                    return ListTile(
                      onTap: (){
                        if(value.selectedItem.contains(index)){
                          value.removeitem(index);
                        }
                        else{
                          value.additem(index);
                        }

                      },
                      title: Text("Item "+index.toString()),
                      trailing: Icon(
                          value.selectedItem.contains(index) ?Icons.favorite : Icons.favorite_border_outlined),
                    );
                  });
                }),
          )
        ],
      ),
    );
  }
}
