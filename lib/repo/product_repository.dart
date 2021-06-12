import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

import 'package:unitpay/models/product_image.dart';

abstract class ProductRepository{
  Future<ProductImage> getProduct();
}

class ProductHttpRepository implements ProductRepository {
  @override
  Future<ProductImage> getProduct() async{
    var uri = Uri.parse('https://foodish-api.herokuapp.com/api/images/burger/');
    try{
      final response = await http.get(uri);
      var data =
      convert.jsonDecode(response.body) as Map<String, dynamic>;
      var imageURL = data["image"];
      var fetchedFile = await DefaultCacheManager().getSingleFile(imageURL);
      return ProductImage.imgFromCache(fetchedFile.path);
    }catch (e){
      throw(e);
    }
  }
}