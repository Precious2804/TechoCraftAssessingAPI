import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:store_app/product.dart';
import 'package:http/http.dart' as http;

class ProductProvider extends ChangeNotifier{
  List<Product> products = [];

 Future<void> getProducts()async{
   try {
     final response = await http.get(Uri.parse('https://fakestoreapi.com/products'));
     List rtn = jsonDecode(response.body);
     rtn.forEach((product) {
       products.add(Product(
         id: product['id'],
         title: product['title'],
         price: product['price'].toString(),
         description: product['description'],
         image: product['image'],
         category: product['category'],
       ));
     });
     notifyListeners();
   }catch(e){
     print ('Network Error: ${e.toString()}');
   }

  }
}