import 'package:flutter/material.dart';

import '../ProductModel.dart';

class CheckoutScreen extends StatelessWidget {
  final cart;
  final sum;
  final ValueSetter<ProductModel> _valueSetter;

  CheckoutScreen(this.cart, this.sum, this._valueSetter);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ListView.separated(
          itemBuilder: (context, index){
            return ListTile(
              title: Text(cart[index].name),
              trailing: Text("\$${cart[index].price}", style: TextStyle(color: Colors.redAccent, fontSize: 20, fontWeight: FontWeight.w500),),
              onTap: (){
                _valueSetter(cart[index]);
                _callSnackBar(context);

              },
            );
          },
          separatorBuilder: (context, index){
            return Divider();
          },
          itemCount: cart.length,
          shrinkWrap: true,
        ),
        Divider(),
        Text("Total : \$$sum"),

      ],
    );
  }
}

_callSnackBar(BuildContext context){
  Scaffold.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Text('Produk Berhasil dikurangi'),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red[900],
      )
  );
}