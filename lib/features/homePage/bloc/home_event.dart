part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeInitialEvent extends HomeEvent{}
class WishListButtonEvent extends HomeEvent{
 final ProductModel clickedProduct;

  WishListButtonEvent({required this.clickedProduct});
}
class CartButtonEvent extends HomeEvent{
 final ProductModel clickedProduct;

  CartButtonEvent({required this.clickedProduct});
}
