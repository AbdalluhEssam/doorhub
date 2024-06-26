import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:services/core/constant/routes.dart';
import 'package:services/core/middleware/mymiddleware.dart';
import 'package:services/main.dart';
import 'package:services/view/screen/address/add.dart';
import 'package:services/view/screen/address/view.dart';
import 'package:services/view/screen/auth/choose_admin.dart';
import 'package:services/view/screen/auth/forgetpassword/forgetpassword.dart';
import 'package:services/view/screen/auth/forgetpassword/resetpassword.dart';
import 'package:services/view/screen/auth/forgetpassword/success_resetpassword.dart';
import 'package:services/view/screen/auth/forgetpassword/verfiycode.dart';
import 'package:services/view/screen/auth/login.dart';
import 'package:services/view/screen/auth/signup.dart';
import 'package:services/view/screen/auth/success_signup.dart';
import 'package:services/view/screen/auth/verfiycodesignup.dart';
import 'package:services/view/screen/booking/chechoutglus.dart';
import 'package:services/view/screen/booking/checkout/orderglus.dart';
import 'package:services/view/screen/home/admin/ordersAdmin.dart';
import 'package:services/view/screen/home/admin/product.dart';
import 'package:services/view/screen/home/bookingscreen.dart';
import 'package:services/view/screen/home/categoriespro.dart';
import 'package:services/view/screen/home/home.dart';
import 'package:services/view/screen/home/product.dart';
import 'package:services/view/screen/home/producttop_detalis.dart';
import 'package:services/view/screen/home/serviceshome.dart';
import 'package:services/view/screen/home/splash_screen.dart';
import 'package:services/view/screen/language.dart';
import 'package:services/view/screen/munesetting/contactusscreen.dart';
import 'package:services/view/screen/munesetting/aboutus.dart';
import 'package:services/view/screen/munesetting/policy.dart';
import 'package:services/view/screen/notification_screen.dart';
import 'package:services/view/screen/onboarding.dart';

List<GetPage<dynamic>>? routes = [
  //Auth
  GetPage(
      name: "/", page: () => const OnBoarding(), middlewares: [MyMiddleWare()]),
  // GetPage(name: "/", page: () => const TestView()),
  GetPage(name: AppRoute.login, page: () => const Login()),
  GetPage(name: AppRoute.chooseLoginOrSignup, page: () => const ChooseLoginOrSignup()),
  GetPage(name: AppRoute.language, page: () => const Language()),
  GetPage(name: AppRoute.signup, page: () => const SignUp()),
  GetPage(name: AppRoute.forgetPassword, page: () => const ForgetPassword()),
  GetPage(name: AppRoute.resetPassword, page: () => const ResetPassword()),
  GetPage(
      name: AppRoute.successResetPassword,
      page: () => const SuccessResetPassword()),
  GetPage(name: AppRoute.successSignUp, page: () => const SuccessSignUp()),
  GetPage(
      name: AppRoute.verfiyCodeSignUp, page: () => const VerfiyCodeSignUp()),
  GetPage(
      name: AppRoute.verfiyCodeResetPassword, page: () => const VerfiyCode()),

  //OnBoarding

  GetPage(name: AppRoute.onBoarding, page: () => const OnBoarding()),

  // HOME
  GetPage(name: AppRoute.home, page: () => const HomePage()),
  GetPage(name: AppRoute.myHomePage, page: () => const MyHomePage()),
  GetPage(name: AppRoute.notificationScreen, page: () => const NotificationScreen()),
  GetPage(name: AppRoute.servicesHome, page: () => const ServicesHome()),
  GetPage(name: AppRoute.productView, page: () => const ProductView()),
  // GetPage(name: AppRoute.productPage, page: () => const ProductPage()),
  GetPage(name: AppRoute.productDetails, page: () => const ProductDetails()),
  GetPage(name: AppRoute.productTopSellingDetails, page: () => const ProductTopSellingDetails()),
  GetPage(name: AppRoute.aboutUs, page: () => const AboutUs()),
  GetPage(name: AppRoute.helpPage, page: () => const HelpPage()),
  GetPage(name: AppRoute.productScreen, page: () => const ProductScreen()),
  GetPage(name: AppRoute.productAdminScreen, page: () => const ProductAdminScreen()),
  // GetPage(name: AppRoute.listItem, page: () => const ListItemsHome()),
  GetPage(name: AppRoute.mySplashScreen, page: () => const MySplashScreen()),
  GetPage(name: AppRoute.checkOutGlus, page: () => const CheckOutGlus()),
  GetPage(name: AppRoute.bookingView, page: () => const BookingView()),
  GetPage(name: AppRoute.policyReturn, page: () => const PolicyReturn()),
  GetPage(name: AppRoute.addressView, page: () => const AddressView()),
  GetPage(name: AppRoute.addressAdd, page: () => const AddressAdd()),
  GetPage(name: AppRoute.bookingAdminView, page: () => const BookingAdminView()),
  // GetPage(name: AppRoute.search, page: () =>  SearchScreen()),
];
