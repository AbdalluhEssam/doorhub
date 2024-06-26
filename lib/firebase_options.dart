// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'dart:convert';
import 'dart:developer';
import 'package:firebase_core/firebase_core.dart'
    show Firebase, FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:services/controller/cart/order_controller.dart';
import 'package:services/core/constant/color.dart';
import 'package:intl/intl.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'controller/notification_controller.dart';

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCSB5GLQFwubEY_Wlwt33M1JSfG4d_36EE',
    appId: '1:72173064622:web:f0014d8c0b7cfccca6383f',
    messagingSenderId: '72173064622',
    projectId: 'kodixa-f64db',
    authDomain: 'kodixa-f64db.firebaseapp.com',
    storageBucket: 'kodixa-f64db.appspot.com',
    measurementId: 'G-TYQ50DENHS',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBnRPxtSCheyQs6bYkgQnE1SIsOdlBH67k',
    appId: '1:72173064622:android:818cd6aaa0bcc279a6383f',
    messagingSenderId: '72173064622',
    projectId: 'kodixa-f64db',
    storageBucket: 'kodixa-f64db.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDNCHb7ZXG4BUvm7zVIpfCN2P35lcC1biA',
    appId: '1:72173064622:ios:b6f937ac5527fe05a6383f',
    messagingSenderId: '72173064622',
    projectId: 'kodixa-f64db',
    storageBucket: 'kodixa-f64db.appspot.com',
    androidClientId:
        '72173064622-ntus8e4te85udoetciik9qv2jg2qflfn.apps.googleusercontent.com',
    iosBundleId: 'com.example.kodixa',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDNCHb7ZXG4BUvm7zVIpfCN2P35lcC1biA',
    appId: '1:72173064622:ios:ec34e237d1763fd5a6383f',
    messagingSenderId: '72173064622',
    projectId: 'kodixa-f64db',
    storageBucket: 'kodixa-f64db.appspot.com',
    androidClientId:
        '72173064622-ntus8e4te85udoetciik9qv2jg2qflfn.apps.googleusercontent.com',
    iosBundleId: 'com.example.kodixa.RunnerTests',
  );
}

class Utils {
  static formatPrice(double price) => '\$ ${price.toStringAsFixed(2)}';

  static formatDate(DateTime date) => DateFormat.yMd().format(date);
}

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> initFcm() async {
  await Firebase.initializeApp();
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    log('User granted permission');
  } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
    log('User granted provisional permission');
  } else {
    log('User declined or has not accepted permission');
  }
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
  var initializationSettingsAndroid =
      const AndroidInitializationSettings('@mipmap/ic_launcher');
  var initializationSettings =
      InitializationSettings(android: initializationSettingsAndroid);
  flutterLocalNotificationsPlugin.initialize(initializationSettings);

  await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  refreshPageNotification(data) {
    if (Get.currentRoute == "/orderproduct" &&
        data['pagename'] == "orderproduct") {
      OrderViewControllerImp controller = Get.find();
      controller.getData();
    }

    if (Get.currentRoute == "/orderglus" &&
        data['pagename'] == "orderglus") {
      OrderViewControllerImp controller = Get.find();
      controller.getData();
    }

    if (data['pagename'] == "orderproduct" || data['pagename'] == "orderglus") {
      NotificationControllerImp controllerImp = Get.find();
      controllerImp.getData();
    }
  }

  FirebaseMessaging.onMessage.listen((RemoteMessage? message) async {
    refreshPageNotification(message?.data);
    Get.snackbar(
      "${message?.notification?.title}",
      "${message?.notification?.body}",
      icon: const Icon(Icons.notifications_active,
          color: AppColor.backgroundColor),
      barBlur: 2,
      margin: const EdgeInsets.symmetric(horizontal: 0),
      padding: const EdgeInsets.all(15),
      backgroundColor: AppColor.primaryColor.withOpacity(0.4),
      isDismissible: true,
      duration: const Duration(seconds: 2),
      colorText: AppColor.backgroundColor,
    );

    RemoteNotification? notification = message?.notification;
    AndroidNotification? android = message?.notification?.android;
    if (notification != null && android != null) {
      flutterLocalNotificationsPlugin.show(
        notification.hashCode,
        notification.title,
        notification.body,
        const NotificationDetails(
            android: AndroidNotificationDetails('channel.id', 'channel.name')),
        payload: json.encode(message?.data),
      );
    }
  });
}
