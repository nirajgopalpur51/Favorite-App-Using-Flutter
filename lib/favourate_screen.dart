import 'package:favourate_app/favourate_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'myFavourite.dart';

class favourateScreen extends StatefulWidget {
  const favourateScreen({Key? key}) : super(key: key);

  @override
  State<favourateScreen> createState() => _favourateScreenState();
}

class _favourateScreenState extends State<favourateScreen> {
  List<int> selectedItem=[];
  @override
  Widget build(BuildContext context) {
    // final favouriteProvider=Provider.of<FavouriateItemProvider>(context,listen: true);

    print("build");
    return Scaffold(
      appBar: AppBar(
        title: Text("favourate screen"),
        actions: [
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => myFavouriteScreen()));
            },
            child:
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: Icon(Icons.favorite),
          )),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 100,
                itemBuilder: (context, index){

                  return Consumer<FavouriateItemProvider>(builder: (context,value,child){
                    return ListTile(
                      onTap: (){
                        showDialog(context: context, builder: (context){
                          return Container(
                            child: AlertDialog(
                              title: Text("Select"),
                              actions: [
                                TextButton(onPressed: (){
                                  Navigator.pop(context);
                                }, child: Text("OK"))
                              ],
                            ),
                          );
                        });
                        if(value.selectedItem.contains(index)){
                          value.removeitem(index);


                        }

                        else{
                          value.additem(index);
                        }
                        // value.additem(index);
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


