import 'package:http/http.dart' as http;
import 'package:unitpay/models/product.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

abstract class ProductRepository{
  Future<Product> getProduct();
}

class ProductHttpRepository implements ProductRepository {
  //final client = http.Client();
  @override
  Future<Product> getProduct() async{
    var client = http.Client();
    var uri = Uri.parse('https://foodish-api.herokuapp.com/images/burger');
    try{
      final response = await http.get(uri);
      final data = jsonDecode(response.body);
      return Product.imagesProduct(data);
    }catch (e){
      //return e;
    }finally{
      client.close();
    }
  }



}