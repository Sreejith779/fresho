part of 'cart_bloc.dart';

@immutable
abstract class CartState {}
abstract class CartActionState extends CartState{}

class CartInitial extends CartState {}
class CartLoadedState extends CartState{

  final List<ProductModel>cartList;

  CartLoadedState({required this.cartList});
}
class CartItemPriceState extends CartState{}
