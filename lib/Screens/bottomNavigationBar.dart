import 'package:alaimtidad/Screens/setting.dart';
import 'package:alaimtidad/Screens/wallet.dart';
import 'package:flutter/material.dart';
import '../Constants/theme.dart';
import 'Home.dart';
import 'account.dart';
import 'package:flutter_svg/flutter_svg.dart';
class bottomNavigationBar extends StatefulWidget {
  const bottomNavigationBar({Key? key}) : super(key: key);

  @override
  State<bottomNavigationBar> createState() => _bottomNavigationBarState();
}


  int bottomNavigationBarIndex = 0;


class _bottomNavigationBarState extends State<bottomNavigationBar> {



  void onItemTapped(int index) {

    setState(() {
      bottomNavigationBarIndex = index;
      print("abd");
    });
  }



  static const List<Widget> _widgetOptions = <Widget>[
     Home(),
    account(),
    wallet(),
    setting(),
  ];
  @override
  Widget build(BuildContext context) {
    Themes theme = Themes();
    return Scaffold(
      // appBar: AppBar(),
      body: _widgetOptions[bottomNavigationBarIndex],

      bottomNavigationBar: BottomNavigationBar(
        items:  <BottomNavigationBarItem>[
          BottomNavigationBarItem(

            icon: bottomNavigationBarIndex!=0?SvgPicture.asset("assets/icon/Home_notFULL.svg",):SvgPicture.asset("assets/icon/Home.svg",),
          //  icon: Icon(Icons.home,size: 30,),
            label: '',


          ),
          BottomNavigationBarItem(
            icon: bottomNavigationBarIndex!=1?SvgPicture.asset("assets/icon/Profile.svg",):SvgPicture.asset("assets/icon/Profile_Red.svg",),
          //  icon: Icon(Icons.account_circle_rounded,size: 30,),
            label: '',

          ),
          BottomNavigationBarItem(
             icon: bottomNavigationBarIndex!=2?SvgPicture.asset("assets/icon/Wallet.svg",):SvgPicture.asset("assets/icon/Wallet_Red.svg",),
          //  icon: Icon(Icons.card_travel_outlined,size: 30,),
            label:'',

          ),
          BottomNavigationBarItem(
            icon: bottomNavigationBarIndex!=3?SvgPicture.asset("assets/icon/Setting.svg",):SvgPicture.asset("assets/icon/Setting_Red.svg",),
         //   icon: Icon(Icons.settings,size: 30,),
            label:'',

          ),
        ],
        currentIndex: bottomNavigationBarIndex,
        selectedItemColor: Colors.red,
        selectedFontSize: 0,

        backgroundColor: Color(theme.getColor("backgrouund")),
        type: BottomNavigationBarType.fixed,
        onTap: onItemTapped,
      ),
    );
  }
}
