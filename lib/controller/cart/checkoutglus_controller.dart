// ignore_for_file: avoid_print

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:services/data/datasource/remote/cart_data.dart';
import 'package:services/data/model/itemsmodel.dart';
import '../../core/class/statusrequest.dart';
import '../../core/constant/color.dart';
import '../../core/constant/routes.dart';
import '../../core/functions/handlingdatacontroller.dart';
import '../../core/functions/translatedordatabase.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/address_data.dart';
import '../../data/model/address_model.dart';

abstract class CheckOutGlusController extends GetxController {
  getAddress();
}

class CheckOutGlusControllerImp extends CheckOutGlusController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  MyServices myServices = Get.find();
  late StatusRequest statusRequest;
  bool loading = false;
  List<AddressModel> address = [];
  late TextEditingController phone;
  Booking booking = Booking(Get.find());
  AddressData addressData = Get.put(AddressData(Get.find()));

  late ItemsModel itemsModel;
  String? note;
  String? focusDate;
  String? timeHour;
  String? delivery = '0';
  String addressId = "0";

  chooseShippingAddresss(String val,String deliverySelect) {
    addressId = val;
    delivery = deliverySelect;
    update();
  }

  @override
  getAddress() async {
    address.clear();
    statusRequest = StatusRequest.loading;
    var response = await addressData.getData(myServices.sharedPreferences.getString("id").toString());
    if (kDebugMode) {
      print("========================================================================$response");
    }
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List re = response['data'];
        address.addAll(re.map((e) => AddressModel.fromJson(e)));
        addressId = address[0].addressId.toString();
        delivery = address[0].delivery.toString();
        update();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
  itemsModel = Get.arguments['itemsModel'];
  focusDate = Get.arguments['focusDate'].toString();
  timeHour = Get.arguments['timeHour'].toString();
  note = Get.arguments['note'].toString();

  phone = TextEditingController();
    getAddress();
    if (address.isNotEmpty) {
      Timer.periodic(const Duration(seconds: 5), (timer) {
        getAddress();
        update();
      });
    }
    update();
    super.onInit();
  }

  @override
  void dispose() {
    phone.dispose();
    super.dispose();
  }

  Future saveOrder() async {
    if (address.isNotEmpty) {
      if (formState.currentState!.validate()) {
        statusRequest = StatusRequest.loading;
        var response = await booking.addData(
            itemsModel.itemsId.toString(),
            addressId.toString(),
            addressId.toString(),
            note.toString(),
            focusDate.toString(),
            timeHour.toString(),
           );
        print(
            "========================================================================$response");
        statusRequest = handlingData(response);
        if (StatusRequest.success == statusRequest) {
          if (response['status'] == "success") {
            Fluttertoast.showToast(
                msg: "successglus".tr,
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: AppColor.primaryColor,
                textColor: Colors.white,
                fontSize: 16.0);
            Get.offAllNamed(AppRoute.myHomePage);
          } else {
            statusRequest = StatusRequest.failure;
          }
        }
        update();
      }
    }else{
      Get.snackbar(
          "${translateDataBase("الرجاء اضافة عنوان", "Please add a address")} ",
          "${translateDataBase("الرجاء اضافة عنوان لاتمام عملية الشراء", "Please add an address to complete the purchase")} ",
          icon: const Icon(Icons.location_on),
          barBlur: 2,
          margin: EdgeInsets.zero,
          backgroundColor: AppColor.primaryColor.withOpacity(0.4),
          isDismissible: true,
          duration: const Duration(seconds: 3),
          colorText: AppColor.black,
          borderRadius: 0);
      getAddress();
    }
  }
}
