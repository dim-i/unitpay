import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

abstract class ProductRepository{
  Future<String> getProductURL();
}

 class ProductHttpRepository implements ProductRepository {

  @override
  Future<String> getProductURL() async{
    var uri = Uri.parse('https://foodish-api.herokuapp.com/api/images/burger/');
    try{
      final response = await http.get(uri);
      var data =
      convert.jsonDecode(response.body) as Map<String, dynamic>;
      var imageURL = data["image"];
      return imageURL;
    }catch (e){
      throw(e);
    }
  }
}