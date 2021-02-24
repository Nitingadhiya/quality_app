import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:quality_app/packages/config_package.dart';

class StoreController extends GetxController with SingleGetTickerProviderMixin {
  TabController tabController;
  var formKey = GlobalKey<FormState>();

  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtMobile = TextEditingController();
  TextEditingController txtPassword = TextEditingController();

  RxBool _isLoading = false.obs;
  String _loginOption;
  int _currentIndex = 0;
  String _isoCode;

  bool get isLoading => _isLoading.value;
  String get isoCode => _isoCode;

  @override
  void onInit() {
    // TODO: implement onInit
    tabController = new TabController(vsync: this, length: 2, initialIndex: 0);
    _loginOption = 'mobile';
    update();
    getPhoneNumber();
    super.onInit();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    tabController.dispose();
    txtMobile?.dispose();
    super.dispose();
  }

  getData() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        List formData = [];
        // setState(() {
        //   isLoading = true;
        // });
        Apis.postApi("GetOffice", formData).then((data) async {
          if (data.IsSuccess == true && data.Data.length > 0) {
            // setState(() {
            //   list = data.Data;
            //   isLoading = false;
            // });
          } else {
            // setState(() {
            //   list.clear();
            //   isLoading = false;
            // });
          }
        }, onError: (e) {
          // setState(() {
          //   list.clear();
          //   isLoading = false;
          //});
        });
      }
    } on SocketException catch (_) {
      // setState(() {
      //   list.clear();
      //   isLoading = false;
      // });
      //showMsg("अपने इंटरनेट की जाँच करें या कुछ समय बाद फिर से कोशिश करें !");
    }
  }

  void getPhoneNumber() async {
    final SmsAutoFill _autoFill = SmsAutoFill();
    final completePhoneNumber = await _autoFill.hint;

    if (completePhoneNumber != null) {
      PhoneNumber numberRegionInfo = await PhoneNumber.getRegionInfoFromPhoneNumber(completePhoneNumber);
      txtMobile.text = int.parse(numberRegionInfo.parseNumber()).toString();
      _isoCode = numberRegionInfo.isoCode;
      update();
    }
  }

  void login() {
    _isLoading.value = true;
    Timer(Duration(seconds: 1), () {
      _isLoading.value = false;
      Get.toNamed(AppRouter.bottomNavigationScreen);
    });
  }
}
