import 'package:flutter/material.dart';
import 'package:flutter_shop/model/cart_info_model.dart';
import 'package:flutter_shop/provide/cart.dart';
import 'package:provide/provide.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<CartInfoMode> cartList = [];
    return Scaffold(
      appBar: AppBar(
        title: Text('购物车'),
      ),
      body: Provide<CartProvider>(
        builder: (context,child,data) {
          return ListView.builder(
            itemCount: data.cartList.length,
            itemBuilder: (context,index) {
              return ListTile(
                title: Text(data.cartList[index].goodsName),
                subtitle: Text(data.cartList[index].count.toString()),
              );
            },
          );
        },
      )
    );
  }


//  Future<String> getCartList(BuildContext context) async{
//    await Provide.value<CartProvider>(context).getCartList();
//    return 'end';
//  }
}
