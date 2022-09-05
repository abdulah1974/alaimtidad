import 'dart:ui';

import 'package:alaimtidad/Constants/size.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';

import '../Constants/language.dart';
import '../Constants/theme.dart';
import '../Providers/Home_provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var size = mediaQuery(context);
    Language language = Language();
    Themes theme = Themes();
    Future.delayed(Duration.zero, () {
      //  context.read<home_provider>().taskes();
    });

    print("ll");
    return Scaffold(
      backgroundColor: Color(theme.getColor("backgrouund")),
      body: Consumer<home_provider>(
        builder: (BuildContext context, value, Widget? child) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: size.getHeight() * 1,
                  ),
                  Row(
                    children: [
                      SizedBox(width: size.getWidth() * 2),
                      CircleAvatar(
                        radius: size.getHeight() * 3, // Image radius
                        backgroundImage: const NetworkImage(
                            'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg'),
                      ),
                      SizedBox(width: size.getWidth() * 2),
                      Column(
                        children:  [
                          Text(language.GetWord("Welcome"),
                              style: TextStyle(
                                color: Color(theme.getColor("iconsColor")),
                              )),
                           SizedBox(height: size.getHeight()* 1),
                          Text(
                            "عبدالله",
                            style: TextStyle(fontWeight: FontWeight.bold,color: Color(theme.getColor("iconsColor")),),
                          ),
                        ],
                      ),
                    ],
                  ),
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
                          height: size.getHeight() * 5,
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
                  SizedBox(height: size.getHeight() * 2),
                  Container(
                    margin: EdgeInsets.all(size.getHeight() * 2),
                    child: CarouselSlider.builder(
                      itemCount: 10,
                      options: CarouselOptions(
                        enlargeCenterPage: true,
                        height: size.getHeight() * 23,
                        autoPlay: false,
                        autoPlayInterval: const Duration(seconds: 3),
                        reverse: false,
                        //aspectRatio: 5.0,
                      ),
                      itemBuilder: (context, i, id) {
                        //for onTap to redirect to another screen
                        return GestureDetector(
                          child: Container(
                            //ClipRRect for image border radius
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.circular(size.getHeight() * 2),
                              child: Image.network(
                                "https://media-exp1.licdn.com/dms/image/C5609AQFiZwbE2r33SQ/company-featured_1128_635/0/1529503144539?e=2147483647&v=beta&t=HC9Q0DGqS9NNkhsRwJXWmBczlCcWqXJHHSIeWvwcJks",
                                //width: 500,
                                fit:BoxFit.cover,
                              ),
                            ),
                          ),
                          onTap: () {
                            // value.sss();
                          },
                        );
                      },
                    ),
                  ),

                  Row(

                    children: [
                      SizedBox(
                        width: size.getWidth() * 2,
                      ),
                       Text(
                        language.GetWord("Mission"),
                        style: TextStyle(fontWeight: FontWeight.bold,color: Color(theme.getColor("iconsColor")),),
                      ),
                      SizedBox(
                        width: size.getWidth() * 73,
                      ),
                       Expanded(child: Text(language.GetWord("More"), style: TextStyle(color: Color(theme.getColor("iconsColor")),))),
                    ],
                  ),
                  SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                    child: Row(children: [
                      for (var index = 0; index < value.Task.length; index++)

                          Task(value.Task[index][1], value.Task[index][0], size,theme.getColor("iconsColor"),theme.getColor("contentColor")),
                        ]),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: size.getWidth() * 2,
                      ),
                       Text(
                        language.GetWord("Categories"),
                        style: TextStyle(fontWeight: FontWeight.bold,color: Color(theme.getColor("iconsColor")),),
                      ),
                      SizedBox(
                        width: size.getWidth() * 66,
                      ),
                      Expanded(child: Text(language.GetWord("More"), style: TextStyle(color: Color(theme.getColor("iconsColor")),))),
                    ],
                  ),
                  SizedBox(
                    height: size.getHeight() * 1,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(children: [

                      for(int i=0;i<4;i++)
                      CategoriesCard('','العاب',theme.getColor("contentColor"),'',theme.getColor("iconsColor")),

                    ]),
                  ),



                ],
              ),
            ),
          );
        },
      ),
    );
  }


}



class Task extends StatelessWidget {
  var size;
  var Name ;
  var image ;
  var theme;
  var contentColor;
  Task(this.Name , this.image , this.size,this.theme,this.contentColor);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.getWidth()* 25,
      height: size.getHeight() * 12,
      child: Column(
        children: [
          SizedBox(
            height: size.getHeight() * 1,
          ),
          Container(
            height: size.getHeight() * 7,
            child: Image.asset(image),
          ),
          Expanded(
            child: Text(Name,
                style: TextStyle(
                    color: Color(theme),
                    fontWeight: FontWeight.bold)),
          ),
        ],
      ),
      margin: EdgeInsets.all(8),
      decoration:  BoxDecoration(
        color: Color(contentColor),

        //  Image.network("https://media-exp1.licdn.com/dms/image/C5609AQFiZwbE2r33SQ/company-featured_1128_635/0/1529503144539?e=2147483647&v=beta&t=HC9Q0DGqS9NNkhsRwJXWmBczlCcWqXJHHSIeWvwcJks",),
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),

    );
  }
}




class CategoriesCard extends StatelessWidget {
  var photo;
  var Title;
  var color;
  var id;
  var contentColor;
  CategoriesCard(this.photo, this.Title, this.color, this.id,this.contentColor);

  @override
  Widget build(BuildContext context) {
    var size = mediaQuery(context);
    return InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: Container(
          width: size.getWidth()* 25,
          height: size.getHeight() * 12,
          margin:  EdgeInsets.symmetric(horizontal: size.getWidth()*2),
          decoration: BoxDecoration(
            color: Color(color),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
               SizedBox(height: size.getHeight()*1),
              Container(
                  height: size.getHeight()*6,
                  width: size.getWidth()*15,
                  child: Image.network('https://www.pngkey.com/png/full/12-126560_game-icons-png-game-icon-png.png')),
               SizedBox(height: size.getHeight()*1),
              Text(Title,
                  style:  TextStyle(
                    color: Color(contentColor),
                    fontWeight: FontWeight.bold,
                  )),
            ],
          ),
        ),
        onTap: () {

        });
  }
}

