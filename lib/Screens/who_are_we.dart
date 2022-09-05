import 'package:flutter/material.dart';

import '../Constants/language.dart';
import '../Constants/size.dart';
import '../Constants/theme.dart';

class who_are_we extends StatefulWidget {
  const who_are_we({Key? key}) : super(key: key);

  @override
  State<who_are_we> createState() => _who_are_weState();
}

class _who_are_weState extends State<who_are_we> {
  @override
  Widget build(BuildContext context) {
    Language language = Language();
    Themes theme = Themes();
    var size = mediaQuery(context);
    return Scaffold(
      backgroundColor: Color(theme.getColor("backgrouund")),
      appBar: AppBar(
        leading: InkWell(
          child: Icon(Icons.arrow_back,color: Color(theme.getColor("iconsColor")),),
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(language.GetWord("Who are we"),style: TextStyle(color: Color(theme.getColor("iconsColor"))),),
        backgroundColor: Color(theme.getColor("backgrouund")),
      ),
      body: Column(
        children: [

          SizedBox(height: size.getHeight()*25,),
          Center(child: Text(language.GetWord("Bello company"),style: TextStyle(color: Color(theme.getColor("iconsColor")),fontSize:size.getWidth()*6,fontWeight: FontWeight.bold)),),
          SizedBox(height: size.getHeight()*2,),
          Container(
            padding: EdgeInsets.fromLTRB(size.getWidth()*5, 0, size.getWidth()*5, 0),
            child: Center(child: Text(language.GetWord("For the leading logistics services in the field of electronic solutions"),style: TextStyle(color: Color(theme.getColor("iconsColor")),fontSize: size.getWidth()*6,fontWeight: FontWeight.w200),),),
          ),
          SizedBox(height: size.getHeight()*10,),
          Center(child: Text(language.GetWord("To contact us, please contact"),style: TextStyle(color: Color(theme.getColor("iconsColor")),fontSize:size.getWidth()*6,fontWeight: FontWeight.bold)),),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Icon(Icons.call,size: size.getWidth()*6,color: Color(theme.getColor("iconsColor")),),
              SizedBox(height: size.getHeight()*7,),
              Center(child: Text("07709431604",style: TextStyle(color: Color(theme.getColor("iconsColor")),fontSize:size.getWidth()*6,fontWeight: FontWeight.bold)),),
            ],
          ),
          SizedBox(height: size.getHeight()*5,),
          Center(child: Text(language.GetWord("Contact us via WhatsApp"),style: TextStyle(color: Color(theme.getColor("iconsColor")),fontSize:size.getWidth()*6,fontWeight: FontWeight.bold)),),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Icon(Icons.call,size: size.getWidth()*6,color: Color(theme.getColor("iconsColor")),),
              SizedBox(height: size.getHeight()*7,),
              Center(child: Text("07709431604",style: TextStyle(color: Color(theme.getColor("iconsColor")),fontSize:size.getWidth()*6,fontWeight: FontWeight.bold)),),
            ],
          ),

        ],
      ),
    );
  }
}
