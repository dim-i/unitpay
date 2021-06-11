import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class ProductImage{
  // final String imageURL;
  // final String imagePath;
  //
  // ProductImage({required this.imageURL, required this.imagePath});
  //
  // ProductImage.imgFromAPI(Map<String, dynamic> json) : this(
  //   imageURL: json['image'], imagePath: _fetchFile(url)
  // );
  //
  // Future<String> _fetchFile(String url)async {
  //   var fetchedFile = await DefaultCacheManager().getSingleFile(url);
  //   return fetchedFile.path;
  // }

  final String imagePath;
  ProductImage({required this.imagePath});

  ProductImage.imgFromCache(String path) : this(imagePath: path);

  // ProductImage.imgFromAPI(Map<String, dynamic> json)
  //     : listImagesURL = getDataFromJson(json);
  //
  // List<String> getDataFromJson(json) {
  //   var imageURL = json["message"];
  //   var fetchedFile = DefaultCacheManager().getSingleFile(imageURL);
  //
  // }

// ProductImage.imgFromAPI(Map<String, dynamic> json) : this(
//   imageURL: json['image'], imagePath: _fetchFile(url)
// );

}