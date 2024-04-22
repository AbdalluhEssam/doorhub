import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:fluttericon/modern_pictograms_icons.dart';
import 'package:get/get.dart';
import 'package:services/view/widget/auth/custombuttonauth.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/imageassets.dart';
import '../../../core/constant/routes.dart';
import '../../../core/functions/alertextiapp.dart';

class ChooseLoginOrSignup extends StatelessWidget {
  const ChooseLoginOrSignup({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> icons = [
      const CircleAvatar(
        backgroundColor: AppColor.primaryColor,
        child: Padding(
            padding: EdgeInsets.all(10),
            child: Icon(
              ModernPictograms.facebook,
              color: AppColor.backgroundColor,
            )),
      ),
      const CircleAvatar(
        backgroundColor: AppColor.primaryColor,
        child: Padding(
            padding: EdgeInsets.all(10),
            child: Icon(
              FontAwesome.google,
              color: AppColor.backgroundColor,
            )),
      ),
      const CircleAvatar(
        backgroundColor: AppColor.primaryColor,
        child: Padding(
            padding: EdgeInsets.all(10),
            child: Icon(
              FontAwesome.linkedin,
              color: AppColor.backgroundColor,
            )),
      ),
      const CircleAvatar(
        backgroundColor: AppColor.primaryColor,
        child: Padding(
            padding: EdgeInsets.all(10),
            child: Icon(
              FontAwesome.twitter,
              color: AppColor.backgroundColor,
            )),
      ),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("اختار الصلاحية")),
      body: WillPopScope.new(
        onWillPop: alertExitApp,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: Image.asset(
                AppImageAssets.onBoardingImageglusLogo,
                height: Get.width * 0.7,
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomButtonAuth(
                    text: 'شخص عادى'.tr,
                    onPressed: () {
                      Get.offAllNamed(AppRoute.login);
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomButtonAuth(
                    text: 'شيف'.tr,
                    onPressed: () {
                      Get.offAllNamed(AppRoute.login);
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
