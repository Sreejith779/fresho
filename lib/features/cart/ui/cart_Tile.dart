import 'package:flutter/material.dart';
import 'package:fresho/features/cart/bloc/cart_bloc.dart';
import 'package:fresho/features/homePage/model/productModel.dart';

class CartTile extends StatefulWidget {
  const CartTile({super.key, required this.productModel, required this.cartBloc});
  final CartBloc cartBloc;
  final ProductModel productModel;

  @override
  State<CartTile> createState() => _CartTileState();
}

class _CartTileState extends State<CartTile> {
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15)
      ),
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                image: DecorationImage(
                    image: NetworkImage(widget.productModel.image),
                fit: BoxFit.cover)
              ),
            ),
            const SizedBox(width: 15,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.productModel.name,
                style: const TextStyle(fontSize: 16,
                fontWeight: FontWeight.w500),),
               const SizedBox(height: 3,),
                Text("${widget.productModel.kg.toString()} Kg",
                style: const TextStyle(fontWeight: FontWeight.w400,
                fontSize: 16),),
                const SizedBox(height: 3,),
                Text("Rs ${widget.productModel.price.toString()}",
                  style: const TextStyle(fontWeight: FontWeight.w500,
                      fontSize: 16),),
              ],
            ),
          ),
            Container(
              height: 40,
      

            decoration: BoxDecoration(
                color: Colors.green,
              borderRadius: BorderRadius.circular(15)
            ),
              child: Row(
                children: [
                  IconButton(onPressed: (){
                    if(quantity>0){
                      setState(() {
                        quantity = quantity - 1;
                      });
                    }else if(quantity <= 0){
                      widget.cartBloc.add(CartRemoveEvent(removeFromCart: widget.productModel));
                    }
                  },
                      icon: const Icon(Icons.remove,
                      color: Colors.white,)),
                   SizedBox(
                    child: Text(quantity.toString(),style: const TextStyle(
                      color: Colors.white
                    ),),
                  ),
                  IconButton(onPressed: (){
                    setState(() {
                      quantity++;
                    });
                  },
                      icon: const Icon(Icons.add,
                        color: Colors.white,)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
