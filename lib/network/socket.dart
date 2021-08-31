import 'package:fenix_user/common/constant.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketService {
  IO.Socket? socket;

  SocketService() {
    socket = IO.io(Constants.apiUrl, <String, dynamic>{
      'transports': ['websocket']
    });
  }

  IO.Socket? getSocket() {
    return socket;
  }

  socketInitialize() {
    print("Grocery So");
    socket!.on('connect', (_) {
      print('Grocery Socket Connected to ${Constants.apiUrl}');
    });
  }

  emitBeforeDisconnect(userId) {
    socket!.emit('onExit', {'id': userId});
  }

  socketDisconnect() {
    socket!.on('disconnect', (_) {
      socket!.clearListeners();
      print('Grocery Socket Disconnected');
    });
  }

  sendLocationDataThroughSocket({
    String? latitude,
    String? longitude,
    String? deliveryBoyId,
  }) {
    var locationData;
    if (deliveryBoyId != null) {
      locationData = {
        "_id": deliveryBoyId,
        "coordinates": [latitude, longitude]
      };
      socket!.emit("delivery-boy-location-update", locationData);
    }
  }
}
