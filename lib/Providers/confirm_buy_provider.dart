import 'package:flutter/cupertino.dart';

class confirm_buy_provider extends ChangeNotifier{

  int i=1;
  void add_number(){
    i++;
    notifyListeners();
  }
  void delete_number(){
    if(1<i){
      i--;
    }

    notifyListeners();
  }
}