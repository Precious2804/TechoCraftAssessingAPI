import 'package:flutter/material.dart';
import 'package:store_app/product_page.dart';
import 'package:provider/provider.dart';
import 'package:store_app/provider/product_provider.dart';

void main() {
  //runApp(MyApp());

  runApp(
    MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) =>ProductProvider())
        ],
      child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProductPage(),
    );
  }
}
