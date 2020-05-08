import 'package:cart/main.dart';
import 'package:flutter/material.dart';

import '../ProductModel.dart';

class Final extends StatefulWidget {
  List<ProductModel> cart;
  int sum;
//  final ValueSetter<ProductModel> _valueSetter;

  Final(this.cart, this.sum);

  @override
  _FinalState createState() => _FinalState();
}

class _FinalState extends State<Final> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Check out"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: [
              Text('test'),
            ],
          ),
          ListView.separated(
            itemBuilder: (context, index){
              return ListTile(
                title: Text(widget.cart[index].name),
                trailing: Text("\$${widget.cart[index].price}", style: TextStyle(color: Colors.redAccent, fontSize: 20, fontWeight: FontWeight.w500),),
                onTap: (){
                  _decreaseSum(widget.cart[index].price);
                  _removeProduct(widget.cart[index]);
                },
              );
            },
            separatorBuilder: (context, index){
              return Divider();
            },
            itemCount: widget.cart.length,
            shrinkWrap: true,
          ),
          Divider(),
          Text("Total : \$${widget.sum}"),

        ],
      ),
    );

  }
  _decreaseSum(int value){
    setState(() {
      this.widget.sum = this.widget.sum - value;
    });
  }
  _removeProduct(ProductModel product){
    this.widget.cart.remove(product);
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
