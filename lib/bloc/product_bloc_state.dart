
part of 'product_bloc.dart';


@immutable
abstract class ProductBlocState {}

class EmptyProductState extends ProductBlocState {}

class ErrorProductState extends ProductBlocState{
  String? err;
  ErrorProductState({this.err});
}

class ListProductState extends ProductBlocState {
  List<Product> listProducts;

  ListProductState(this.listProducts);
}