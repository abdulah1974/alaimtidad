import 'package:flutter/material.dart';

import '../Constants/language.dart';
import '../Constants/size.dart';
import '../Constants/theme.dart';
import 'package:provider/provider.dart';

import '../Providers/notifications_provider.dart';
class notifications extends StatefulWidget {
  const notifications({Key? key}) : super(key: key);

  @override
  State<notifications> createState() => _notifications_providerState();
}

class _notifications_providerState extends State<notifications> {
  int _notifications=1;
  @override
  Widget build(BuildContext context) {
    Language language = Language();
    Themes theme = Themes();
    var size = mediaQuery(context);
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
        title: Text(language.GetWord('Notifications'),style: TextStyle(color: Color(theme.getColor("iconsColor"))),),

      ),
      body:Consumer<notifications_provider>(
        builder: (BuildContext context, value, Widget? child) {
          return _notifications!=1?ListView.builder(
            itemCount: value.notifications.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                  //0xffD6E0D2
                margin: EdgeInsets.all(size.getWidth()*3),
                decoration: BoxDecoration(
                  color: Color(theme.getColor("contentColor")),
                  borderRadius: BorderRadius.circular(size.getWidth()*3),
                ),
                child: ListTile(
                  leading: Image.network("https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg"),
                  title: Text(value.notifications[index][0],style: TextStyle(color:  Color(theme.getColor("iconsColor")))),
                  subtitle: Text(value.notifications[index][1],style: TextStyle(color:  Color(theme.getColor("iconsColor")))),
                  trailing:Text(value.notifications[index][2],style: TextStyle(color:  Color(theme.getColor("iconsColor")))),
                ),
              );

            },

          ):Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Icon(Icons.notifications,color: Colors.red,size: size.getWidth() * 50,),

              ),
              Center(
                child: Text(language.GetWord("You don't have any notifications"),style: TextStyle(color: Color(theme.getColor("iconsColor"))),),

              ),
            ],
          );
        },
      ),
    );
  }
}
