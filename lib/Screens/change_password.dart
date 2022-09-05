import 'package:alaimtidad/Screens/setting.dart';
import 'package:flutter/material.dart';

import '../Constants/language.dart';
import '../Constants/size.dart';
import '../Constants/theme.dart';
class change_password extends StatefulWidget {
  const change_password({Key? key}) : super(key: key);

  @override
  State<change_password> createState() => _change_passwordState();
}

class _change_passwordState extends State<change_password> {
  TextEditingController Old_password = TextEditingController();
  TextEditingController New_password = TextEditingController();
  TextEditingController Confirm_the_password = TextEditingController();
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
        backgroundColor: Color(theme.getColor("backgrouund")),
        title: Text(language.GetWord('Change Password'),style: TextStyle(color: Color(theme.getColor("iconsColor"))),),

      ),
      body: SingleChildScrollView(

        child: Center(
          child: Column(
            children: [
              Icon(Icons.lock_open,size:size.getWidth()*40 ,color: Color(theme.getColor("iconsColor")),),
              Text(language.GetWord('Change Password'),style:TextStyle(fontSize:size.getWidth()*8,color:Color(theme.getColor("iconsColor"),),),),

              Container(
                margin: EdgeInsets.all(size.getWidth()*5),
                child: TextField(
                  controller:Old_password,
                  cursorColor:Color(theme.getColor("iconsColor")),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color:Color(theme.getColor("iconsColor")),
                  ),
                  decoration: InputDecoration(
                    hintText:language.GetWord('Old password'),

                    hintStyle: TextStyle(color: Color(theme.getColor("iconsColor"))),

                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, color: Color(theme.getColor("iconsColor"))),borderRadius: BorderRadius.circular(size.getWidth()*3),),

                    // borderRadius: BorderRadius.circular(50.0),

                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, color: Color(theme.getColor("iconsColor"))),borderRadius: BorderRadius.circular(size.getWidth()*3),),

                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(size.getWidth()*5),
                child: TextField(
                  controller:New_password,
                  cursorColor:Color(theme.getColor("iconsColor")),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color:Color(theme.getColor("iconsColor")),
                  ),
                  decoration: InputDecoration(
                    hintText: language.GetWord("New password"),

                    hintStyle: TextStyle(color: Color(theme.getColor("iconsColor"))),

                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:Color(theme.getColor("iconsColor"))), borderRadius: BorderRadius.circular(size.getWidth()*3),),

                    // borderRadius: BorderRadius.circular(50.0),

                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color:Color(theme.getColor("iconsColor"))),borderRadius: BorderRadius.circular(size.getWidth()*3),),

                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(size.getWidth()*5),
                child: TextField(
                  controller:Confirm_the_password,
                  cursorColor:Color(theme.getColor("iconsColor")),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color:Color(theme.getColor("iconsColor")),
                  ),
                  decoration: InputDecoration(
                    hintText:language.GetWord("Confirm the password"),
                    hintStyle: TextStyle(color: Color(theme.getColor("iconsColor"))),

                    focusedBorder: OutlineInputBorder(borderSide: BorderSide( color: Color(theme.getColor("iconsColor"))),borderRadius: BorderRadius.circular(size.getWidth()*3),),

                    // borderRadius: BorderRadius.circular(50.0),

                    enabledBorder: OutlineInputBorder(borderSide: BorderSide( color: Color(theme.getColor("iconsColor"))),borderRadius: BorderRadius.circular(size.getWidth()*3),),

                  ),
                ),
              ),
             SizedBox(height: size.getHeight()*15,),
              Container(
                width: size.getWidth()*90,
                height:size.getHeight()*6,
            //    margin: EdgeInsets.all(size.getWidth()*70),
                child:ElevatedButton(

                  onPressed: () {
                    showGeneralDialog(
                      barrierDismissible: false,
                      context: context,
                      barrierColor: Colors.black54,
                      //  transitionDuration: Duration(milliseconds: 500),
                      transitionBuilder: (context, a1, a2, child) {
                        return ScaleTransition(
                          scale: CurvedAnimation(
                              parent: a1,
                              curve: Curves.elasticOut,
                              reverseCurve: Curves.easeOutCubic),
                          child: CustomDialog( // our custom dialog
                            title: "Password changed successfully",
                            content:"Do not give your password to anyone",
                            positiveBtnText: "Done",
                            negativeBtnText: "Cancel",

                            positiveBtnPressed: () {

                              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                                const  setting()), (Route<dynamic> route) => false);
                            },
                          ),
                        );
                      },
                      pageBuilder: (BuildContext context, Animation animation,
                          Animation secondaryAnimation) {
                        return const Center();
                      },
                    );
                  },
                  child: Text('Send'),
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
        ),
      ),
    );
  }

}
class CustomDialog extends StatelessWidget {
  final String title, content, positiveBtnText, negativeBtnText;

  final GestureTapCallback positiveBtnPressed;

  CustomDialog({
    required this.title,
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
             Row(
               children: [

                 Text(
                   title,
                   style: TextStyle(color: Color(theme.getColor("backgrouund")),fontSize: size.getWidth()*4.7),
                 ),
               ],
             ),
              SizedBox(
                height: size.getHeight()*2,
              ),
              Text(
                content,
                style: TextStyle(color: Color(theme.getColor("backgrouund"))),
                
                textAlign: TextAlign.center,
              ),
              ButtonBar(
              ///  buttonMinWidth: 100,

                children: <Widget>[

                  FlatButton(
                    child: Text(positiveBtnText,style: TextStyle(color: Colors.red,fontSize: size.getHeight()*2)),
                    onPressed: positiveBtnPressed,

                  ),
                ],
              ),
            ],
          ),
        ),
        CircleAvatar(
          maxRadius: size.getWidth()*10,
          child: Icon(Icons.add_task_outlined,size: size.getWidth()*10,color: Color(theme.getColor("backgrouund")),),
          backgroundColor: Colors.red,
        ),
      ],
    );
  }

}
