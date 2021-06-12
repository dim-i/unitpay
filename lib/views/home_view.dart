import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'dart:io';
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
    final widthSize = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: TextButton(
          onPressed: () {},
          child: Text(S.of(context).menu),
        ),
        actions: [
          Container(
            width: widthSize / 8,
            height: widthSize / 8,
            color: Colors.blue[600],
            child:
            GestureDetector(
              onTap: () => context.read<ProductBlocCubit>().addProductToList(),
              child: Icon(
                  Icons.add,
                ),
              ),
            ),
        ],
      ),
      body: Container(
        child: BlocBuilder<ProductBlocCubit, ProductBlocState>(
            builder: (context, state) {
          if (state is EmptyProductState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is ErrorProductState) {
            return Center(
              child: Text('${state.err}'),
            );
          }
          if (state is ListProductState) {
            return Container(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: state.listProducts.length,
                itemBuilder: (context, index) {
                  return Card(
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                              image: FileImage(
                                File('${state.listProducts[index].pathImg}')
                              ),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                        Positioned(
                          left: 0,
                          right: 0,
                          bottom: 0,
                          child: Container(
                            color: Colors.grey[900],
                            child:
                              Text('${state.listProducts[index].productName}'),
                          ),
                        ),
                        Positioned(
                          right: 5,
                          top: 5,
                          child:
                          GestureDetector(
                            onTap: () => context
                              .read<ProductBlocCubit>()
                              .removeProductFromList(index),
                            child: Container(
                              width: widthSize / 12,
                              height: widthSize / 12,
                              color: Colors.blue[600],
                              child: Icon(
                                Icons.delete_forever_outlined,
                            ),
                          ),
                        ),
                      ),
                      ],
                    )
                  );
                },
              ),
            );
          }
          return Center(
            child: Text(S.of(context).empty),
          );
        }),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance!.addPostFrameCallback((_) {
      context.read<ProductBlocCubit>().getProductList();
    });
  }
}
