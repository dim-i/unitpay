
class ProductImage{
  final String imagePath;
  ProductImage({required this.imagePath});

  ProductImage.imgFromCache(String path) : this(imagePath: path);
}