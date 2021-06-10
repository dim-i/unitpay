import 'package:bloc/bloc.dart';
import 'package:injector/injector.dart';
import 'package:meta/meta.dart';
import 'package:unitpay/repo/product_repository.dart';

part 'product_bloc_state.dart';

class ProductBlocCubit extends Cubit<ProductBlocState>{
  ProductBlocCubit() : super(EmptyProductState());

  final ProductRepository _productRepository = Injector.appInstance.get<ProductRepository>(
    dependencyName: 'HttpRepository',
  );

}