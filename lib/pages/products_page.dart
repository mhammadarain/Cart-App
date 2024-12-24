import 'package:cart_provider/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../consts.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: _buildUI(context),
    );
  }
  PreferredSizeWidget _appBar(BuildContext context){
    return AppBar(
      title: Text("Products"),
      actions: [
        IconButton(onPressed: (){
          Navigator.pushNamed(context, "/cart");
        }, icon: Icon(Icons.shopping_cart)),
      ],
    );
  }

  Widget _buildUI(BuildContext context){
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    return ListView.builder(
        itemCount: PRODUCTS.length,
        itemBuilder: (context, index){
          Product product = PRODUCTS[index];
          return ListTile(
            leading: Container(
              height: 25,
              width: 25,
              color: product.color,
            ),
            title:Text(product.name) ,
            trailing: Checkbox(
              value: cartProvider.items.contains(product),
              onChanged: (value){
                if(value == true){
                  cartProvider.add(product);
                }else{
                  cartProvider.remove(product);
                }
              },
            ),
          );
        },
    );
  }
}
