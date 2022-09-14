import 'dart:math';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Constants/language.dart';
import '../Constants/size.dart';
import '../Constants/theme.dart';
import '../Providers/account_provider.dart';
import 'edit_account.dart';
import 'notifications.dart';

class account extends StatefulWidget {
  const account({Key? key}) : super(key: key);

  @override
  State<account> createState() => _accountState();
}

class _accountState extends State<account> {
  @override
  Widget build(BuildContext context) {
    var size = mediaQuery(context);
    Language language = Language();
    Themes theme = Themes();
    return Scaffold(
      backgroundColor: Color(theme.getColor("backgrouund")),
      body: Consumer<account_provider>(
        builder: (BuildContext context, value, Widget? child) {
          return Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Color(theme.getColor("contentColor")),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(size.getWidth() * 25),
                      bottomRight: Radius.circular(size.getWidth() * 25)),
                ),
                height: size.getHeight() * 40,
                child: Center(
                    child: Padding(
                  padding: EdgeInsets.only(bottom: size.getHeight() * 1),
                  child: Column(
                    children: [
                      SizedBox(
                        height: size.getHeight() * 4,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: size.getWidth() * 2,
                              ),
                              Icon(
                                Icons.manage_search,
                                color: Color(theme.getColor("iconsColor")),
                                size: size.getWidth() * 8,
                              ),
                            ],
                          ),
                          Center(
                            child: Text(
                              language.GetWord("Profile personly"),
                              style: TextStyle(fontWeight: FontWeight.bold,   color: Color(theme.getColor("iconsColor")),),
                            ),
                          ),
                          InkWell(
                            child: Container(
                              child: Icon(
                                color: Color(theme.getColor("iconsColor")),
                                Icons.notification_important_sharp,

                                size: size.getWidth() * 8,
                              ),
                              width: size.getWidth() * 12,
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
                      SizedBox(
                        height: size.getHeight() * 5,
                      ),
                      Container(
                        decoration:BoxDecoration(
                          // borderRadius: BorderRadius.circular(size.getWidth() * 50),
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                spreadRadius: 4.0,
                                blurRadius: 10.0,
                                // offset: Offset(3.0, 3.0)))
                            )
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius:
                              BorderRadius.circular(size.getWidth() * 50),
                          child: Image.network(
                            "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg",
                            height: size.getWidth() * 28,
                            width: size.getWidth() * 28,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.getHeight() * 1,
                      ),
                       Center(
                        child: Text(
                          "Abdullah Mouthna",
                          style: TextStyle(fontWeight: FontWeight.bold, color: Color(theme.getColor("iconsColor")),),
                        ),
                      ),
                       SizedBox(height: size.getHeight() * 1),
                       Center(
                        child:  Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.location_on_outlined , size: size.getWidth() * 6,color: Color(theme.getColor("iconsColor")),),
                              Text(
                              "Iraq - Irbil",
                              style: TextStyle(fontWeight: FontWeight.bold,color: Color(theme.getColor("iconsColor")),),
                            ),

                          ],
                        ),
                      ),
                    ],
                  ),
                )),
              ),
              SizedBox(
                height: size.getHeight() * 7.5,
              ),


                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: size.getWidth() * 3,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Color(theme.getColor("contentColor")),
                            border: Border.all(
                              color: Color(theme.getColor("contentColor")),
                              width: size.getWidth() * 1,
                            ),
                            borderRadius:
                            BorderRadius.circular(size.getWidth() * 2),
                          ),
                          child: Icon(
                            color: Color(theme.getColor("iconsColor")),
                            Icons.manage_accounts_outlined,
                            size: size.getWidth() * 8,
                          ),
                        ),
                        SizedBox(
                          width: size.getWidth() * 2,
                        ),
                        Text(
                          language.GetWord("Name"),
                          style: TextStyle(fontWeight: FontWeight.bold,color: Color(theme.getColor("iconsColor")),),
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>  edit_account()),
                        );
                      },
                      child: Container(
                        width: size.getWidth() * 12,
                        child: Icon(Icons.arrow_forward_ios_rounded,color: Color(theme.getColor("iconsColor")),),
                      ),
                    ),
                  ],
                ),

              SizedBox(
                height: size.getHeight() * 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: size.getWidth() * 3,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Color(theme.getColor("contentColor")),
                          border: Border.all(
                            color: Color(theme.getColor("contentColor")),
                            width: size.getWidth() * 1,
                          ),
                          borderRadius:
                          BorderRadius.circular(size.getWidth() * 2),
                        ),
                        child: Icon(
                          Icons.call,
                          color: Color(theme.getColor("iconsColor")),
                          size: size.getWidth() * 8,
                        ),
                      ),
                      SizedBox(
                        width: size.getWidth() * 2,
                      ),
                      Text(
                        language.GetWord("Telephone number"),
                        style: TextStyle(fontWeight: FontWeight.bold,color: Color(theme.getColor("iconsColor")),),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  edit_account()),
                      );
                    },
                    child: Container(
                      width: size.getWidth() * 12,
                      child: Icon(Icons.arrow_forward_ios_rounded,color: Color(theme.getColor("iconsColor")),),
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: size.getHeight() * 2,
              ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: size.getWidth() * 3,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Color(theme.getColor("contentColor")),
                            border: Border.all(
                              color: Color(theme.getColor("contentColor")),
                              width: size.getWidth() * 1,
                            ),
                            borderRadius:
                            BorderRadius.circular(size.getWidth() * 2),
                          ),
                          child: Icon(
                            Icons.email_outlined,
                            color: Color(theme.getColor("iconsColor")),
                            size: size.getWidth() * 8,
                          ),
                        ),
                        SizedBox(
                          width: size.getWidth() * 2,
                        ),
                        Text(
                          language.GetWord("Email"),
                          style: TextStyle(fontWeight: FontWeight.bold,color: Color(theme.getColor("iconsColor"))),
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>  edit_account()),
                        );
                      },
                      child: Container(
                        width: size.getWidth() * 12,
                        child: Icon(Icons.arrow_forward_ios_rounded,color: Color(theme.getColor("iconsColor")),),
                      ),
                    ),
                  ],
                ),


              SizedBox(
                height: size.getHeight() * 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: size.getWidth() * 3,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Color(theme.getColor("contentColor")),
                          border: Border.all(
                            color: Color(theme.getColor("contentColor")),
                            width: size.getWidth() * 1,
                          ),
                          borderRadius:
                          BorderRadius.circular(size.getWidth() * 2),
                        ),
                        child: Icon(
                          Icons.location_on_outlined,
                          color: Color(theme.getColor("iconsColor")),
                          size: size.getWidth() * 8,
                        ),
                      ),
                      SizedBox(
                        width: size.getWidth() * 2,
                      ),
                      Text(
                        language.GetWord("The address"),
                        style: TextStyle(fontWeight: FontWeight.bold,color: Color(theme.getColor("iconsColor"))),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  edit_account()),
                      );
                    },
                    child: Container(
                      width: size.getWidth() * 12,
                      child: Icon(Icons.arrow_forward_ios_rounded,color: Color(theme.getColor("iconsColor")),),
                    ),
                  ),
                ],
              ),

            ],
          );
        },
      ),
    );
  }
}

// class CurvedBottomClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     final roundingHeight = size.height * 3 / 5;
//     final filledRectangle =Rect.fromLTRB(0, 0, size.width, size.height - roundingHeight);
//     final roundingRectangle = Rect.fromLTRB(-5, size.height - roundingHeight * 2, size.width + 5, size.height);
//     final path = Path();
//     path.addRect(filledRectangle);
//     path.arcTo(roundingRectangle, pi, -pi, true);
//     path.close();
//     return path;
//   }
//
//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) {
//
//     return true;
//   }
// }
