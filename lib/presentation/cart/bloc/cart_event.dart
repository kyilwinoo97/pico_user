part of 'cart_bloc.dart';
abstract class CartEvent extends Equatable{
  @override
  List<Object?> get props => [];

}
class AddToCart extends CartEvent{
  Item item;
  AddToCart(this.item);
}
class RemoveFromCart extends CartEvent{
  Item item;
  RemoveFromCart(this.item);
}
class GetCart extends CartEvent{
  GetCart();
}
class ClearCart extends CartEvent{
  ClearCart();
}