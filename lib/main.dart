import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_state_management/screens/home/home_screen.dart';
import 'package:flutter_state_management/shared/cubit/counter_cubit/counter_cubit.dart';
import 'package:flutter_state_management/shared/cubit/internet_cubit/connection_cubit.dart';
import 'package:flutter_state_management/utilities/my_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  BlocOverrides.runZoned(() {
    runApp(const MyApp());
  }, blocObserver: MyBlocObserver());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CounterCubit()),
        BlocProvider(create: (context) => ConnectivityCubit()..getConnection()),
      ],
      child: const MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}
