import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(10); //super(시작 숫자)

  void increment() => emit(state + 1);
  void decrement() => emit(state - 1);
}
