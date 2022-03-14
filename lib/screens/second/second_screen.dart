import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_state_management/shared/cubit/internet_cubit/connection_cubit.dart';
import 'package:flutter_state_management/shared/cubit/internet_cubit/connection_state.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<ConnectivityCubit, ConnectivityStates>(
                builder: (context, state) {
              if (state is ConnectedState) {
                return Text(
                  'Internet Connection ${state.type}',
                );
              }
              return const Text(
                'Internet Connection',
              );
            }),
          ],
        ),
      ),
    );
  }
}
