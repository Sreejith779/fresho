
import 'package:flutter/material.dart';
import 'package:fresho/features/homePage/bloc/home_bloc.dart';
import 'package:fresho/features/wishList/bloc/wish_list_bloc.dart';

import '../../homePage/model/productModel.dart';

class CartTile extends StatefulWidget {
  const CartTile({super.key, required this.productModel, required this.wishListBloc, });
  final ProductModel productModel;
  final WishListBloc wishListBloc;

  @override
  State<CartTile> createState() => _CartTileState();
}
class _CartTileState extends State<CartTile> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(left: 10,),
          height: 100,
          width:100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            image: DecorationImage(
              image: NetworkImage(widget.productModel.image),
              fit: BoxFit.contain,
              filterQuality: FilterQuality.high,
            ),
          ),
        ),
        const SizedBox(width: 1),
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
              const SizedBox( height: 3),

              Text(
                widget.productModel.name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox( height: 3),
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
                  
                  IconButton(onPressed: (){}, icon: Icon(Icons.delete_outline_outlined,color: Colors.orange,))

                ],
              )

            ],
          ),
        )
      ],
    );
  }
}