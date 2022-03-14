import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_state_management/shared/cubit/counter_cubit/counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState(counterValue: 0));

  static CounterCubit get(context) => BlocProvider.of(context);

  increment() => emit(CounterState(counterValue: state.counterValue + 1));

  decrement() => emit(CounterState(counterValue: state.counterValue - 1));
}
