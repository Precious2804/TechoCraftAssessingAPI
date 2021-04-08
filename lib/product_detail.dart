import 'package:flutter/material.dart';
import 'package:store_app/product.dart';
class ProductDetail extends StatelessWidget {
  final Product product;
  ProductDetail(this.product);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(product.title),
              background: Image.network(product.image, fit: BoxFit.cover,),
            ),
          ),
          SliverList(delegate: SliverChildListDelegate([
            SizedBox(height: 25),
            Center(
              child: Text('₦${product.price}',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
              ),
            ),
            Center(
              child: Text(product.description,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              ),
            ),
          ])
          )
        ],
      ),
    );
  }
}
