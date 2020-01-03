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
      body: FutureBuilder(
        future:_getCartInfo(context),
        builder: (context,snapshot){
          List cartList=Provide.value<CartProvider>(context).cartList;
          if(snapshot.hasData && cartList!=null){
            return Stack(
              children: <Widget>[
                Provide<CartProvider>(
                    builder: (context,child,childCategory){
                      cartList= Provide.value<CartProvider>(context).cartList;
                      print(cartList);
                      return ListView.builder(
                        itemCount: cartList.length,
                        itemBuilder: (context,index){
                          return CartItem(cartList[index]);
                        },
                      );
                    }
                ),
                Positioned(
                  bottom:0,
                  left:0,
                  child: CartBottom(),
                )
              ],
            );
          }else{
            return Text('正在加载');
          }
        },
      ),);
  }

  Future<String> _getCartInfo(BuildContext context) async{
    await Provide.value<CartProvider>(context).getCartList();
    return 'end';
  }
}
