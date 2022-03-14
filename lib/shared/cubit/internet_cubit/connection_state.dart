import 'package:flutter_state_management/connectivity_type.dart';

abstract class ConnectivityStates {}

class ConnectionLoadingState extends ConnectivityStates {}

class ConnectedState extends ConnectivityStates {
  final ConnectivityType type;

  ConnectedState(this.type);
}

class NotConnectedState extends ConnectivityStates {}
