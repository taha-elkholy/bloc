import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_state_management/screens/second/second_screen.dart';
import 'package:flutter_state_management/shared/cubit/counter_cubit/counter_cubit.dart';
import 'package:flutter_state_management/shared/cubit/counter_cubit/counter_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('State Management'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            BlocBuilder<CounterCubit, CounterState>(builder: (context, state) {
              if (state.counterValue > 0) {
                return Text(
                  'Positive ${state.counterValue}',
                  style: Theme
                      .of(context)
                      .textTheme
                      .headline4,
                );
              } else if (state.counterValue < 0) {
                return Text(
                  'Negative ${state.counterValue}',
                  style: Theme
                      .of(context)
                      .textTheme
                      .headline4,
                );
              } else {
                return Text(
                  '${state.counterValue}',
                  style: Theme
                      .of(context)
                      .textTheme
                      .headline4,
                );
              }
            }),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    CounterCubit.get(context).increment();
                  },
                  tooltip: 'Increment',
                  child: const Icon(Icons.add),
                ),
                FloatingActionButton(
                  onPressed: () {
                    CounterCubit.get(context).decrement();
                  },
                  tooltip: 'Decrement',
                  child: const Icon(Icons.remove),
                )
              ],
            ),
            ElevatedButton(onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const SecondScreen()));
            }, child: const Text('Second Screen'))
          ],
        ),
      ),
    );
  }
}
