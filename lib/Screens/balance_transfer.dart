import 'package:flutter/material.dart';

import '../Constants/language.dart';
import '../Constants/size.dart';
import '../Constants/theme.dart';

class balance_transfer extends StatefulWidget {
  const balance_transfer({Key? key}) : super(key: key);

  @override
  State<balance_transfer> createState() => _balance_transferState();
}

class _balance_transferState extends State<balance_transfer> {
  @override
  Widget build(BuildContext context) {
    Language language = Language();
    Themes theme = Themes();
    var size = mediaQuery(context);
    return Scaffold(
      backgroundColor: Color(theme.getColor("backgrouund")),
      appBar: AppBar(
        elevation: 0,
        leading: InkWell(
          child: Icon(
            Icons.arrow_back,
            color: Color(theme.getColor("iconsColor")),
          ),
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Color(theme.getColor("backgrouund")),
        title: Text(
          language.GetWord('Balance Transfer'),
          style: TextStyle(color: Color(theme.getColor("iconsColor"))),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: size.getHeight() * 2),
            Center(
              child: Container(
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
                        Text(
                            language.GetWord(
                              "Current balance",
                            ),
                            style: TextStyle(
                                color: Color(theme.getColor("iconsColor")),
                                fontWeight: FontWeight.w500)),
                        SizedBox(height: size.getHeight() * 1),
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
                      onTap: () {
                        setState(() {
                          // bottomNavigationBarIndex= 2;
                        });
                      },
                      child: Container(
                        width: size.getWidth() * 10,
                        height: size.getWidth() * 10,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Color(
                              theme.getColor("arrow_forward_ios_rounded")),
                          borderRadius:
                              BorderRadius.circular(size.getWidth() * 5),
                        ),
                        child: Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Color(theme.getColor("iconsColor")),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: size.getHeight() * 5),
            Column(
              children: [
                Row(
                  children: [
                    SizedBox(width: size.getWidth() * 5),
                    Text(language.GetWord("Telephone number"),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(theme.getColor("iconsColor")),
                        )),
                  ],
                ),
                Container(
                  margin: EdgeInsets.all(size.getWidth() * 3),
                  child: TextField(
                    cursorColor: Color(theme.getColor("iconsColor")),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(theme.getColor("iconsColor")),
                    ),
                    decoration: InputDecoration(
                      hintText: "+9647709431604",

                      hintStyle: TextStyle(
                          color: Color(
                              theme.getColor("arrow_forward_ios_rounded"))),

                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color(theme.getColor("iconsColor"))),
                        borderRadius:
                            BorderRadius.circular(size.getWidth() * 3),
                      ),
                      prefixIcon: Container(
                        padding: EdgeInsets.only(
                            left: size.getWidth() * 2.5,
                            right: size.getWidth() * 2.5,
                            top: size.getHeight() * 1,
                            bottom: size.getHeight() * 1),
                        width: 1,
                        child: Image.network(
                            "https://upload.wikimedia.org/wikipedia/commons/thumb/f/f6/Flag_of_Iraq.svg/1200px-Flag_of_Iraq.svg.png"),
                      ),

                      // borderRadius: BorderRadius.circular(50.0),

                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color(
                                theme.getColor("arrow_forward_ios_rounded"))),
                        borderRadius:
                            BorderRadius.circular(size.getWidth() * 3),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: size.getHeight() * 25),
                Container(
                  width: size.getWidth() * 93,
                  height: size.getHeight() * 6,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {});
                    },
                    child: Text(language.GetWord("Balance Transfer")),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(size.getHeight() * 1),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
