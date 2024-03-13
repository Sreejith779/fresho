import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresho/features/homePage/bloc/home_bloc.dart';



import '../bloc/wish_list_bloc.dart';
import 'cartTile.dart';

class WishListPage extends StatefulWidget {
  const WishListPage({super.key});

  @override
  State<WishListPage> createState() => _WishListPageState();
}

class _WishListPageState extends State<WishListPage> {
WishListBloc wishListBloc = WishListBloc();

  @override
  void initState() {
wishListBloc.add(WishListInitialEvent());
    super.initState();
  }
//
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WishListBloc, WishListState>(
      bloc: wishListBloc,
      listenWhen: (previous,current)=> (current is WishListedActionState),
      buildWhen: (previous,current)=> (current is !WishListedActionState),
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {

        switch(state.runtimeType){
          case WishListLoadedState:
            final loadedState = state as WishListLoadedState;
            return Scaffold(
              body: Container(
                child: ListView.builder(
                  itemCount: loadedState.wishList.length,
                    itemBuilder: (context,index){
                      return  Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.grey.withOpacity(0.1),
                          ),

                          child: Container(
                            margin: const EdgeInsets.all(10),
                            child: Row(
                              children: [
                                CartTile(
                                  productModel: loadedState.wishList[index],
                                  wishListBloc: wishListBloc,
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    })
              ),
            );
          default:
            return const Center(
              child: Text("Error"),
            );
        }
      },
    );
  }
}
