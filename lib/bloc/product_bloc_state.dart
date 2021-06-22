
part of 'product_bloc.dart';

@immutable
abstract class ProductBlocState {}

class EmptyProductState extends ProductBlocState {}

class ErrorProductState extends ProductBlocState{
  final String? err;
  ErrorProductState({this.err});
}

class ListPositionIndexState extends ProductBlocState{
  final List<int> listProductsIndex;

  ListPositionIndexState(this.listProductsIndex);
}