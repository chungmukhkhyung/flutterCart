import 'package:flutter/material.dart';

class ProductModel extends ChangeNotifier{
  int id;
  String name;
  int price;
  String description;

  ProductModel(int id,String name, int price, String description){
    this.id = id;
    this.name = name;
    this.description = description;
    this.price = price;
  }


}