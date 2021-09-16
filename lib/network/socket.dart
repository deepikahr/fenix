import 'package:fenix_user/common/constant.dart';

import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketService {
  late IO.Socket socket;

  SocketService() {
    socket = IO.io(Constants.apiUrl, <String, dynamic>{
      'transports': ['websocket']
    });
  }

  IO.Socket getSocket() {
    return socket;
  }

  socketInitialize() {
    socket.on('connect', (_) {
      print('Finex User Socket Connected to ${Constants.apiUrl}');
    });
  }

  socketDisconnect() {
    socket.on('disconnect', (_) {
      socket.clearListeners();
      print('Finex User Socket Disconnected');
    });
  }
}
