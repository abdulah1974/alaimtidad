import 'package:alaimtidad/Screens/change_password.dart';
import 'package:alaimtidad/Screens/connection_type.dart';
import 'package:alaimtidad/Screens/who_are_we.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Constants/language.dart';
import '../Constants/size.dart';
import '../Constants/theme.dart';
import '../Providers/setting_provider.dart';
import '../main.dart';
import 'notifications.dart';

class setting extends StatefulWidget {
  const setting({Key? key}) : super(key: key);

  @override
  State<setting> createState() => _settingState();
}

class _settingState extends State<setting> {
  bool boleen = false;
  @override
  Widget build(BuildContext context) {
    Language language = Language();
    Themes theme = Themes();
    var size = mediaQuery(context);

    return Scaffold(
      backgroundColor: Color(theme.getColor("backgrouund")),
      body: Consumer<setting_provider>(
        builder: (BuildContext context, value, Widget? child) {
          return SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Column(
              children: [
                SizedBox(
                  height: size.getHeight() * 4,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: size.getWidth() * 3,
                    ),
                    Icon(
                      Icons.manage_search,
                      size: size.getWidth() * 8,
                      color: Color(theme.getColor("iconsColor")),
                    ),
                    SizedBox(
                      width: size.getWidth() * 32,
                    ),
                    Text(
                      language.GetWord('settings'),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(theme.getColor("iconsColor"))),
                    ),
                    SizedBox(
                      width: size.getWidth() * 31,
                    ),
                    InkWell(
                      child: Icon(Icons.notification_important_sharp,
                          size: size.getWidth() * 8,
                          color: Color(theme.getColor("iconsColor"))),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => notifications()),
                        );
                      }
                    ),
                  ],
                ),
                SizedBox(
                  height: size.getHeight() * 2,
                ),
                InkWell(
                    child: icons(
                        Icons.lock_open,
                        language.GetWord('Change Password'),
                        Icons.arrow_forward_ios_rounded,
                        50,
                        theme.getColor("backgrouund"),
                        theme.getColor("iconsColor"),
                        theme.getColor("contentColor")),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => change_password()),
                      );
                    }),

                SizedBox(
                  height: size.getHeight() * 2,
                ),
                InkWell(
                  child: icons(
                      Icons.language,
                      language.GetWord('Who are we'),
                      Icons.arrow_forward_ios_rounded,
                      62,
                      theme.getColor("backgrouund"),
                      theme.getColor("iconsColor"),
                      theme.getColor("contentColor")),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => who_are_we()),
                    );
                  },
                ),

                SizedBox(
                  height: size.getHeight() * 2,
                ),
                notification(
                    Icons.notification_important_sharp,
                    language.GetWord('Notifications'),
                    size.getHeight() * 6,
                    value.fingerprint,
                    theme.getColor("backgrouund"),
                    theme.getColor("iconsColor"),
                    theme.getColor("contentColor")),
                //  icons(Icons.notification_important_sharp,language.GetWord('Notifications'),Icons.arrow_forward_ios_rounded,60,theme.getColor("backgrouund"),theme.getColor("iconsColor"),theme.getColor("contentColor")),
                SizedBox(
                  height: size.getHeight() * 2,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => connection_type()),
                    );
                  },
                  child: icons(
                      Icons.wifi,
                      language.GetWord('Connection type'),
                      Icons.arrow_forward_ios_rounded,
                      50,
                      theme.getColor("backgrouund"),
                      theme.getColor("iconsColor"),
                      theme.getColor("contentColor")),
                ),

                SizedBox(
                  height: size.getHeight() * 2,
                ),
                fingerprint(
                    Icons.fingerprint_sharp,
                    language.GetWord('Finger print'),
                    45,
                    value.fingerprint,
                    theme.getColor("backgrouund"),
                    theme.getColor("iconsColor"),
                    theme.getColor("contentColor")),
                SizedBox(
                  height: size.getHeight() * 2,
                ),
                InkWell(
                  child: icons(
                      Icons.sign_language,
                      language.GetWord("Language"),
                      Icons.arrow_forward_ios_rounded,
                      64,
                      theme.getColor("backgrouund"),
                      theme.getColor("iconsColor"),
                      theme.getColor("contentColor")),
                  onTap: () {
                    _showModalSheet(
                        language,
                        language.GetWord("Language"),
                        theme.getColor("backgrouund"),
                        theme.getColor("iconsColor"));
                  },
                ),

                SizedBox(
                  height: size.getHeight() * 2,
                ),
                nightlight(
                    Icons.nightlight_outlined,
                    language.GetWord("Night mode"),
                    46,

                    theme.getColor("backgrouund"),
                    theme.getColor("iconsColor"),
                    theme.getColor("contentColor")),
              ],
            ),
          );
        },
      ),
    );
  }

  void _showModalSheet(language, language2, themes, themes_radio) {
    showModalBottomSheet(
      context: context,
      builder: (builder) {
        var size = mediaQuery(context);

        return Consumer<setting_provider>(
            builder: (BuildContext context, value, Widget? child) {
          return Container(
            height: size.getHeight() * 23,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Center(
                    child: Text(
                      language2,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(themes_radio)),
                    ),
                  ),
                  Row(
                    children: [
                      Radio(
                        fillColor: MaterialStateColor.resolveWith(
                            (states) => Color(themes_radio)),
                        value: 1,
                        groupValue: boleen,
                        onChanged: (v) {
                          setState(() {
                            if (language.language == 2) {
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (context) => MyApp()),
                                  (Route<dynamic> route) => false);
                              language.ChangeLanguge();
                            }
                          });
                        },
                      ),
                      Text(
                        "العربية",
                        style: TextStyle(color: Color(themes_radio)),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Radio(
                        value: 2,
                        groupValue: boleen,
                        focusColor: Colors.red,
                        fillColor: MaterialStateColor.resolveWith(
                            (states) => Color(themes_radio)),
                        onChanged: (valuesss) {
                          setState(() {
                            if (language.language == 1) {
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (context) => MyApp()),
                                  (Route<dynamic> route) => false);
                              language.ChangeLanguge();
                            }
                          });
                          //   value.language_();
                        },
                      ),
                      Text(
                        "الانجليزية",
                        style: TextStyle(color: Color(themes_radio)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
      },
      elevation: 20.0,
      enableDrag: true,
      backgroundColor: Color(themes),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30.0),
        topRight: Radius.circular(30.0),
      )),
    );
  }
}

class icons extends StatelessWidget {
  var icon;
  var name;
  var icon_arrow;
  var size_;
  var theme;
  var themes;
  var theme_contentColor;
  icons(this.icon, this.name, this.icon_arrow, this.size_, this.theme,
      this.themes, this.theme_contentColor);
  @override
  Widget build(BuildContext context) {
    var size = mediaQuery(context);
    Future.delayed(Duration.zero, () {
      context.read<setting_provider>().Themsss();
    });

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SizedBox(
              width: size.getWidth() * 3,
            ),
            Container(
              decoration: BoxDecoration(
                color: Color(theme_contentColor),
                border: Border.all(
                  color: Color(theme_contentColor),
                  width: size.getWidth() * 1,
                ),
                borderRadius: BorderRadius.circular(size.getWidth() * 2),
              ),
              child: Icon(
                icon,
                size: size.getWidth() * 8,
                color: Color(themes),
              ),
            ),
            SizedBox(
              width: size.getWidth() * 2,
            ),
            Text(
              name,
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Color(themes)),
            ),
          ],
        ),
        Container(
          width: size.getWidth() * 10,
          child: Icon(icon_arrow, color: Color(themes)),
        ),
      ],
    );
  }
}

class fingerprint extends StatelessWidget {
  var icon;
  var name;
  var size_;
  var boolen;
  var theme;
  var themes;
  var theme_contentColor;
  fingerprint(this.icon, this.name, this.size_, this.boolen, this.theme,
      this.themes, this.theme_contentColor);

  @override
  Widget build(BuildContext context) {
    var size = mediaQuery(context);

    return Consumer<setting_provider>(
      builder: (BuildContext context, value, Widget? child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Row(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: size.getWidth() * 3),
                  decoration: BoxDecoration(
                    color: Color(theme_contentColor),
                    border: Border.all(
                      color: Color(theme_contentColor),
                      width: size.getWidth() * 1,
                    ),
                    borderRadius: BorderRadius.circular(
                      size.getWidth() * 2,
                    ),
                  ),
                  child: Icon(
                    icon,
                    size: size.getWidth() * 8,
                    color: Color(themes),
                  ),
                ),
                SizedBox(
                  width: size.getWidth() * 2,
                ),
                Text(
                  name,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Color(themes)),
                ),
              ],
            ),
            Switch(
                inactiveTrackColor: Color(themes),
                value: boolen,
                onChanged: (v) {
                  value.fingerprint_();
                }),
          ],
        );
      },
    );
  }
}
class nightlight extends StatelessWidget {
  var icon;
  var name;
  var size_;
  var theme;
  var themes;
  var theme_contentColor;
  nightlight(this.icon, this.name, this.size_, this.theme,
      this.themes, this.theme_contentColor);

  @override
  Widget build(BuildContext context) {
    var size = mediaQuery(context);

    return Consumer<setting_provider>(
      builder: (BuildContext context, value, Widget? child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Row(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: size.getWidth() * 3),
                  decoration: BoxDecoration(
                    color: Color(theme_contentColor),
                    border: Border.all(
                      color: Color(theme_contentColor),
                      width: size.getWidth() * 1,
                    ),
                    borderRadius: BorderRadius.circular(
                      size.getWidth() * 2,
                    ),
                  ),
                  child: Icon(
                    icon,
                    size: size.getWidth() * 8,
                    color: Color(themes),
                  ),
                ),
                SizedBox(
                  width: size.getWidth() * 2,
                ),
                Text(
                  name,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Color(themes)),
                ),
              ],
            ),
            Switch(
                inactiveTrackColor: Color(themes),
                value: value.nightlight,
                onChanged: (v) {


                  Future.delayed(Duration.zero, ()async{



                    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => MyApp()),(Route<dynamic> route) => false);
                    value.nightlight_();

                     });


                }),
          ],
        );
      },
    );
  }
}


class notification extends StatelessWidget {
  var icon;
  var name;
  var size_;
  var boolen;
  var theme;
  var themes;
  var theme_contentColor;
  notification(this.icon, this.name, this.size_, this.boolen, this.theme,
      this.themes, this.theme_contentColor);

  @override
  Widget build(BuildContext context) {
    var size = mediaQuery(context);
    Language language = Language();
    return Consumer<setting_provider>(
      builder: (BuildContext context, value, Widget? child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Row(
              children: [

                Container(
                  margin: EdgeInsets.symmetric(horizontal: size.getWidth() * 3),
                  decoration: BoxDecoration(
                    color: Color(theme_contentColor),
                    border: Border.all(
                      color: Color(theme_contentColor),
                      width: size.getWidth() * 1,
                    ),
                    borderRadius: BorderRadius.circular(size.getWidth() * 2),
                  ),
                  child:
                      Icon(icon, size: size.getWidth() * 8, color: Color(themes)),
                ),
                Text(name,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Color(themes))),
              ],
            ),

            Switch(
                inactiveTrackColor: Color(themes),
                value: value.notification,
                onChanged: (v) {
                  value.notification_();
                }),
          ],
        );
      },
    );
  }
}
