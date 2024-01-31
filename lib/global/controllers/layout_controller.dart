import 'package:get/get.dart';

class LayoutController extends GetxController {
  RxBool isMobileScreen = true.obs;

  @override
  void onInit() {
    super.onInit();
    checkScreenWidth();
  }

  void checkScreenWidth() {
    double screenWidth = Get.width;
    isMobileScreen.value = screenWidth < 640;
  }
}