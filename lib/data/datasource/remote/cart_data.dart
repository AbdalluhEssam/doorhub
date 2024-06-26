import 'package:get/get.dart';
import 'package:services/core/class/crud.dart';
import 'package:services/likeapi.dart';
import '../../../core/services/services.dart';

class CardViewData {
  Crud crud;
  MyServices myServices = Get.find();

  CardViewData(this.crud);

  getData() async {
    var response = await crud.postData(AppLink.cardView, {
      "id": myServices.sharedPreferences.getString("id"),
    });
    return response.fold((l) => l, (r) => r);
  }

  deleteData(String id) async {
    var response =
        await crud.postData(AppLink.cardDelete, {"id": id.toString()});
    return response.fold((l) => l, (r) => r);
  }

  checkCoupon(String couponName) async {
    var response = await crud.postData(AppLink.couponView, {
      "couponname": couponName.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }

  editData(String id, String q) async {
    var response = await crud.postData(AppLink.cardEdit, {
      "cart_id": id.toString(),
      "user_id": myServices.sharedPreferences.getString("id").toString(),
      "quantity": q.toString()
    });
    return response.fold((l) => l, (r) => r);
  }

  addData(String itemId) async {
    var response = await crud.postData(AppLink.cardAdd, {
      "items_id": itemId.toString(),
      "user_id": myServices.sharedPreferences.getString("id").toString(),
    });
    return response.fold((l) => l, (r) => r);
  }

  cardDelData() async {
    var response = await crud.postData(AppLink.del, {
      "id": myServices.sharedPreferences.getString("id").toString(),
    });
    return response.fold((l) => l, (r) => r);
  }
}

class Booking {
  Crud crud;
  MyServices myServices = Get.find();

  Booking(this.crud);

  getData() async {
    var response = await crud.postData(AppLink.viewBooking, {
      "id": myServices.sharedPreferences.getString("id"),
    });
    return response.fold((l) => l, (r) => r);
  }
  editData(bookingId ,status ) async {
    var response = await crud.postData(AppLink.editBooking, {
      "booking_id": bookingId.toString(),
      "status": status.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }
  getAllData() async {
    var response = await crud.postData(AppLink.viewBookingAll, {
    });
    return response.fold((l) => l, (r) => r);
  }

  addData(String itemId, String address, String location, String note,
      String date, String hour) async {
    var response = await crud.postData(AppLink.addBooking, {
      "items_id": itemId.toString(),
      "users_id": myServices.sharedPreferences.getString("id").toString(),
      "address": address.toString(),
      "location": location.toString(),
      "note": note.toString(),
      "date": date.toString(),
      "hour": hour.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }
}
