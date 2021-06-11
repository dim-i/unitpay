import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:injector/injector.dart';
import 'package:unitpay/bloc/product_bloc.dart';
import 'package:unitpay/generated/l10n.dart';
import 'package:unitpay/repo/product_repository.dart';
import 'package:unitpay/theme/theme_dark.dart';
import 'package:unitpay/views/home_view.dart';

void main() {
  final injector = Injector.appInstance;
  injector.registerDependency<ProductRepository>(
        () => ProductHttpRepository(),
    dependencyName: 'HttpRepository',
  );
  // final productRepository = ProductRepository();
  // runApp(MyApp(productRepository: productRepository,));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // const MyApp({Key? key, required ProductRepository productRepository}) :
  //       _productRepository = productRepository, super(key: key);
  // final ProductRepository _productRepository;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return
      // RepositoryProvider.value(
      // value: _productRepository,
      // child:
      MultiBlocProvider(
        providers: [
          BlocProvider<ProductBlocCubit>(
              create: (_) => ProductBlocCubit(),
          ),
        ],
        child: MaterialApp(
          localizationsDelegates: [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          theme: themeDark,
          home: HomeView(),
        ),
      );
  }
}





