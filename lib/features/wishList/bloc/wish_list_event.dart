part of 'wish_list_bloc.dart';

@immutable
abstract class WishListEvent {}
 class WishListInitialEvent extends WishListEvent{}

class WishListRemoveItem extends WishListEvent{
 final ProductModel productModel;

  WishListRemoveItem({required this.productModel});
}