// ignore_for_file: avoid_print

import 'package:get/get.dart';
import 'package:services/data/datasource/remote/cart_data.dart';
import '../../core/class/statusrequest.dart';
import '../../core/functions/handlingdatacontroller.dart';
import '../../core/services/services.dart';

abstract class OrderViewAdminController extends GetxController {
  initialData();

  getData();
}

class OrderViewAdminControllerImp extends OrderViewAdminController {
  MyServices myServices = Get.find();
  Booking booking = Booking(Get.find());

  List bookings = [];

  late StatusRequest statusRequest;
  String? idUser;
  String? username;
  String? email;
  String? namePro;
  int? idOrder;

  @override
  initialData() {
    username = myServices.sharedPreferences.getString("username");
    email = myServices.sharedPreferences.getString("email");
    idUser = myServices.sharedPreferences.getString("id").toString();
  }

  @override
  void onInit() async {
    getData();
    initialData();
    super.onInit();
  }

  @override
  Future getData() async {
    bookings.clear();
    statusRequest = StatusRequest.loading;
    var response = await booking.getData();
    print("========================================================================$response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        bookings.addAll(response['booking']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    } else {
      statusRequest = StatusRequest.serverFailure;
    }

    update();
  }

  editData(bookingId,status) async {
    statusRequest = StatusRequest.loading;
    var response = await booking.editData(bookingId, status);
    print("========================================================================$response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
       getData();
      } else {
        statusRequest = StatusRequest.failure;
      }
    } else {
      statusRequest = StatusRequest.serverFailure;
    }

    update();
  }
}
