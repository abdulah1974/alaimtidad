
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Constants/language.dart';
import '../Constants/size.dart';
import '../Constants/theme.dart';
import '../Providers/confirm_buy_provider.dart';
import 'confirm_Buy_2.dart';
class confirm_buy extends StatelessWidget {
  const confirm_buy({Key? key}) : super(key: key);

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

          SizedBox(height: size.getHeight() * 2),
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

                    Text(language.GetWord("Current balance",),
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
                    borderRadius: BorderRadius.circular(size.getWidth()*5),

                  ),
                  child:  Icon(Icons.arrow_forward_ios_rounded,color: Color(theme.getColor("iconsColor")),),
                ),
              ],
            ),
          ),
          SizedBox(height: size.getHeight() * 3),
          Text(language.GetWord("Complete the purchase confirmation process"),style: TextStyle(fontSize: size.getWidth()*3.5,color: Color(theme.getColor("iconsColor"))),),
          SizedBox(height: size.getHeight() * 2),
          Container(

            height: size.getHeight() * 14.333,
            width: size.getWidth() * 85,

            padding: EdgeInsets.symmetric(
                horizontal: size.getWidth() * 6,
                vertical: size.getHeight() * 2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(size.getWidth() * 3),
              color: Color(theme.getColor("cards_buy")),
            ),
            child:    Column(

              children: [
                Container(

                  width: size.getWidth() * 85,
                  child: Text(language.GetWord("Order Summary"),)),

                language.language==1?Container():SizedBox(height: size.getHeight()*1.3),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(

                      width: size.getWidth() * 25,
                      height: size.getHeight() * 5.5,
                      child: ClipRRect(
                        borderRadius:BorderRadius.circular(size.getWidth()*2),
                        child: Image.network( "https://play-lh.googleusercontent.com/BqN_VzEA0TfTlJ_YvdQSg0eFqRbi7DGBHptCOVfEh4OKppmE-5bvicXbLkPlHBIM2Q",fit:BoxFit.cover),
                      ),
                    ),
                    SizedBox(width: size.getWidth()*2),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(language.GetWord("Price")+" : 30,000,000",),
                        language.language==1?Container():SizedBox(height: size.getHeight()*0.4),

                        Text(language.GetWord("Card selling price")+ " : 30,000,000"),
                      ],
                    ),


                  ],
                ),

              ],
            ),
          ),
          SizedBox(height: size.getHeight() * 2),
          Consumer<confirm_buy_provider>(
            builder: (BuildContext context, value, Widget? child){
              return  Row(
                children: [
                  SizedBox(width: size.getWidth()*65,),
                  Container(
                    //  margin: EdgeInsets.only(left: size.getWidth() * 70),
                      width: size.getWidth() *28,
                      height: size.getHeight() *5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(size.getWidth() * 5),
                        color: Color(theme.getColor("iconsColor")),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(width: size.getWidth() *0.1),
                          InkWell(
                              child:Icon( Icons.remove, color: Color(theme.getColor("backgrouund")) ),
                              onTap: () {
                                value.delete_number();
                              }
                          ),
                          Container(

                            child: Text(value.i.toString(),style: TextStyle(color: Colors.red),),
                          ),
                          InkWell(
                            child:Icon( Icons.add, color: Color(theme.getColor("backgrouund")) ),
                            onTap: () {
                              value.add_number();
                            }
                          ),


                          SizedBox(width: size.getWidth() *0.1),


                        ],
                      ),
                    ),
                ],
              );
            },

          ),
          SizedBox(height: size.getHeight() * 38),
          Consumer<confirm_buy_provider>(
         builder: (BuildContext context, value, Widget? child){
           return  Container(
             width: size.getWidth()*90,
             height:size.getHeight()*5.5,
             margin: EdgeInsets.symmetric(horizontal: size.getWidth()*10 , vertical: size.getHeight()*2),
             child:ElevatedButton(

               onPressed: () {

                 Navigator.push(context,MaterialPageRoute(builder: (context) =>  confirm_Buy_2("https://play-lh.googleusercontent.com/BqN_VzEA0TfTlJ_YvdQSg0eFqRbi7DGBHptCOVfEh4OKppmE-5bvicXbLkPlHBIM2Q",value.i.toString())),);

               },
               child: Text(language.GetWord("Confirm Buy")),
               style: ElevatedButton.styleFrom(
                 primary: Colors.red,

                 shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.circular(size.getHeight()*1),
                 ),
               ),
             ),
           );
         },
          ),


        ],
      ),
    );
  }
}
