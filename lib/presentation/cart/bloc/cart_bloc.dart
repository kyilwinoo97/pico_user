import 'dart:async';
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/model/item.dart';

part 'cart_event.dart';
part 'cart_state.dart';
class CartBloc extends Bloc<CartEvent,CartState>{
  Map<String,List<Item>> cart = {};

  CartBloc() : super(InitialState()) {
    on<AddToCart>(_addToCart);
    on<RemoveFromCart>(_removeFromCart);
    on<GetCart>(_getAllData);
  }


  FutureOr<void> _addToCart(AddToCart event, Emitter<CartState> emit) async{
    emit(const Loading());
    if(cart.containsKey(event.item.id.toString())){
      var item = cart[event.item.id.toString()];
     item?.add(event.item);
     cart[event.item.id.toString()] = item!;
    }else{
      List<Item> item = [];
      item.add(event.item);
      cart.putIfAbsent(event.item.id.toString(), () => item);
    }
    if(cart.isEmpty){
      emit(Empty(cart));
      return;
    }
    emit(Success(cart));
  }

  FutureOr<void> _getAllData(GetCart event, Emitter<CartState> emit) async{
    emit(const Loading());
    if(cart.isEmpty){
      emit(Empty(cart));
      return;
    }
    emit(Success(cart));
  }

  FutureOr<void> _removeFromCart(RemoveFromCart event, Emitter<CartState> emit) async{
    emit(const Loading());
    if(cart.containsKey(event.item.id.toString())){
      var item = cart[event.item.id.toString()];
      item?.remove(event.item);
      if(item!.isNotEmpty){
        cart[event.item.id.toString()] = item;
      }else{
        cart.remove(event.item.id.toString());
      }
    }
    if(cart.isEmpty){
      emit(Empty(cart));
      return;
    }
    emit(Success(cart));
  }
}