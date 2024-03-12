import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fresho/dataModel/wishList.dart';
import 'package:meta/meta.dart';

import '../../../dataModel/groceryData.dart';
import '../model/productModel.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
  on<HomeInitialEvent>(homeInitialEvent);
  on<WishListButtonEvent>(wishListButtonEvent);
  }

  FutureOr<void> homeInitialEvent(HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    await Future.delayed(Duration(seconds: 5));
    emit(HomeLoadedState());
  }

  FutureOr<void> wishListButtonEvent(WishListButtonEvent event, Emitter<HomeState> emit) {
    print("cart item added");
    emit(WishListedActionState());
  }
}
