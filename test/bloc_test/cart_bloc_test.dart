import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pico_user/presentation/cart/bloc/cart_bloc.dart';
import 'package:pico_user/presentation/configs/configs.dart';

void main() {
  late CartBloc cartBloc;

  group('Cart Bloc adding Same Item', () {
    setUp(() {
      cartBloc = CartBloc();
    });
    test('cart length should be 0', (){
      expect(0, cartBloc.cart.length);
    });

    var item = bestSellingItem[0];
    var expected = {
      item.id: item
    };
    test('cart length should be 1 when one item is added', () {
      cartBloc.add(AddToCart(item));

      // expect(1, cartBloc.cart.length);
      expectLater(
          Success(expected),
          Success(item)
      );
      // debugPrint("data ${cartBloc.cart.length}");
      // expect(true, cartBloc.cart.containsKey(item.id));
      // expect(true, cartBloc.cart.containsValue([item]));
    });

    var item1 = bestSellingItem[1];
    var expected1 = {
      item.id: item,
      item1.id: item1,
    };
    test('cart length should be 2 when another item is added', () {
      cartBloc.add(AddToCart(item1));

      // expect(1, cartBloc.cart.length);
      expectLater(
          Success(expected1),
          Success(item1)
      );
      // debugPrint("data ${cartBloc.cart.length}");
      // expect(true, cartBloc.cart.containsKey(item.id));
      // expect(true, cartBloc.cart.containsValue([item]));
    });

  });

}
