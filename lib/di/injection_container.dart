import 'package:get_it/get_it.dart';
import 'package:pico_user/presentation/cart/bloc/cart_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async{
  sl.registerFactory(() => CartBloc());

}

