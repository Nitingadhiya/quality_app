import 'package:get/get.dart';
import 'package:quality_app/packages/config_package.dart';

class SplashController extends GetxController {
  final box = GetStorage();
  bool get isDark => box.read('darkmode') ?? false;

  @override
  void onInit() async {
    // TODO: implement onInit
    await Future.delayed(Duration(seconds: 2));
    // box.listen(() {
    //   print('box changed');
    //   print(box.read('darkmode'));
    // });
    // box.write('darkmode', false);

    // changeTheme(true);

    print(box.read('darkmode'));
    if (box.read('authToken') != null) {
      Get.offAndToNamed(AppRouter.home);
      //checkLogin();
      // Get.offAndToNamed(AppRouter.bottomNavigationScreen);
    } else {
      checkLogin();
    }
    super.onInit();
  }

  void changeTheme(bool val) => box.write('darkmode', val);

  void checkLogin() {
    Get.offAndToNamed(AppRouter.login);
  }
}
