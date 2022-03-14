import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_state_management/connectivity_type.dart';
import 'package:flutter_state_management/shared/cubit/internet_cubit/connection_state.dart';

class ConnectivityCubit extends Cubit<ConnectivityStates> {
  ConnectivityCubit() : super(ConnectionLoadingState());

  static ConnectivityCubit get(context) => BlocProvider.of(context);

  getConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      emit(ConnectedState(ConnectivityType.mobile));
    } else if(connectivityResult == ConnectivityResult.wifi) {
      emit(ConnectedState(ConnectivityType.mobile));
    } else {
      emit(NotConnectedState());
    }
  }
}
