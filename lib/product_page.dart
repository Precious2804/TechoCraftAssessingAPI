import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/product_detail.dart';
import 'package:store_app/provider/product_provider.dart';

class ProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provider.of<ProductProvider>(context, listen: false).getProducts();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Products'),
      ),
      body: Consumer<ProductProvider>(builder: (BuildContext context, ProductProvider productsProvider, Widget child){
        if (productsProvider.products.isNotEmpty)

        return ListView.builder(
            itemCount: productsProvider.products.length,
            itemBuilder: (BuildContext context, int index){
          return InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>ProductDetail(productsProvider.products[index])));
            },
            child: Card(
              child: Row(
                children: [
                  Image.network(productsProvider.products[index].image,
                  height: 200,
                    width: 100,
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(productsProvider.products[index].title,
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(productsProvider.products[index].description,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                        ),
                        Text('₦${productsProvider.products[index].price}',
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
        else
          return Center(child: CircularProgressIndicator());
      },)
    );
  }
}
