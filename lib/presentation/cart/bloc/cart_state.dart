part of 'cart_bloc.dart';

abstract class CartState extends Equatable{
  const CartState();
  @override
  List<Object?> get props => [];

}

class InitialState extends CartState{
  const InitialState();
}

class Success extends CartState{
  Map<String,List<Item>> cart = {};
  Success(this.cart);
}
class Failure extends CartState{
  const Failure();
}
class Loading extends CartState{
  const Loading();
}
class Empty extends CartState{
  Map<String,List<Item>> cart = {};
  Empty(this.cart);
}