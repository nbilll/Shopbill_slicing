import 'package:get/get.dart';
import 'package:shopbils/core.dart';
import '../view/splash_screen_view.dart';

class SplashScreenController extends GetxController {
  SplashScreenView? view;

  @override
  void onInit() {
    Future.delayed(Duration(seconds: 2), () {
      Get.offAll(LoginView());
    });
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
