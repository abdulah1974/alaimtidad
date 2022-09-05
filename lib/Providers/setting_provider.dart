import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import '../Constants/theme.dart';
class setting_provider extends ChangeNotifier{
  Themes theme = Themes();
  final themes = GetStorage();
   bool nightlight=false;
   bool fingerprint=false;
   bool language=false;
   bool notification=false;
  void nightlight_(){
    theme.changeTheme();
    nightlight=!nightlight;
    notifyListeners();
  }
  void Themsss() {

    if(themes.read('Theme')==1){

       nightlight=true;
    }else{
      nightlight=false;

    }

    notifyListeners();
  }

   void fingerprint_(){
     fingerprint=!fingerprint;
     theme.changeTheme();
     notifyListeners();
   }
   void language_(){
     language=!language;
     notifyListeners();
   }
   void notification_(){
     notification=!notification;
     notifyListeners();
   }
}