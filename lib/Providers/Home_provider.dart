import 'package:flutter/material.dart';

import '../Models/model_home.dart';

class home_provider extends ChangeNotifier{
  //Selling cards
  List Task=[ ["assets/images/Task/sell_cards.png", "بيع البطاقات"] ,["assets/images/Task/account_statement.png", "مشروع قانون"],["assets/images/Task/transfer.png","تحويل رصيد"],["assets/images/Task/fill_account.png","تعبئة الجهاز"]];

  List Task_en=[ ["assets/images/Task/sell_cards.png", "Selling cards"] ,["assets/images/Task/account_statement.png", "Bill"],["assets/images/Task/transfer.png","Balance transfer"],["assets/images/Task/fill_account.png","Device Filling"]];
  // List Task_text=["مدري","تحويل رصيد","كشف حساب","بيع كارتات"];



}