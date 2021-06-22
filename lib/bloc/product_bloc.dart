import 'dart:math' as math;
import 'package:bloc/bloc.dart';
import 'package:injector/injector.dart';
import 'package:meta/meta.dart';
import 'package:unitpay/generated/l10n.dart';
import 'package:unitpay/repo/product_repository.dart';

part 'product_bloc_state.dart';

class ProductBlocCubit extends Cubit<ProductBlocState>{
  ProductBlocCubit() : super(EmptyProductState());

  final ProductRepository _productRepository = Injector.appInstance.get<ProductRepository>(
    dependencyName: 'HttpRepository',
  );

  final List<String> _listImageURL = [];
  final List<int> _listPositionsIndex = [];


  List<String> get listImageURL => _listImageURL;

  Future<void> _makeListProductURL()async {
    for(int i = 0; i < 3; i++){
      listImageURL.add(await _productRepository.getProductURL());
    }
  }

  _makeListPositionsIndex(){
    final int listDepth = 10000 * (math.Random().nextInt(9)+1);
    for(int j = 0; j < listDepth; j++){
      int indexImageList = math.Random().nextInt(3);
      _listPositionsIndex.add(indexImageList);
    }
  }

  Future<void> getPositionsIndexList()async {
    if(_listPositionsIndex.isNotEmpty) return;
    try{
      await _makeListProductURL();
      _makeListPositionsIndex();
      //print('размер списка ${_listPositionsIndex.length}');
      emit(ListPositionIndexState(_listPositionsIndex));
    }on Exception{
      emit(ErrorProductState(err: S.current.err));
    }
  }

  removeProductFromList(int index){
    try{
      _listPositionsIndex.removeAt(index);
      //print('размер списка ${_listPositionsIndex.length}');
      emit(ListPositionIndexState(_listPositionsIndex));
    }on Exception{
      emit(ErrorProductState(err: S.current.err));
    }
  }

  addProductToList(){
    try{
      int indexImageList = math.Random().nextInt(3);
       _listPositionsIndex.insert(0, indexImageList);
      //print('размер списка ${_listPositionsIndex.length}');
      emit(ListPositionIndexState(_listPositionsIndex));
    }on Exception{
      emit(ErrorProductState(err: S.current.err));
    }
  }
}