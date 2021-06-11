import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unitpay/bloc/product_bloc.dart';
import 'package:unitpay/generated/l10n.dart';


class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    context.read<ProductBlocCubit>().getProductList();
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: (){},
              child: Text(S.of(context).menu),
          ),
          IconButton(
              onPressed: (){},
              icon: Icon(Icons.add),
          )
        ],
      ),
      body: Container(
        child:
      BlocBuilder<ProductBlocCubit, ProductBlocState>(
        builder: (context, state){
          if(state is EmptyProductState){
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is ErrorProductState){
            return Center(
              child: Text('Ошибка'),
            );
          }
          if(state is ListProductState){
            return Container(
                child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemCount: state.listProducts.length,
                  itemBuilder: (context, index){
                    return Card(
                      child: Stack(
                        children: [
                          Image.file(File('${state.listProducts[index].pathImg}')),
                          Positioned(
                            left: 5,
                            bottom: 5,
                              child: Text('${state.listProducts[index].productName}'),
                          ),
                          Positioned(
                            right: 5,
                            top: 5,
                              child: Container(
                                width: 30,
                                height: 30,
                                color: Colors.blue[600],
                                child: Icon(
                                    Icons.clear,

                                ),
                              ),
                          ),
                        ],
                      )
                      //Center(child: Text('${state.listProducts[index].pathImg}')),
                    );
                  },
                ),
            );
          }
          return Center(
            child: Text('список пуст'),
          );
        }
      ),
      ),
    );
  }
}
