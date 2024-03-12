
import 'package:flutter/material.dart';
import 'package:fresho/features/homePage/bloc/home_bloc.dart';

import '../model/productModel.dart';
class ProductTile extends StatefulWidget {
  const ProductTile({super.key, required this.productModel, required this.homeBloc});
  final ProductModel productModel;
  final HomeBloc homeBloc;

  @override
  State<ProductTile> createState() => _ProductTileState();
}

class _ProductTileState extends State<ProductTile> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
                image: DecorationImage(
                  image: NetworkImage(widget.productModel.image),
                  fit: BoxFit.contain,
                  filterQuality: FilterQuality.low,
                ),
              ),
            ),
          ),
          const SizedBox(height: 5),
          Container(
            padding: const EdgeInsets.only(left: 15,right: 1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Rs ${ widget.productModel.price.toString()}",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.red
                  ),
                ),
                const SizedBox(height: 2),

                Text(
                  widget.productModel.name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.green.withOpacity(0.9),
                          borderRadius: BorderRadius.circular(8)
                      ),
                 width: 100,
                      height: 30,
                      child: Center(child: Text("Add To Cart",
                        style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600),)),),
                    IconButton(onPressed: (){
                      widget.homeBloc.add(WishListButtonEvent());
                    }, icon: Icon(Icons.favorite,color: Colors.black.withOpacity(0.5),))
                  ],
                )

              ],
            ),
          )
        ],
      ),
    );
  }
}