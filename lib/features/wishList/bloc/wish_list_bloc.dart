

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fresho/dataModel/wishList.dart';
import 'package:fresho/features/homePage/model/productModel.dart';
import 'package:meta/meta.dart';

part 'wish_list_event.dart';
part 'wish_list_state.dart';

class WishListBloc extends Bloc<WishListEvent, WishListState> {
  WishListBloc() : super(WishListInitial()) {
on<WishListInitialEvent>(wishListInitialEvent);
  }



  FutureOr<void> wishListInitialEvent(WishListInitialEvent event, Emitter<WishListState> emit) {
    emit(WishListLoadedState(wishList: wishListItems));
  }
}
