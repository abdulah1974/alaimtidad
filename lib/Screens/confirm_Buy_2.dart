import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Constants/language.dart';
import '../Constants/size.dart';
import '../Constants/theme.dart';

class confirm_Buy_2 extends StatelessWidget {
 late  String image;
 late  String number;
 confirm_Buy_2(this.image,this.number);
  @override
  Widget build(BuildContext context) {
    var size = mediaQuery(context);
    Language language = Language();
    Themes theme = Themes();
    return Scaffold(
      backgroundColor: Color(theme.getColor("backgrouund")),
      appBar: AppBar(
        elevation:0,
        leading: InkWell(
          child: Icon(Icons.arrow_back,color: Color(theme.getColor("iconsColor")),),
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Color(theme.getColor("backgrouund")),
        title: Text(language.GetWord('Confirm Buy'),style: TextStyle(color: Color(theme.getColor("iconsColor"))),),

      ),
      body: Column(

        children: [
         SizedBox(height: size.getHeight()*15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(

                width: size.getWidth() * 40,
                height: size.getHeight() * 12,
                child: ClipRRect(
                  borderRadius:BorderRadius.circular(size.getWidth()*2.5),
                  child: Image.network(image,fit:BoxFit.cover),
                ),
              ),
            ],
          ),
          SizedBox(height: size.getHeight()*4),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Container(
                padding: EdgeInsets.symmetric(horizontal: size.getWidth() * 5),
                child:Text(language.GetWord("Product"),style: TextStyle(color: Color(theme.getColor("iconsColor")),fontSize: size.getWidth()*5),),
              ),


              Container(

                  padding: EdgeInsets.symmetric(horizontal: size.getWidth() * 5),
                  child: Text(
                    "Asiacell ${"50,000"}-IQD",
                    style: TextStyle(
                        color: Color(theme.getColor("iconsColor")),
                        fontSize: size.getWidth() * 5),
                  )),

            ],
          ),
          SizedBox(height: size.getHeight()*3),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Container(
                padding: EdgeInsets.symmetric(horizontal: size.getWidth() * 5),
                child:Text(language.GetWord("Current Balance"),style: TextStyle(color: Color(theme.getColor("iconsColor")),fontSize: size.getWidth()*5),),
              ),


              Container(

                  padding: EdgeInsets.symmetric(horizontal: size.getWidth() * 5),
                  child: Text(
                    "100,000 IQD",
                    style: TextStyle(
                        color: Color(theme.getColor("iconsColor")),
                        fontSize: size.getWidth() * 5),
                  )),

            ],
          ),
          SizedBox(height: size.getHeight()*3),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Container(
                padding: EdgeInsets.symmetric(horizontal: size.getWidth() * 5),
                child:Text(language.GetWord("Amount money required"),style: TextStyle(color: Color(theme.getColor("iconsColor")),fontSize: size.getWidth()*5),),
              ),

              Container(

                  padding: EdgeInsets.symmetric(horizontal: size.getWidth() * 4),
                  child: Text(
                    "1,000 IQD",
                    style: TextStyle(
                        color: Color(theme.getColor("iconsColor")),
                        fontSize: size.getWidth() * 5),
                  )),

            ],
          ),
          SizedBox(height: size.getHeight()*3),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Container(
                padding: EdgeInsets.symmetric(horizontal: size.getWidth() * 5),
                child:Text(language.GetWord("Amount"),style: TextStyle(color: Color(theme.getColor("iconsColor")),fontSize: size.getWidth()*5),),
              ),


              Container(
                  padding: EdgeInsets.symmetric(horizontal: size.getWidth() * 5),
                  child: Text(
                    number,
                    style: TextStyle(
                        color: Color(theme.getColor("iconsColor")),
                        fontSize: size.getWidth() * 5),
                  )),

            ],
          ),

          SizedBox(height:language.language==1? size.getHeight()*25: size.getHeight()*30),
          Container(
            width: size.getWidth()*90,
            height:size.getHeight()*5.5,
            margin: EdgeInsets.symmetric(horizontal: size.getWidth()*10 , vertical: size.getHeight()*2),
            child:ElevatedButton(

              onPressed: () {

                showGeneralDialog(

                  barrierDismissible: false,

                  context: context,
                //  barrierColor:Colors.grey.shade200.withOpacity(0.5),
                  //  transitionDuration: Duration(milliseconds: 500),
                  transitionBuilder: (context, a1, a2, child) {
                    return  ClipRect(
                      child:  BackdropFilter(
                        filter:  ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                        child:  Container(

                          decoration:  BoxDecoration(
                              color: Colors.grey.shade900.withOpacity(0.5)),
                          child: ScaleTransition(
                            scale: CurvedAnimation(
                                parent: a1,
                                curve: Curves.elasticOut,
                                reverseCurve: Curves.easeOutCubic),
                            child: CustomDialog( // our custom dialog

                              content:language.GetWord("Your buy has been successfully completed"),
                              positiveBtnText: language.GetWord("Succeeded"),
                              negativeBtnText: "Cancel",

                              positiveBtnPressed: () {
                                Navigator.of(context).pop();


                              },

                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  pageBuilder: (BuildContext context, Animation animation,
                      Animation secondaryAnimation) {
                    return const Center();
                  },
                );

              },
              child: Text(language.GetWord("Confirm")),
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

}
class CustomDialog extends StatelessWidget {
  final  content, positiveBtnText, negativeBtnText;

  final GestureTapCallback positiveBtnPressed;

  CustomDialog({
    required this.content,
    required this.positiveBtnText,
    required this.negativeBtnText,
    required this.positiveBtnPressed,

  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: _buildDialogContent(context),
    );
  }
  Widget _buildDialogContent(BuildContext context) {
    var size = mediaQuery(context);
    Language language = Language();
    Themes theme = Themes();
    return Stack(
      alignment: Alignment.topCenter,
      children: <Widget>[

        Container(
          margin: EdgeInsets.only(top: size.getWidth()*10),
          decoration: BoxDecoration(
            color: Color(theme.getColor("iconsColor")),
            borderRadius: BorderRadius.circular(size.getWidth()*3),
          ),
          padding: EdgeInsets.only(top: size.getWidth()*15, left: size.getWidth()*5, right: size.getWidth()*5),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[

              SizedBox(
                height: size.getHeight()*2,
              ),
              Text(
                content,
                style: TextStyle(color: Color(theme.getColor("backgrouund"),),fontWeight: FontWeight.bold,),

                textAlign: TextAlign.center,
              ),
              ButtonBar(
                children: [

                  Container(

                    //    margin: EdgeInsets.all(size.getWidth()*70),
                    child:ElevatedButton(

                      onPressed: positiveBtnPressed,
                      child: Text(positiveBtnText),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red,

                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(size.getHeight()*1),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        CircleAvatar(
          maxRadius: size.getWidth()*10,

          child: 1>2?Icon(Icons.check,size: size.getWidth()*18,color: Color(theme.getColor("backgrouund")),): CircularProgressIndicator(strokeWidth:7.0,),


          backgroundColor: Colors.red,
        ),
      ],
    );
  }

}