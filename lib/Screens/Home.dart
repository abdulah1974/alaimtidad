import 'dart:ui';

import 'package:alaimtidad/Constants/size.dart';
import 'package:alaimtidad/Screens/balance_transfer.dart';
import 'package:alaimtidad/Screens/bottomNavigationBar.dart';
import 'package:alaimtidad/Screens/reports.dart';
import 'package:alaimtidad/Screens/tasks.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';

import '../Constants/language.dart';
import '../Constants/theme.dart';
import '../Providers/Home_provider.dart';
import 'categories.dart';
import 'device_filling.dart';
import 'entertainment.dart';

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
                        InkWell(
                          onTap: (){
                            setState(() {

                           //   bottomNavigationBarIndex= 2;
                            });
                          },
                          child: Container(
                            width: size.getWidth() * 10,
                            height: size.getWidth() * 10,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Color(theme.getColor("arrow_forward_ios_rounded")),
                              borderRadius: BorderRadius.circular(size.getWidth()*5),

                            ),
                            child:  Icon(Icons.arrow_forward_ios_rounded,color: Color(theme.getColor("iconsColor")),),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: size.getHeight() * 2),

                  Consumer<home_provider>(
                    builder: (BuildContext context, value, Widget? child) {
                      return  Container(
                        margin: EdgeInsets.all(size.getHeight() * 2),
                        child: CarouselSlider.builder(
                          itemCount: value.advertisement.length,
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
                                    value.advertisement[i],
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
                      );
                    }

                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: size.getWidth() * 4),
                        child: Text(
                          language.GetWord("Mission"),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(theme.getColor("iconsColor")),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: size.getWidth() * 4),
                        child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => tasks()),
                              );
                            },
                            child: Text(language.GetWord("More"),
                                style: TextStyle(
                                  color: Color(theme.getColor("iconsColor")),
                                ))),
                      ),
                    ],
                  ),
                  SizedBox(height: size.getHeight() * 2),
                  Container(
                    width: size.getWidth()*100,
                    height: size.getHeight() * ((language.language==1)? 14.4:15.4),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: value.Task.length,

                      itemBuilder: (context, index) {

                        return language.language==1?Task(value.Task[index][1], value.Task[index][0], size,theme.getColor("iconsColor"),theme.getColor("contentColor"),index):Task(value.Task_en[index][1], value.Task[index][0], size,theme.getColor("iconsColor"),theme.getColor("contentColor"),index);
                      },
                    ),
                  ),
                  SizedBox(height: size.getHeight() * 2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: size.getWidth() * 4),
                        child: Text(
                          language.GetWord("Categories"),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(theme.getColor("iconsColor")),
                          ),
                        ),
                      ),
                      Container(
                          padding: EdgeInsets.symmetric(horizontal: size.getWidth() * 4),
                          child: InkWell(
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>  categories()),
                              );
                            },
                            child: Text(language.GetWord("More"),
                                style: TextStyle(
                                  color: Color(theme.getColor("iconsColor")),
                                )),
                          )),
                    ],
                  ),
                  SizedBox(
                    height: size.getHeight() * 2,
                  ),
                  Container(
                    width: size.getWidth()*100,
                    height: size.getHeight() * ((language.language==1)? 14.4:15.4),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: value.Task.length,

                      itemBuilder: (context, index) {

                        return  CategoriesCard('','العاب',theme.getColor("contentColor"),'',theme.getColor("iconsColor"),index);
                      },
                    ),
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
  var index;
  Task(this.Name , this.image , this.size,this.theme,this.contentColor,this.index);

  @override
  Widget build(BuildContext context) {
    Language language = Language();
    return InkWell(
      onTap: (){

        if(0==index){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  categories()),
          );
        }
        if(1==index){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  reports()),
          );
        }
        if(2==index){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  balance_transfer()),
          );
        }
        if(3==index){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  device_filling()),
          );
        }
        print(";;");
      },
      child: Container(
        width: size.getWidth()* ((language.language==1)? 25:25.3),
        height: size.getHeight() * ((language.language==1)? 12:13),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

            Container(
              height: size.getHeight() * 6.5,
              child: Image.asset(image),
            ),

            Container(

              child: Text(Name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: size.getWidth()*3.3,
                      color: Color(theme),
                      fontWeight: FontWeight.bold)),
            ),
          ],
        ),
        margin: EdgeInsets.all(size.getWidth() * 2),
        decoration:  BoxDecoration(
          color: Color(contentColor),

          //  Image.network("https://media-exp1.licdn.com/dms/image/C5609AQFiZwbE2r33SQ/company-featured_1128_635/0/1529503144539?e=2147483647&v=beta&t=HC9Q0DGqS9NNkhsRwJXWmBczlCcWqXJHHSIeWvwcJks",),
          borderRadius: BorderRadius.all(Radius.circular(size.getWidth()*4.3)),
        ),

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
  var index;
  CategoriesCard(this.photo, this.Title, this.color, this.id,this.contentColor,this.index);

  @override
  Widget build(BuildContext context) {
    var size = mediaQuery(context);
    Language language = Language();
    return InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: Container(
          width: size.getWidth()* ((language.language==1)? 25:25.3),
          height: size.getHeight() * ((language.language==1)? 12:13),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              Container(
                height: size.getHeight() * 6.5,
                child: Image.asset("assets/tasks/play.png"),
              ),

              Container(

                child: Text(Title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: size.getWidth()*3.3,
                        color: Color(contentColor),
                        fontWeight: FontWeight.bold)),
              ),
            ],
          ),
          margin: EdgeInsets.all(size.getWidth() * 2),
          decoration:  BoxDecoration(
            color: Color(color),

            //  Image.network("https://media-exp1.licdn.com/dms/image/C5609AQFiZwbE2r33SQ/company-featured_1128_635/0/1529503144539?e=2147483647&v=beta&t=HC9Q0DGqS9NNkhsRwJXWmBczlCcWqXJHHSIeWvwcJks",),
            borderRadius: BorderRadius.all(Radius.circular(size.getWidth()*4.3)),
          ),

        ),
        onTap: () {

            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>  entertainment()),
            );

       //  print(index);
        });
  }
}

