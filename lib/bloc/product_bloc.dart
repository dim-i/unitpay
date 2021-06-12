import 'dart:math' as math;
import 'package:bloc/bloc.dart';
import 'package:injector/injector.dart';
import 'package:meta/meta.dart';
import 'package:unitpay/generated/l10n.dart';
import 'package:unitpay/models/product.dart';
import 'package:unitpay/models/product_image.dart';
import 'package:unitpay/repo/product_repository.dart';

import '../models/product.dart';


part 'product_bloc_state.dart';

class ProductBlocCubit extends Cubit<ProductBlocState>{
  ProductBlocCubit() : super(EmptyProductState());

  final ProductRepository _productRepository = Injector.appInstance.get<ProductRepository>(
    dependencyName: 'HttpRepository',
  );
  final List<ProductImage> _listProductImage = [];
  final List<Product> _listProduct = [];

  Future<void> _makeListProduct()async {
    final int listDepth = 10000 * (math.Random().nextInt(9)+1);
    for(int i = 0; i < 3; i++){
      final ProductImage _productImage = await _productRepository.getProduct();
      _listProductImage.add(_productImage);
    }
    for(int j = 0; j < listDepth; j++){
      int indexImageList = math.Random().nextInt(3);
      _listProduct.add(Product(_listProductImage[indexImageList]
          .imagePath, ProductNames.values[indexImageList].localization()));
    }
    print('размер списка ${_listProduct.length}');
  }

  Future<void> getProductList()async {
    try{
      await _makeListProduct();
      emit(ListProductState(_listProduct));
    }on Exception{
      emit(ErrorProductState(err: S.current.error));
    }
  }

  removeProductFromList(int index){
    try{
      _listProduct.removeAt(index);
      print('размер списка ${_listProduct.length}');
      emit(ListProductState(_listProduct));
    }on Exception{
      emit(ErrorProductState(err: S.current.error));
    }
  }

  addProductToList(){
    try{
      int indexImageList = math.Random().nextInt(3);
       _listProduct.add(Product(_listProductImage[indexImageList]
           .imagePath, ProductNames.values[indexImageList].localization()));
      print('размер списка ${_listProduct.length}');
      emit(ListProductState(_listProduct));
    }on Exception{
      emit(ErrorProductState(err: S.current.error));
    }
  }
}