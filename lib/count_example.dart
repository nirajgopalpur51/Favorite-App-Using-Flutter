import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'count_provider.dart';
import 'count_provider.dart';

class homescreen extends StatelessWidget {
  const homescreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final countProvider=Provider.of<CountProvider>(context,listen: false);
    print("niraj");
    return Scaffold(

      appBar: AppBar(
        title: Text(
            "Provider"
        ),
      ),
      body: Center(
          child: Consumer<CountProvider>(builder: (context,value,child){
            return Text(
              countProvider.count.toString(),
              style: TextStyle(fontSize: 50),
            );
          },)
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          countProvider.setCount();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}