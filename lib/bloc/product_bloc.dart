import 'dart:math' as math;
import 'package:bloc/bloc.dart';
import 'package:injector/injector.dart';
import 'package:meta/meta.dart';
import 'package:unitpay/generated/l10n.dart';
import 'package:unitpay/models/product.dart';
import 'package:unitpay/models/product_image.dart';
import 'package:unitpay/repo/product_repository.dart';

part 'product_bloc_state.dart';

class ProductBlocCubit extends Cubit<ProductBlocState>{
  ProductBlocCubit() : super(EmptyProductState());

  final ProductRepository _productRepository = Injector.appInstance.get<ProductRepository>(
    dependencyName: 'HttpRepository',
  );

  final List<String> listProductName = ["Классический бургер", "Злая говядина", "Размер имеет значение"];

  Future<List<Product>> _makeListProduct()async {
    final int listDepth = math.Random().nextInt(10000) * 10;
    final List<Product> listProduct = [];
    final List<ProductImage> listProductImage = [];
    for(int i = 0; i < 3; i++){
      final ProductImage _productImage = await _productRepository.getProduct();
      listProductImage.add(_productImage);
    }
    for(int j = 0; j < listDepth; j++){
      int indexImageList = math.Random().nextInt(3);
      listProduct.add(Product(listProductImage[indexImageList].imagePath, listProductName[indexImageList]));
    }
    return listProduct;
  }

  Future<void> getProductList()async {
    try{
      emit(ListProductState(await _makeListProduct()));
    }on Exception{
      emit(ErrorProductState(err: 'err'));
    }
  }

}