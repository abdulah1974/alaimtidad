import 'package:flutter/material.dart';

import '../Constants/language.dart';
import '../Constants/size.dart';
import '../Constants/theme.dart';

class device_filling extends StatefulWidget {
  const device_filling({Key? key}) : super(key: key);

  @override
  State<device_filling> createState() => _device_fillingState();
}

class _device_fillingState extends State<device_filling> {

  var PhoneNumber = '';
  @override
  Widget build(BuildContext context) {
    Language language = Language();
    Themes theme = Themes();
    var size = mediaQuery(context);
    return Scaffold(
      backgroundColor: Color(theme.getColor("backgrouund")),
      appBar: AppBar(
        elevation: 0,
        leading: InkWell(
          child: Icon(
            Icons.arrow_back,
            color: Color(theme.getColor("iconsColor")),
          ),
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Color(theme.getColor("backgrouund")),
        title: Text(
          language.GetWord('Device Filling'),
          style: TextStyle(color: Color(theme.getColor("iconsColor"))),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: size.getHeight() * 3),
          Center(
            child: Icon(Icons.monetization_on_outlined,
                size: size.getHeight() * 27,
                color: Color(theme.getColor("iconsColor"))),
          ),
          SizedBox(height: size.getHeight() * 8),
          Container(
            height: size.getHeight() * 6,
            width: size.getWidth() * 90,
            decoration: BoxDecoration(
              border: Border.all(
                  color: Colors.white,
                  width: size.getWidth() * 0.3,
                  style: BorderStyle.solid),
              borderRadius: BorderRadius.circular(size.getWidth() * 2),
            ),
            child: Center(
              child: Text(PhoneNumber.length==0?language.GetWord("PIN Number"):PhoneNumber,
                  style: TextStyle(

                    fontSize: 20.0,
                      color: Color(
                        theme.getColor("iconsColor"),
                      ),
                      fontWeight: FontWeight.bold)),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              PhoneNumberWidget(size, 1),
              PhoneNumberWidget(size, 2),
              PhoneNumberWidget(size, 3),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              PhoneNumberWidget(size, 4),
              PhoneNumberWidget(size, 5),
              PhoneNumberWidget(size, 6),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              PhoneNumberWidget(size, 7),
              PhoneNumberWidget(size, 8),
              PhoneNumberWidget(size, 9),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: size.getWidth() * 100 / 3,
              ),
              PhoneNumberWidget(size, 0),
              InkWell(
                  onLongPress: () =>setState((){
                    PhoneNumber = '';
                  }),
                  onTap: (){

                    setState((){
                      var temp = '';
                      for(var i = 0; i < PhoneNumber.length-1; i++){
                        temp += PhoneNumber[i];
                      }
                      PhoneNumber = temp;

                    });

                       },

                  child: Container(
                width: size.getWidth() * 100 / 3,
                height: size.getHeight() * 10,
                alignment: Alignment.center,

                child: Icon(
                  Icons.dangerous_outlined,
                  color: Color(theme.getColor("iconsColor")),
                ),
                // padding: EdgeInsets.only(left: size.getWidth() * 17, right: size.getWidth() * 14, top: size.getHeight() * 5),
              )),
            ],
          ),
          Container(
            width: size.getWidth()*93,
            height: size.getHeight() * 6,
            child: ElevatedButton(

              onPressed: () {
                setState(() {
                 print(PhoneNumber);
                });

              },

              child: Text(language.GetWord("Device Filling")),
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(size.getHeight()*1),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget PhoneNumberWidget(size, number) {
    Themes theme = Themes();
    return InkWell(
      onTap: ()=>setState(()=>PhoneNumber.length<11?PhoneNumber += number.toString():null),
      child: Container(
        width: size.getWidth() * 100 / 3,
        height: size.getHeight() * 10,
        alignment: Alignment.center,
        child: Text(number.toString(),
            style: TextStyle(
                color: Color(theme.getColor("iconsColor")),
                fontSize: size.getHeight() * 3)),
        // padding: EdgeInsets.only(left: size.getWidth() * 15, right: size.getWidth() * 15, top: size.getHeight() * 5),
      ),
    );
  }
}
