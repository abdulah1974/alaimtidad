import 'package:alaimtidad/Constants/language.dart';
import 'package:alaimtidad/Screens/reports.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Constants/size.dart';
import '../Constants/theme.dart';
import 'notifications.dart';

class wallet extends StatefulWidget {
  const wallet({Key? key}) : super(key: key);

  @override
  State<wallet> createState() => _walletState();
}

class _walletState extends State<wallet> {
  @override
  Widget build(BuildContext context) {
    Language language = Language();
    Themes theme = Themes();
    var size = mediaQuery(context);
    return Scaffold(
      backgroundColor: Color(theme.getColor("backgrouund")),
      body: Consumer(
        builder: (BuildContext context, value, Widget? child) {
          return SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: size.getHeight()*4,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Row(
                      children: [
                        SizedBox(width: size.getWidth()*4,),
                        Icon(Icons.manage_search,size: size.getWidth()*8,color: Color(theme.getColor("iconsColor")),),
                      ],
                    ),

                    Center(
                      child:Text(language.GetWord("Wallet"),style: TextStyle(fontWeight: FontWeight.bold,color: Color(theme.getColor("iconsColor"))),),
                    ),
                    InkWell(
                      child: Container(
                        child:Icon(Icons.notification_important_sharp,size: size.getWidth()*8,color: Color(theme.getColor("iconsColor"))),
                        width: size.getWidth()*13,
                      ),
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => notifications()),
                        );
                      },
                    ),



                  ],
                ),

                SizedBox(height: size.getHeight()*4,),
                Container(
                  height: size.getHeight() * 12,
                  width: size.getWidth() * 85,
                  padding: EdgeInsets.symmetric(
                      horizontal: size.getWidth() * 6,
                      vertical: size.getHeight() * 2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(size.getWidth() * 4),
                    color: Color(theme.getColor("contentColor")),
                  ),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //SizedBox(width: size.getWidth()),
                           Text(language.GetWord("Current balance"),
                              style: TextStyle(
                                  color: Color(theme.getColor("iconsColor")),
                                  fontWeight: FontWeight.w500)),
                           SizedBox(height: size.getHeight()*1),
                           Text("${language.GetWord("Dinar")} 10,000,000",
                              style: TextStyle(
                                  color: Color(theme.getColor("iconsColor")),
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                      SizedBox(
                        width: size.getWidth() * 31,
                      ),
                      Container(
                        width: size.getWidth() * 10,
                        height: size.getWidth() * 10,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Color(theme.getColor("arrow_forward_ios_rounded")),
                          borderRadius: BorderRadius.circular(100),

                        ),
                        child:  Icon(Icons.arrow_forward_ios_rounded,color: Color(theme.getColor("iconsColor"))),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: size.getHeight()*4,),
                Row(
                children:  [
                  SizedBox(width: size.getWidth()*2,),
                   Text(language.GetWord("Common conversions"),style: TextStyle(fontWeight: FontWeight.bold, color: Color(theme.getColor("iconsColor")),),),
                ],
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(children: [

                    popular_deceptions("زين", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTyVgeAbygp_WqTJL7MqIjINmWDW0T3IRr1TL-JqUGqIFGv0ySIpC1vh-luAVZWfFonnrQ&usqp=CAU", size,theme.getColor("iconsColor"),theme.getColor("contentColor")),
                    popular_deceptions("اسياسيل", "https://play-lh.googleusercontent.com/BqN_VzEA0TfTlJ_YvdQSg0eFqRbi7DGBHptCOVfEh4OKppmE-5bvicXbLkPlHBIM2Q", size,theme.getColor("iconsColor"),theme.getColor("contentColor")),
                    popular_deceptions("كورك", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRcpeXRi8XBtBVj3EU-W7z49Ymu25Z714i3LMzPtxVXpKNkuGgF0r8C4xqMTaTSARl_Fpk&usqp=CAU", size,theme.getColor("iconsColor"),theme.getColor("contentColor")),
                       ]
                  ),
                ),
                SizedBox(height: size.getHeight()*2,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                   Row(
                     children: [
                       SizedBox(width: size.getWidth()*4,),
                       Text(language.GetWord("Recent transactions"),style: TextStyle(fontWeight: FontWeight.bold, color: Color(theme.getColor("iconsColor")),),),
                     ],
                   ),
                    InkWell(
                      child: Container(
                          width: size.getWidth() * 13,
                          child: Text(
                            language.GetWord("More"),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(theme.getColor("iconsColor")),
                            ),
                          )),
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => reports()),
                        );
                      },
                    ),
                  ],
                ),


                last_transaction("زين", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTyVgeAbygp_WqTJL7MqIjINmWDW0T3IRr1TL-JqUGqIFGv0ySIpC1vh-luAVZWfFonnrQ&usqp=CAU", size,"20,000","2022/2/2",theme.getColor("iconsColor")),
                last_transaction("اسياسيل", "https://play-lh.googleusercontent.com/BqN_VzEA0TfTlJ_YvdQSg0eFqRbi7DGBHptCOVfEh4OKppmE-5bvicXbLkPlHBIM2Q", size,"10,000","2022/2/2",theme.getColor("iconsColor")),
                last_transaction("كورك", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRcpeXRi8XBtBVj3EU-W7z49Ymu25Z714i3LMzPtxVXpKNkuGgF0r8C4xqMTaTSARl_Fpk&usqp=CAU", size,"5,000","2022/2/2",theme.getColor("iconsColor")),


              ],
            ),
          );
        },
      ),
    );
  }
}
class popular_deceptions extends StatelessWidget {
  var size;
  var Name ;
  var image ;
  var theme;
  var contentColor;
  popular_deceptions(this.Name , this.image , this.size,this.theme,this.contentColor);

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: size.getWidth()* 25,
      height: size.getHeight() * 12,
      child: Column(
        children: [


          Padding(
              padding:  EdgeInsets.all(size.getWidth()* 3),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(size.getWidth()* 3),
                  child: Container(

                    width: size.getWidth()* 12,
                    child: Image.network(image),

                  ))),
          Expanded(
            child: Text(Name,
                style: TextStyle(
                  color: Color(theme),
                    fontWeight: FontWeight.bold,),),
          ),
        ],
      ),
      margin: EdgeInsets.all(size.getHeight() * 2,),
      decoration:  BoxDecoration(
        color: Color(contentColor),
        borderRadius: BorderRadius.all(Radius.circular(size.getHeight() * 2)),
      ),

    );
  }
}




class last_transaction extends StatelessWidget {
  var size;
  var Name;
  var image;
  var price;
  var language;
  var theme;
  last_transaction(this.Name , this.image , this.size,this.price,this.language,this.theme);

  @override
  Widget build(BuildContext context) {

    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Padding(
              padding:  EdgeInsets.all(size.getWidth()* 3),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(size.getWidth()* 3),
                child: Container(
                  width: size.getWidth()* 20,
                  child: Image.network(image),

                ),
              ),
            ),
            Container(
              width: size.getWidth()* 20,
              child: Column(
                children: [
                  Text(Name,style: TextStyle(fontWeight: FontWeight.bold,color: Color(theme),),),
                  Text(language,style: TextStyle(fontWeight: FontWeight.w500, color: Color(theme),),),
                ],
              ),
            ),
          ],
        ),

        Container(width:size.getWidth()*15,child:Text(price,style: TextStyle(fontWeight: FontWeight.w500,color: Color(theme)),) ,)


      ],
    );
  }
}
