import 'package:favourate_app/favourate_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'count_provider.dart';
import 'favourate_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CountProvider()),
        ChangeNotifierProvider(create: (_) => FavouriateItemProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(

            primarySwatch: Colors.blue,
          ),
          home: const favourateScreen()),
    );
  }
}

