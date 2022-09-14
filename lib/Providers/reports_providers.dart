import 'package:flutter/cupertino.dart';
import '../Constants/language.dart';
class reports_provider extends ChangeNotifier {
  int item = 0;
  Language language2 = Language();
  List list = ["الاسبوعية", "الشهرية", "السنوية"];
  List list2 = ["The year", "Monthly", "Weekly"];

  List days_ar = ["السبت","احد","اثنين","ثلاثاء", "اربعاء", "خميس","الجمعة"];
  List days_en =  ["Saturday","Sunday","Monday","Tuesday", "Wednesday", "Thursday","Friday"];

   List months = ["January","February","March","April","May","June","July","August","September","October","November","December"];
   List months_er = ["يناير","فبراير","مارس","ابريل","مايو","يونيو","يوليو","أغسطس","سبتمبر","أكتوبر","نوفمبر","ديسمبر"];

   List year = ["2010","2011","2012","2013","2014","2015","2016","2017"];


  List last_transaction_ = [
    [
      "زين",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTyVgeAbygp_WqTJL7MqIjINmWDW0T3IRr1TL-JqUGqIFGv0ySIpC1vh-luAVZWfFonnrQ&usqp=CAU",
      "20,000",
      "2022/2/2"
    ],
    [
      "اسيا سيل",
      "https://play-lh.googleusercontent.com/BqN_VzEA0TfTlJ_YvdQSg0eFqRbi7DGBHptCOVfEh4OKppmE-5bvicXbLkPlHBIM2Q",
      "20,000",
      "2022/2/2"
    ],
    [
      "كورك",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRcpeXRi8XBtBVj3EU-W7z49Ymu25Z714i3LMzPtxVXpKNkuGgF0r8C4xqMTaTSARl_Fpk&usqp=CAU",
      "20,000",
      "2022/2/2"
    ],
    [
      "زين",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTyVgeAbygp_WqTJL7MqIjINmWDW0T3IRr1TL-JqUGqIFGv0ySIpC1vh-luAVZWfFonnrQ&usqp=CAU",
      "20,000",
      "2022/2/2"
    ],
    [
      "زين",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTyVgeAbygp_WqTJL7MqIjINmWDW0T3IRr1TL-JqUGqIFGv0ySIpC1vh-luAVZWfFonnrQ&usqp=CAU",
      "20,000",
      "2022/2/2"
    ],
    [
      "زين",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTyVgeAbygp_WqTJL7MqIjINmWDW0T3IRr1TL-JqUGqIFGv0ySIpC1vh-luAVZWfFonnrQ&usqp=CAU",
      "20,000",
      "2022/2/2"
    ],
    [
      "زين",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTyVgeAbygp_WqTJL7MqIjINmWDW0T3IRr1TL-JqUGqIFGv0ySIpC1vh-luAVZWfFonnrQ&usqp=CAU",
      "20,000",
      "2022/2/2"
    ]
  ];
  int selectedIndex = 0;

  bool hint_button = true;

  void hint_button_() {
    hint_button = false;
    notifyListeners();
  }

  void show_button() {
    hint_button = true;
    notifyListeners();
  }

  onSearchTextChanged(String text) async {
    //   last_transaction_.clear();
    if (text.isEmpty) {
      return;
    }

    last_transaction_.forEach((userDetail) {
      if (userDetail.firstName.contains(text) ||
          userDetail.lastName.contains(text)) last_transaction_.add(userDetail);
    });

    notifyListeners();
  }
}
