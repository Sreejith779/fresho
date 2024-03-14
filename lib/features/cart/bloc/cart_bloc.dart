import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fresho/dataModel/cartListItem.dart';
import 'package:fresho/features/homePage/bloc/home_bloc.dart';
import 'package:fresho/features/homePage/model/productModel.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {

    on<CartInitialEvent>(cartInitialEvent);
    on<CartRemoveEvent>(cartRemoveEvent);
  }

  FutureOr<void> cartInitialEvent(CartInitialEvent event, Emitter<CartState> emit) {

 emit(CartLoadedState(cartList: cartItems));
  }

  FutureOr<void> cartRemoveEvent(CartRemoveEvent event, Emitter<CartState> emit) {
    cartItems.remove(event.removeFromCart);
    print("cart Item removed");
    emit(CartLoadedState(cartList: cartItems));
  }
}
