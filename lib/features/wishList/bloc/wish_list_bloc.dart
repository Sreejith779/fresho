

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fresho/dataModel/cartListItem.dart';
import 'package:fresho/dataModel/wishList.dart';
import 'package:fresho/features/homePage/model/productModel.dart';
import 'package:meta/meta.dart';

part 'wish_list_event.dart';
part 'wish_list_state.dart';

class WishListBloc extends Bloc<WishListEvent, WishListState> {
  WishListBloc() : super(WishListInitial()) {
on<WishListInitialEvent>(wishListInitialEvent);
on<WishListRemoveItem>(wishListRemoveItem);
  }



  FutureOr<void> wishListInitialEvent(WishListInitialEvent event, Emitter<WishListState> emit) {
    emit(WishListLoadedState(wishList: wishListItems));

  }

  FutureOr<void> wishListRemoveItem(WishListRemoveItem event, Emitter<WishListState> emit) {

    wishListItems.remove(event.productModel);
    emit(WishListLoadedState(wishList: wishListItems));
     print("removed");


  }

}
