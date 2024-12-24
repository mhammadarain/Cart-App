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
      backgroundColor: Colors.amber,
      title: Text("Products",style: TextStyle(color: Colors.white),),
      actions: [
        IconButton(onPressed: (){
          Navigator.pushNamed(context, "/cart");
        }, icon: Icon(Icons.shopping_cart,color: Colors.white,)),
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
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.amber,
              ),
              child: Icon(product.icon.icon,color: Colors.white,),
            ),
            title:Text(product.name,style: TextStyle(fontSize: 18),) ,
            subtitle: Text("Rs: ${product.price.toString()}"),
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
