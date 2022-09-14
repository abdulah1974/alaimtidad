import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Constants/language.dart';
import '../Constants/size.dart';
import '../Constants/theme.dart';
import '../Providers/entertainment_provider.dart';
class entertainment extends StatefulWidget {
  const entertainment({Key? key}) : super(key: key);

  @override
  State<entertainment> createState() => _entertainmentState();
}

class _entertainmentState extends State<entertainment> {
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
        title: Text(language.GetWord('Entertainment'),style: TextStyle(color: Color(theme.getColor("iconsColor"))),),

      ),
      body:Consumer<entertainment_provider>(
    builder: (BuildContext context, value, Widget? child) {
      return GridView.builder(
        itemCount: value.entertainment_er.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, mainAxisExtent: size.getHeight()*23.5,),

        itemBuilder: (BuildContext context, int index) {
          return  Container(


            margin: EdgeInsets.symmetric(horizontal: size.getHeight()*0.8,vertical: size.getWidth() * 1.5,),
            decoration: BoxDecoration(
              color: Color(theme.getColor("backgrouund")),
              borderRadius: BorderRadius.all(Radius.circular(size.getWidth()*3.5)),
            ),
            child: Container(

              decoration: BoxDecoration(
                color: Color(theme.getColor("contentColor")),
                borderRadius: BorderRadius.all(Radius.circular(size.getWidth()*3.5)),
              ),
              child: Center(

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Card(
                      elevation: 10,
                      shadowColor: Color(theme.getColor("backgrouund")),
                      color: Color(theme.getColor("entertainment")),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                      child: Container(

                        padding: EdgeInsets.symmetric(
                            horizontal: size.getWidth() * 2.5,
                            vertical: size.getHeight() * 1),
                        child: Image.asset(language.language==1?value.entertainment_er[index][0]:value.entertainment_en[index][0]),

                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        textAlign: TextAlign.center,
                        language.language==1?value.entertainment_er[index][1].toString():value.entertainment_en[index][1].toString(),
                        style: TextStyle(
                            fontSize: size.getWidth()*3.3,
                            color: Color(theme.getColor("iconsColor")),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      height: size.getHeight()*3,
                      width: size.getWidth()*26,
                      child: ElevatedButton(

                        onPressed: () {

                        },
                        child: Text(language.GetWord("Categories")+"20",style: TextStyle(fontSize: 9.8),),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blueAccent,
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
        },
      );
    },

    ),
    );
  }
}
