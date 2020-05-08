import 'package:cart/Cart.dart';
import 'package:cart/functionality/formatDecimal.dart';
import 'package:flutter/material.dart';

import '../ProductModel.dart';





class ProductScreen extends StatelessWidget {
  final ValueSetter<ProductModel> _valueSetter;

  ProductScreen(this._valueSetter);

  List<ProductModel> products = [
    ProductModel(1,"LCD Original", 500000,"Description test"),
    ProductModel(2,"LCD Grade Ori", 100000,"Description test"),
    ProductModel(3,"Speaker", 500000,"Description test"),
    ProductModel(4,"Baterai Grade Ori", 100000,"Description test"),
    ProductModel(5,"Baterai Original", 500000,"Description test"),
    ProductModel(6,"Housing", 3000000,"Description test"),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index){
          return ListTile(
            title: Text(products[index].name),
            trailing: Text("Rp ${formatDecimal(products[index].price)}", style: TextStyle(color: Colors.redAccent, fontSize: 20, fontWeight: FontWeight.w500),),
            onTap: (){
//              _valueSetter(products[index]);
//              _callSnackBar(context);
//              productGrade.where((productGrade) => productGrade.id.contains(products[index].id).toList();
//              _callBottomsheet(context, products[index].tipe);
              _callAlert(context, index);
            },
          );
        },
        separatorBuilder: (context, index){
          return Divider();
        },
        itemCount: products.length,
    );
  }
  _callAlert(BuildContext context, index){
    showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            content: Text('Tambahkan produk ini ke keranjang?'),
            actions: <Widget>[
              FlatButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                child: Text('Cancel'),
              ),
              FlatButton(
                onPressed: (){
                  _valueSetter(products[index]);
//                  _callSnackBar(context);
//                 Cart.add(products[index],products[index].price);
                  Navigator.pop(context);
                },
                child: Text('Tambahkan'),
              ),
            ],
          );
        }
    );
  }
}