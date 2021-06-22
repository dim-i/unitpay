import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:unitpay/bloc/product_bloc.dart';
import 'package:unitpay/generated/l10n.dart';
import 'package:unitpay/models/product.dart';

class HomeViewN extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    context.read<ProductBlocCubit>().getPositionsIndexList();
    return Scaffold(
        body: SafeArea(
            child:
              BlocBuilder<ProductBlocCubit, ProductBlocState>(
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
                  if (state is ListPositionIndexState) {
                    return Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 10, right: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(S.of(context).menu),
                                GestureDetector(
                                  onTap: () =>
                                  context.read<ProductBlocCubit>().
                                  addProductToList(),
                                  child: Container(
                                    height: 40,
                                    width: 40,
                                    color: Colors.blue[600],
                                    child: Icon(
                                      Icons.add,
                                    ),
                                  ),
                                ),
                              ]
                            ),
                          ),
                      SizedBox(height: 10),
                      Expanded(
                      child: ListView.builder(
                          itemBuilder: (context, index) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: ProductCardSimple(
                                imageURL: context.
                                  read<ProductBlocCubit>().
                                  listImageURL[state.listProductsIndex[index]],
                                prodName: '${ProductNames.
                                  values[state.listProductsIndex[index]].
                                localization()}',
                                index: index,
                                ),
                            ),
                            Expanded(
                              child: ProductCardSimple(
                                imageURL: context.
                                  read<ProductBlocCubit>().
                                  listImageURL[state.listProductsIndex[index + 1]],
                                prodName: '${ProductNames.
                                values[state.listProductsIndex[index + 1]].
                                localization()}',
                                index: index,
                                )
                              )
                            ]
                            );
                          }
                        ),
                        )
                      ]
                    );
                }
                return Center(
                  child: Text(S.of(context).empty),
                );
    })));
  }
}

class ProductCardSimple extends StatelessWidget {
  final String imageURL;
  final String prodName;
  final int index;

  const ProductCardSimple(
      {Key? key,
      required this.imageURL,
      required this.prodName,
      required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5.0),
      child: Column(
        children: [
          SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Center(
                  child: Container(
                    margin: EdgeInsets.only(left: 50, right: 50),
                    height: 100,
                    width: 50,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: CachedNetworkImageProvider(imageURL),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ),
              Column(children: [
                GestureDetector(
                  onTap: () => context
                      .read<ProductBlocCubit>()
                      .removeProductFromList(index),
                  child: Container(
                    height: 40,
                    width: 40,
                    color: Colors.blue[600],
                    child: Icon(
                      Icons.delete_forever_outlined,
                    ),
                  ),
                ),
              ]),
            ],
          ),
          SizedBox(height: 30),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [Text(prodName)],
          ),
        ],
      ),
    );
  }
}
