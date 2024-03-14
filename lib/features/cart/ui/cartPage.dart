import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresho/features/cart/bloc/cart_bloc.dart';
import 'package:fresho/features/cart/ui/cart_Tile.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
   bool isData = true;
  final CartBloc cartBloc = CartBloc();

  @override
  void initState() {
    cartBloc.add(CartInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartBloc, CartState>(
      bloc: cartBloc,

      listenWhen: (previous,current)=>(current is CartActionState),
      buildWhen: (previous,current)=>(current is !CartActionState),
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
    switch(state.runtimeType){
          case CartLoadedState:
          final  loadedState = state as CartLoadedState;
          double totalAmount = loadedState.cartList.fold(
              0, (previousValue, element) => previousValue + element.price);
            return Scaffold(
              body: Container(

                margin: const EdgeInsets.all(10),
                child:
                    Column(
                      children: [

                        Expanded(
                          child: state.cartList.isNotEmpty?
                          ListView.builder(
                            itemCount: loadedState.cartList.length,
                              itemBuilder: (context,index){


                                return CartTile(productModel: loadedState.cartList[index], cartBloc: cartBloc,
                                );

                              }
                              ): 
                               Center(child: Container(
                                 height: 300,
                                 decoration: const BoxDecoration(
                                   image: DecorationImage(
                                       image: AssetImage("assets/cart.png"),)
                                 ),
                               ))
                        ),
             if(state.cartList.isNotEmpty)   Container(
                          padding: const EdgeInsets.only(left: 10,top: 20,right: 10,bottom: 20),
                          height: 70,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.deepPurple.withOpacity(0.95),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child:  Row(
                            mainAxisAlignment:MainAxisAlignment.spaceBetween ,
                            children: [
                               Text("Total ${totalAmount.toStringAsFixed(0)}rs",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18
                              ),),
                              Container(
                                height: 40,
                                width: 100,
                                decoration: BoxDecoration(
                                  color: Colors.deepPurpleAccent.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(10)
                                ),
                                child: const Center(child: Text("Place order",
                                style: TextStyle(
                                  color: Colors.white
                                ),)),
                              )


                            ],
                          ),
                        )
                      ],
                    ),

              ),
            );

          default:
            return const Center(child: Text("Error"));
        }
      },
    );
  }
}
