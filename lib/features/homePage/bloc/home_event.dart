part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeInitialEvent extends HomeEvent{}
class WishListButtonEvent extends HomeEvent{
   final List<ProductModel>cartItems = wishList;
}
class CartButtonEvent extends HomeEvent{}
