import 'package:fenix_user/common/constant.dart';
import 'package:fenix_user/database/db.dart';
import 'package:fenix_user/models/api_request_models/call_waiter_request/call_waiter_request.dart';
import 'package:fenix_user/network/urls.dart';
import 'package:fenix_user/widgets/alertBox.dart';
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
      print('Grocery Socket Connected to ${Constants.apiUrl}');
      getNotifiWaiter();
    });
  }

  socketDisconnect() {
    socket.on('disconnect', (_) {
      socket.clearListeners();
      print('Grocery Socket Disconnected');
    });
  }

  getNotifiWaiter() async {
    socket.clearListeners();
    var request;
    var listenTo = URL.NOTIFI_WAITER_REQUEST_EVENT
        .replaceAll('USER_ID', DB().getId() ?? '');
    SocketService().getSocket().on(listenTo, (data) async {
      if (data != null) {
        request = CallWaiterRequest.fromJson(data);
        customDialog(
          status: DIALOG_STATUS.SUCCESS,
          title: request.description,
        );
      }
    });
  }
}
