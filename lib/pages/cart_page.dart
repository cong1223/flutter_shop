import 'package:flutter/material.dart';
import 'package:flutter_shop/model/cart_info_model.dart';
import 'package:flutter_shop/pages/components/cart_page/cart_item.dart';
import 'package:flutter_shop/provide/cart.dart';
import 'package:provide/provide.dart';

import 'components/cart_page/cart_bottom.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<CartInfoMode> cartList = [];
    return Scaffold(
        appBar: AppBar(
          title: Text('购物车'),
        ),
        body: Provide<CartProvider>(
          builder: (context, child, data) {
            return Stack(
              children: <Widget>[
                ListView.builder(
                  itemCount: data.cartList.length,
                  itemBuilder: (context, index) {
                    return CartItem(data.cartList[index]);
                  },
                ),
                Positioned(
                  child: CartBottom(),
                  bottom: 0,
                  left: 0,
                )
              ],
            );
          },
        ));
  }

//  Future<String> getCartList(BuildContext context) async{
//    await Provide.value<CartProvider>(context).getCartList();
//    return 'end';
//  }
}
