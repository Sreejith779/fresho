part of 'cart_bloc.dart';

@immutable
abstract class CartEvent {}

class CartInitialEvent extends CartEvent{}
class CartRemoveEvent extends CartEvent{
  final ProductModel removeFromCart;

  CartRemoveEvent({required this.removeFromCart});
}

