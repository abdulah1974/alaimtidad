import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Constants/language.dart';
import '../Constants/size.dart';
import '../Constants/theme.dart';
import '../Providers/tasks_provider.dart';
class tasks extends StatefulWidget {
  const tasks({Key? key}) : super(key: key);

  @override
  State<tasks> createState() => _tasksState();
}

class _tasksState extends State<tasks> {
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
        title: Text(language.GetWord('Tasks'),style: TextStyle(color: Color(theme.getColor("iconsColor"))),),

      ),
      body: Consumer<tasks_provider>(
        builder: (BuildContext context, value, Widget? child) {
          return GridView.builder(
            itemCount: value.Task.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, mainAxisExtent: size.getHeight()*18,),

            itemBuilder: (BuildContext context, int index) {
              return  Container(
                margin: EdgeInsets.symmetric(horizontal: size.getHeight()*0.8,vertical: size.getWidth() * 1.5, ),
                decoration: BoxDecoration(
                  color: Color(theme.getColor("contentColor")),
                  borderRadius: BorderRadius.all(Radius.circular(size.getWidth()*3.5)),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                            Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: size.getWidth() * 7.8,
                                    vertical: size.getHeight() * 1),
                                child: Image.asset(language.language==1?value.Task[index][0]:value.Task_en[index][0]),),
                      Container(
                       alignment: Alignment.center,
                        child: Text(
                          textAlign: TextAlign.center,
                          language.language==1?value.Task[index][1].toString():value.Task_en[index][1].toString(),
                          style: TextStyle(
                               fontSize: size.getWidth()*3.3,
                                color: Color(theme.getColor("iconsColor")),
                                fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
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

