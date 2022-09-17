import 'package:flutter/material.dart';

import '../Models/model_home.dart';

class home_provider extends ChangeNotifier{
  //Selling cards
  List Task=[ ["assets/images/Task/sell_cards.png", "بيع البطاقات"] ,["assets/images/Task/account_statement.png", "مشروع قانون"],["assets/images/Task/transfer.png","تحويل رصيد"],["assets/images/Task/fill_account.png","تعبئة الجهاز"]];

  List Task_en=[ ["assets/images/Task/sell_cards.png", "Selling cards"] ,["assets/images/Task/account_statement.png", "Bill"],["assets/images/Task/transfer.png","Balance transfer"],["assets/images/Task/fill_account.png","Device Filling"]];
  // List Task_text=["مدري","تحويل رصيد","كشف حساب","بيع كارتات"];
  List advertisement = ["https://play-lh.googleusercontent.com/BqN_VzEA0TfTlJ_YvdQSg0eFqRbi7DGBHptCOVfEh4OKppmE-5bvicXbLkPlHBIM2Q","https://argaamplus.s3.amazonaws.com/5ca06fed-d23f-454a-8ce3-6cce18d4dacb.png","https://alshifra.net/media/k2/items/cache/388e00cea7b04a25bc8bc7fb61cbe2af_XL.jpg"];


}