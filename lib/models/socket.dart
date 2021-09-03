import 'package:fenix_user/network/socket.dart';
import 'package:flutter/foundation.dart';

class SocketModel extends ChangeNotifier {
  SocketService? _socket;

  SocketService? get getSocketInstance => _socket;

  void setSocketInstance(SocketService skt) {
    _socket = skt;
  }
}
