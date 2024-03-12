import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresho/features/homePage/bloc/home_bloc.dart';


import '../bloc/wish_list_bloc.dart';

class WishListPage extends StatefulWidget {
  const WishListPage({super.key});

  @override
  State<WishListPage> createState() => _WishListPageState();
}

class _WishListPageState extends State<WishListPage> {
  final HomeBloc homeBloc = HomeBloc();
WishListBloc wishListBloc = WishListBloc();
  @override
  void initState() {
    homeBloc.emit(WishListedActionState());
    super.initState();
  }
//
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WishListBloc, WishListState>(
      bloc: wishListBloc,
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {

        switch(state.runtimeType){
          case WishListLoadedState:
            return Scaffold(
              body: Container(
                child: GridView.count(
                    crossAxisCount: 1,
                ),
              ),
            );
          default:
            return Center(
              child: Text("Error"),
            );
        }
      },
    );
  }
}
