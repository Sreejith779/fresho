part of 'wish_list_bloc.dart';

@immutable
abstract class WishListState {}

class WishListInitial extends WishListState {}
class WishListLoadedState extends WishListState{

 final List<ProductModel>wishList;

  WishListLoadedState({required this.wishList});
}
