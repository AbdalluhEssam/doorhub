import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:services/core/functions/translatedordatabase.dart';
import 'package:intl/intl.dart';
import 'package:services/data/model/booking_model.dart';
import '../../../../controller/cart/orderviewAdmin_controller.dart';
import '../../../../core/class/handlingdataview.dart';
import '../../../../core/constant/color.dart';

class BookingAdminView extends StatelessWidget {
  const BookingAdminView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(OrderViewAdminControllerImp());
    return Scaffold(
        appBar: AppBar(
          title: Text("${translateDataBase("عرض الحجوزات", "Booking View")}"),
        ),
        body: GetBuilder<OrderViewAdminControllerImp>(
            init: Get.put(OrderViewAdminControllerImp()),
            builder: (controller) => HandlingDataViewNot(
                statusRequest: controller.statusRequest,
                widget: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: const ListOrder()))));
  }
}

class ListOrder extends GetView<OrderViewAdminControllerImp> {
  const ListOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      physics: const BouncingScrollPhysics(),
      itemCount: controller.bookings.length,
      itemBuilder: (context, index) {
        return ListCartView(
          bookingModel: BookingModel.fromJson(controller.bookings[index]),
        );
      },
      separatorBuilder: (BuildContext context, int index) => const SizedBox(
        height: 12,
      ),
    );
  }
}

class ListCartView extends StatelessWidget {
  final BookingModel bookingModel;

  const ListCartView({Key? key, required this.bookingModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(OrderViewAdminControllerImp());
    return GetBuilder<OrderViewAdminControllerImp>(
        builder: (controller) => Container(
            margin: const EdgeInsets.symmetric(vertical: 5),
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  blurRadius: 30,
                  color: AppColor.black.withOpacity(0.1),
                  spreadRadius: 0,
                  offset: const Offset(12, 12))
            ]),
            child: Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              ),
              elevation: 3,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "idorder".tr,
                            ),
                            Text(
                              " : ${bookingModel.bookingId}",
                            ),
                          ],
                        ),

                        Row(
                          children: [
                            Text(
                                "${translateDataBase("اسم العامل", "Working name")}"),
                            Text(
                              " : ${translateDataBase(bookingModel.itemsNameAr!, bookingModel.itemsName!)}",
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                                "${translateDataBase("اسم العنوان", "Name Title")}"),
                            Text(
                              " : ${bookingModel.addressName}",
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                                "${translateDataBase("العنوان بالتفصيل", "Detailed address")}"),
                            Text(
                              " : ${bookingModel.addressStreet}",
                            ),
                          ],
                        ),
                        // Row(
                        //   children: [
                        //     Text(
                        //       "total".tr,
                        //       style: const TextStyle(fontSize: 12),
                        //     ),
                        //     Text(
                        //       double.parse(bookingModel
                        //           .totalPriceOrder!) ==
                        //           double.parse(
                        //               bookingModel.totalPrice!)
                        //           ? " : سيتم تحديد السعر من خلال خدمة العملاء"
                        //           : " : ${bookingModel.totalPriceOrder!}",
                        //       style: const TextStyle(fontSize: 12),
                        //     ),
                        //   ],
                        // ),
                        Row(
                          children: [
                            Flexible(
                              child: Text(
                                "notede".tr,
                              ),
                            ),
                            Text(
                              bookingModel.note! == ''
                                  ? translateDataBase("لا يوجد", "Nothing")
                                  : bookingModel.note!,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "requesttime".tr,
                          style: const TextStyle(fontSize: 12),
                        ),
                        Text(
                          DateFormat.yMMMEd()
                              .format(DateTime.parse(bookingModel.createAt!))
                              .toString(),
                          style: const TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  if (bookingModel.status == "2")
                    CustomButtonOrder(
                      text: "تم الانتهاء",
                      onPressed: () {
                        controller.editData(
                            bookingModel.bookingId.toString(), 5.toString());
                      },
                      color: Colors.green,
                    ),
                  if (bookingModel.status == "1")
                    CustomButtonOrder(
                      text: "تم التاكيد",
                      onPressed: () {
                        controller.editData(
                            bookingModel.bookingId.toString(), 2.toString());
                      },
                      color: Colors.greenAccent,
                    ),
                  if (bookingModel.status != "0" && bookingModel.status != "5")
                    CustomButtonOrder(
                      text: "الغاء",
                      onPressed: () {
                        controller.editData(
                            bookingModel.bookingId.toString(), 0.toString());
                      },
                      color: Colors.red,
                    ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(5),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: int.parse(bookingModel.status!) == 1
                            ? AppColor.primaryColor
                            : int.parse(bookingModel.status!) == 2
                                ? Colors.greenAccent
                                : int.parse(bookingModel.status!) == 3
                                    ? AppColor.bg.withOpacity(0.5)
                                    : int.parse(bookingModel.status!) == 5
                                        ? Colors.green
                                        : Colors.red),
                    child: Text(
                      int.parse(bookingModel.status!) == 1
                          ? "1".tr
                          : int.parse(bookingModel.status!) == 2
                              ? "2".tr
                              : int.parse(bookingModel.status!) == 3
                                  ? "3".tr
                                  : int.parse(bookingModel.status!) == 5
                                      ? "5".tr
                                      : "0".tr,
                      style: const TextStyle(fontSize: 12),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            )));
  }
}

class CustomButtonOrder extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  final Color color;

  const CustomButtonOrder(
      {Key? key, this.onPressed, required this.text, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      color: color,
      textColor: Colors.white,
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
      ),
    );
  }
}
