
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/material.dart';

class Themes extends GetxController {
  final theme = GetStorage();

  Map<String, Object> darkTheme = {

    "iconsColor": "0xFFFFFFFF",
    "backgrouund": "0xFF000000",
    "contentColor": "0xFF252525",
    "arrow_forward_ios_rounded":"0xFFB0B0B0",
  };
  Map<String, Object> whiteTheme = {
    "iconsColor": "0xFF000000",
    "backgrouund": "0xFFFFFFFF",
    "contentColor": "0xffcc333",
    "arrow_forward_ios_rounded":"0xFFB0B0B0",
  };

  getColor(key) {

    theme.writeIfNull("Theme", 2);

    if (theme.read('Theme') == 2) {
      return int.parse(whiteTheme[key].toString());
    } else {
      return int.parse(darkTheme[key].toString());
    }
  }

  changeTheme() {
    theme.writeIfNull("Theme", 2);
    if (theme.read('Theme') == 1) {
      theme.write('Theme', 2);
    } else {
      theme.write('Theme', 1);
    }

    print(theme.read('Theme'));
    // Get.offAll();
    update();
  }
}