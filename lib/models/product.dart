import '../generated/l10n.dart';

enum ProductNames {classic, crazy, big}

extension ProductNamesLocales on ProductNames{
  String localization(){
    switch(this){
      case ProductNames.classic:
        return S.current.classic;
      case ProductNames.crazy:
        return S.current.crazy_cow;
      case ProductNames.big:
        return S.current.big_size;
      default:
        return S.current.classic;
    }
  }
}


class Product{
  final String pathImg;
  final String productName;

  Product(this.pathImg, this.productName);
}