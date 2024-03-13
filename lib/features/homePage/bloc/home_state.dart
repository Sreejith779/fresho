part of 'home_bloc.dart';

@immutable
abstract class HomeState {}
abstract class HomeActionState extends HomeState {}

class HomeInitial extends HomeState {}
class HomeLoadingState extends HomeState{
} //
class HomeLoadedState extends HomeState{
final List<ProductModel>products = groceryData.map((e) =>
    ProductModel(name: e["name"], kg: e["kg"], price: e["price"], image: e['image'])).toList();
}

 class WishListedActionState extends HomeActionState{}
 class CartedActionState extends HomeActionState{}