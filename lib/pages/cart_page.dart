import 'package:cart_provider/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../consts.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _buildUI(),
    );
  }

  PreferredSizeWidget _appBar(){
    return AppBar(
      backgroundColor: Colors.deepOrangeAccent,
      title: Text("Cart",style: TextStyle(color: Colors.white),),

    );
  }

  Widget _buildUI(){
    return Consumer<CartProvider>(builder: (context,provider,_){
      return Column(
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height*0.75,
            child: ListView.builder(
              itemCount: provider.items.length,
                itemBuilder: (context, index){
                Product product = provider.items[index];
              return ListTile(
                leading: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: product.color
                  ),
                ),
                title: Text(product.name,style: TextStyle(fontSize: 18),),
                subtitle: Text("Rs: ${product.price.toString()}"),
                trailing: InkWell(
                  onTap:(){
                    provider.remove(product);
                  },
                    child: Icon(Icons.delete_forever_rounded)),
                onLongPress: (){
                  provider.remove(product);
                },
              );
            }),
          ),
          Container(
            height: 60,
              width: double.infinity,
              color: Colors.green,
              child: Center(child: Padding(
                padding: const EdgeInsets.all(11.0),
                child: Row(
                  children: [
                    Expanded(child: Text("Cart Total: ${provider.getCartTotal()}",style: TextStyle(fontSize: 25),)),
                    IconButton(onPressed: (){
                      provider.removeAll();
                    }, icon: Icon(Icons.remove_circle_outline,size: 30,color: Colors.black,))
                  ],
                ),
              ))),
        ],
      );
    });
  }
}
