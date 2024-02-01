import 'package:get/get.dart';

class ThemeController extends GetxController {
  RxBool isLight = true.obs;

  themeChange() {
    isLight(!isLight.value);
  }
}
