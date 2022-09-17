

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../Constants/language.dart';
import '../Constants/size.dart';
import '../Constants/theme.dart';
import '../Providers/entertainment_provider.dart';
import 'confirm_buy.dart';
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

                          _showModalSheet(language,theme,);
                        },
                        child: Text(language.GetWord("Categories")+" 20",style: TextStyle(fontSize: 9.1),),
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

  void _showModalSheet(language, themes) {
    List index_=["a","a","a","a","a","a","a","a"];
    final PageController controller = PageController();
    var size = mediaQuery(context);
    showModalBottomSheet(
      context: context,
      builder: (builder) {
        return Consumer<entertainment_provider>(
            builder: (BuildContext context, value, Widget? child) {
              return   Container(
                height: size.getHeight() * 50,
                child: Column(
                  children: [
                    SizedBox(height: size.getHeight()*1.2),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(size.getWidth() *5),
                        color: Color(themes.getColor("iconsColor")),
                      ),
                      width: size.getWidth() * 15,
                      height: size.getHeight() * 0.8,
                    ),
                    SizedBox(height: size.getHeight()*1.2),

                    Text("Netflix",style: TextStyle(color: Color(themes.getColor("iconsColor")),fontWeight: FontWeight.bold),),
                    Container(
                      height: size.getHeight() * 30,
                      child: PageView.builder(
                        itemCount: index_.length,
                        controller: controller,
                        itemBuilder: (context, index) {


                          return  Column(
                            children: [
                              SizedBox(height: size.getHeight() * 2),
                          GestureDetector(
                            child: Container(
                               height: size.getHeight() * 28,
                                width: size.getWidth() * 90,
                              child: ClipRRect(
                                borderRadius:
                                    BorderRadius.circular(size.getHeight() * 2),
                                child: Image.network(
                                  "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg",
                                  //width: 500,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            onTap: () {

                            },
                          ),
                        ],
                          );
                        },
                      ),
                    ),
                    SizedBox(height: size.getHeight()*1.5),
                    1>0?Text(language.GetWord("Unavailable"),style: TextStyle(color: Color(themes.getColor("iconsColor")),)):Text("10000",style: TextStyle(color: Color(themes.getColor("iconsColor")),)),
                Expanded(
                  child: SmoothPageIndicator(
                      effect:  SlideEffect(

                          dotWidth:  10.0,
                          dotHeight:  10.0,
                         // dotColor:  Color(),
                          activeDotColor:  Colors.redAccent,
                      ),
                      controller: controller, // PageController
                      count: index_.length,

                    //  textDirection: TextDirection.ltr,
                  ),
                ),

                    Container(
                      height: size.getHeight()*5,
                      width: size.getWidth()*90,
                      child: ElevatedButton(

                        onPressed: () {

                         Navigator.of(context).pop();
                         Navigator.push(
                           context,
                           MaterialPageRoute(builder: (context) =>  confirm_buy()),
                         );
                        },
                        child: Text(language.GetWord("Confirm Buy"),),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blueAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(size.getHeight()*1),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: size.getHeight()*1.4),
                  ],
                ),
              );
            });
      },
      elevation: 20.0,
      enableDrag: true,
      backgroundColor: Color(themes.getColor("entertainment")),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          )),
    );
  }
}
