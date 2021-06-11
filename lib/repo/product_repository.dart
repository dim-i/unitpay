import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:http/http.dart' as http;
import 'package:unitpay/models/product.dart';
import 'package:flutter/services.dart';
import 'dart:convert' as convert;

import 'package:unitpay/models/product_image.dart';

abstract class ProductRepository{
  Future<ProductImage> getProduct();
}

class ProductHttpRepository implements ProductRepository {
  //final client = http.Client();
  @override
  Future<ProductImage> getProduct() async{
    //var client = http.Client();
    var uri = Uri.parse('https://foodish-api.herokuapp.com/api/images/burger/');
    try{
      final response = await http.get(uri);
      var data =
      convert.jsonDecode(response.body) as Map<String, dynamic>;
      var imageURL = data["image"];
      var fetchedFile = await DefaultCacheManager().getSingleFile(imageURL);
      //final data = jsonDecode(response.body);
      return ProductImage.imgFromCache(fetchedFile.path);
    }catch (e){
      return ProductImage(imagePath: 'unknown');
    }
    // finally{
    //   client.close();
    // }
  }
}