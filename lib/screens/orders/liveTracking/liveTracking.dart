import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:restaurant_saas/common/constant.dart';
import 'package:restaurant_saas/common/utils.dart';
import 'package:restaurant_saas/models/api_response_models/order/order.dart';
import 'package:restaurant_saas/providers/providers.dart';
import 'package:restaurant_saas/styles/styles.dart';
import 'package:restaurant_saas/widgets/appbar.dart';
import 'package:restaurant_saas/widgets/normalText.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class LiveTracking extends HookWidget {
  late GoogleMapController mapController;
  late Timer _timer;
  final String? orderId;
  final int? orderID;

  LiveTracking({this.orderId, this.orderID});

  late BitmapDescriptor riderIcon;
  List<LatLng> polylineCoordinatesForDeliveryBoyToStore = [];
  List<LatLng> polylineCoordinatesForStoreToCustomer = [];
  Map<PolylineId, Polyline> polylines = {};
  PolylinePoints polylinePoints = PolylinePoints();
  LatLng? storeLocation, userLocation, deliveryBoyLocation;

  @override
  Widget build(BuildContext context) {
    final state = useProvider(liveTrackingProvider);

    final isMounted = useIsMounted();

    useEffect(() {
      if (isMounted()) {
        Future.delayed(Duration.zero, () async {
          riderIcon = BitmapDescriptor.fromBytes(
            await getBytesFromAsset('lib/assets/icons/delivery-man.bmp', 100),
          );

          await context
              .read(liveTrackingProvider.notifier)
              .fetchTrackingDetails(orderId!)
              .then((res) async {
            if (res != null) {
              storeLocation = LatLng(
                  res.franchiseCoordinates[1], res.franchiseCoordinates[0]);
              userLocation =
                  LatLng(res.userCoordinates[1], res.userCoordinates[0]);
              if (res.deliveryCoordinates.isNotEmpty) {
                deliveryBoyLocation = LatLng(
                    res.deliveryCoordinates[1], res.deliveryCoordinates[0]);
                await setPolylinesDeliveryToStore();
              }
              await setPolylinesStoreToCustomer();
            }
          });
        });
        _timer = Timer.periodic(Duration(seconds: 15), (timer) {
          Future.delayed(Duration.zero, () {
            context
                .read(liveTrackingProvider.notifier)
                .fetchTrackingDetails(orderId!)
                .then((res) async {
              if (res != null) {
                storeLocation = LatLng(
                    res.franchiseCoordinates[1], res.franchiseCoordinates[0]);

                userLocation =
                    LatLng(res.userCoordinates[1], res.userCoordinates[0]);
                if (res.deliveryCoordinates.isNotEmpty) {
                  deliveryBoyLocation = LatLng(
                      res.deliveryCoordinates[1], res.deliveryCoordinates[0]);
                  await setPolylinesDeliveryToStore();
                }
                await setPolylinesStoreToCustomer();
              }
            });
          });
        });
      }

      return _timer.cancel;
    }, const []);

    return Scaffold(
      appBar: titleAppbar(context, '${'ORDER_ID'.tr} : ${orderID ?? ''}'),
      body: (state.orderTrackResponse != null)
          ? Stack(
              children: [
                GoogleMap(
                  mapType: MapType.normal,
                  initialCameraPosition: CameraPosition(
                    target: (state.orderTrackResponse?.deliveryCoordinates
                                .isNotEmpty ??
                            false)
                        ? LatLng(
                            state.orderTrackResponse!.deliveryCoordinates[1],
                            state.orderTrackResponse!.deliveryCoordinates[0],
                          )
                        : LatLng(
                            state.orderTrackResponse!.franchiseCoordinates[1],
                            state.orderTrackResponse!.franchiseCoordinates[0],
                          ),
                    zoom: 12,
                  ),
                  markers: <Marker>{
                    if (state.orderTrackResponse?.deliveryCoordinates
                            .isNotEmpty ??
                        false)
                      Marker(
                        markerId: MarkerId('delivery boy'),
                        position: LatLng(
                          state.orderTrackResponse!.deliveryCoordinates[1],
                          state.orderTrackResponse!.deliveryCoordinates[0],
                        ),
                        icon: riderIcon,
                      ),
                    Marker(
                      markerId: MarkerId('user'),
                      position: LatLng(
                        state.orderTrackResponse!.userCoordinates[1],
                        state.orderTrackResponse!.userCoordinates[0],
                      ),
                    ),
                    Marker(
                      markerId: MarkerId('franchise'),
                      position: LatLng(
                        state.orderTrackResponse!.franchiseCoordinates[1],
                        state.orderTrackResponse!.franchiseCoordinates[0],
                      ),
                    ),
                  },
                  polylines: Set<Polyline>.of(polylines.values),
                  onMapCreated: (controller) async {
                    mapController = controller;
                  },
                  onTap: (coordinates) {
                    mapController
                        .animateCamera(CameraUpdate.newLatLng(coordinates));
                  },
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(12),
                        color: light,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                verticalDottedLine(context, buttonBorder, 90.0),
                                SizedBox(
                                  width: 8,
                                ),
                                Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      titletextDarkSmallBM(
                                          context,
                                          state.orderTrackResponse!
                                              .restaurantName),
                                      titletextDarkLightXXXSmallBR(
                                          context,
                                          state.orderTrackResponse!
                                              .franchiseName),
                                      SizedBox(height: 20),
                                      titletextDarkSmallBM(
                                          context,
                                          state.orderTrackResponse!.userAddress!
                                              .addressType),
                                      titletextDarkLightXXXSmallBR(context,
                                          '${state.orderTrackResponse!.userAddress!.houseInfo} , ${state.orderTrackResponse!.userAddress!.address}'),
                                      SizedBox(height: 10),
                                    ])
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                          color: Colors.white,
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GFListTile(
                                margin: EdgeInsets.all(0),
                                padding: EdgeInsets.all(0),
                                avatar: Image.asset(
                                  'lib/assets/icons/check.png',
                                  scale: 3,
                                ),
                                title: titleTextDarkSmallBR(
                                    context,
                                    state.orderTrackResponse!.orderStatus ==
                                            ORDER_STATUS.confirmed
                                        ? 'ORDER_CONFIRMED'.tr
                                        : state.orderTrackResponse!
                                                    .orderStatus ==
                                                ORDER_STATUS.outForDelivery
                                            ? 'ORDER_IS_ON_THE_WAY'.tr
                                            : ''),
                                icon: (state.orderTrackResponse!.assignedToId ==
                                        null)
                                    ? ColorFiltered(
                                        colorFilter: ColorFilter.mode(
                                            Colors.white, BlendMode.color),
                                        child: Image.asset(
                                          'lib/assets/icons/cellPhone.png',
                                          scale: 3,
                                        ),
                                      )
                                    : InkWell(
                                        onTap: () {
                                          if (state.orderTrackResponse!
                                                  .assignedToId !=
                                              null) {
                                            FlutterPhoneDirectCaller.callNumber(
                                                state
                                                    .orderTrackResponse!
                                                    .assignedToId!
                                                    .mobileNumber!);
                                          }
                                        },
                                        child: Image.asset(
                                          'lib/assets/icons/cellPhone.png',
                                          scale: 3,
                                        ),
                                      ),
                              ),
                              if (state.orderTrackResponse!.orderStatus ==
                                  ORDER_STATUS.confirmed)
                                titleTextDarkLightXSmallBR(
                                    context,
                                    'DELIVERY_BOY_IS_ON_THE_WAY_TO_PICK_YOUR_ORDER'
                                        .tr)
                              else if (state.orderTrackResponse!.orderStatus ==
                                  ORDER_STATUS.outForDelivery)
                                titleTextDarkLightXSmallBR(
                                    context,
                                    'DELIVERY_BOY_IS_ON__THE_TO__YOUR_DOORSTEP'
                                        .tr)
                            ],
                          )),
                    ],
                  ),
                )
              ],
            )
          : GFLoader(),
    );
  }

  void dispose() async {
    _timer.cancel();
  }

  Future<void> setPolylinesDeliveryToStore() async {
    var deliveryToStore = await polylinePoints.getRouteBetweenCoordinates(
      Constants.googleMapApiKey,
      PointLatLng(
          deliveryBoyLocation!.latitude, deliveryBoyLocation!.longitude),
      PointLatLng(storeLocation!.latitude, storeLocation!.longitude),
    );

    if (deliveryToStore.points.isNotEmpty) {
      polylineCoordinatesForDeliveryBoyToStore = [];
      deliveryToStore.points.forEach((PointLatLng point) {
        polylineCoordinatesForDeliveryBoyToStore
            .add(LatLng(point.latitude, point.longitude));
      });

      var id = PolylineId('polylineCoordinatesForDeliveryBoyToStore');
      var polyline = Polyline(
          polylineId: id,
          color: primary,
          visible: true,
          width: 2,
          points: polylineCoordinatesForDeliveryBoyToStore);
      polylines[id] = polyline;
    }
  }

  Future<void> setPolylinesStoreToCustomer() async {
    var storeToCustomer = await polylinePoints.getRouteBetweenCoordinates(
      Constants.googleMapApiKey,
      PointLatLng(storeLocation!.latitude, storeLocation!.longitude),
      PointLatLng(userLocation!.latitude, userLocation!.longitude),
    );

    if (storeToCustomer.points.isNotEmpty) {
      polylineCoordinatesForStoreToCustomer = [];
      storeToCustomer.points.forEach((PointLatLng point) {
        polylineCoordinatesForStoreToCustomer
            .add(LatLng(point.latitude, point.longitude));
      });

      var id = PolylineId('polylineCoordinatesForStoreToCustomer');
      var polyline = Polyline(
          polylineId: id,
          color: primary,
          visible: true,
          width: 2,
          points: polylineCoordinatesForStoreToCustomer);
      polylines[id] = polyline;
    }
  }
}
