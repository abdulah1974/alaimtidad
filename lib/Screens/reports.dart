
import 'package:flutter/rendering.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Constants/language.dart';
import '../Constants/size.dart';
import '../Constants/theme.dart';
import 'package:provider/provider.dart';
import 'package:fl_chart/fl_chart.dart';
import '../Providers/reports_providers.dart';
class reports extends StatefulWidget {
  const reports({Key? key}) : super(key: key);

  @override
  State<reports> createState() => _reportsState();
}

class _reportsState extends State<reports> {

  @override
  Widget build(BuildContext context) {
    Language language = Language();
    Themes theme = Themes();
    var size = mediaQuery(context);
    Future.delayed(Duration.zero, () {




    });
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
        title: Text(language.GetWord('Reports'),style: TextStyle(color: Color(theme.getColor("iconsColor"))),),

      ),
      body:  Stack(
        children: [
        Consumer<reports_provider>(
          builder: (BuildContext context, value, Widget? child) {
            return NotificationListener<ScrollNotification>(

              child: NotificationListener<ScrollUpdateNotification>(

                child: SingleChildScrollView(

                  child: Consumer<reports_provider>(
                    builder: (BuildContext context, value, Widget? child) {
                      return Column(
                        children: [
                          SizedBox(width: size.getWidth(),),
                          Row(
                            children: [
                              for(int i=0;i<value.list.length;i++)

                                language.language==1?
                                InkWell(
                                  child: Container(
                                    width: size.getWidth()*33,
                                    height: size.getHeight()*8,

                                    color:  i == value.selectedIndex ? Color(theme.getColor("arrow_forward_ios_rounded"))  : Color(theme.getColor("contentColor")),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(width: size.getWidth()*1,),
                                        Center(child: Text(value.list[i],style: TextStyle(color:Color(theme.getColor("iconsColor")),fontWeight: FontWeight.bold,))),
                                        SizedBox(width: size.getWidth()*1,),
                                      ],
                                    ),
                                  ),
                                  onTap: (){
                                    setState(() {
                                      value.selectedIndex = i;
                                    });
                                  },

                                ):InkWell(
                                  child: Container(
                                    width: size.getWidth()*33,
                                    height: size.getHeight()*8,

                                    color:  i == value.selectedIndex? Color(theme.getColor("arrow_forward_ios_rounded")) : Color(theme.getColor("contentColor")),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [

                                        SizedBox(width: size.getWidth()*1,),
                                        Center(child: Text(value.list2[i],style: TextStyle(color:Color(theme.getColor("iconsColor")),fontWeight: FontWeight.bold,))),
                                        SizedBox(width: size.getWidth()*1,),
                                      ],
                                    ),
                                  ),
                                  onTap: (){
                                    setState(() {
                                      value.selectedIndex= i;
                                    });
                                  },
                                ),


                            ],

                          ),

                          Container(
                            height: size.getHeight()*32,
                            width: size.getWidth()* 100,
                            padding: EdgeInsets.symmetric(horizontal: size.getWidth()*3),
                            child:LineChartContent(),
                          ),
                          SizedBox(height: size.getHeight()*2,),
                          Consumer<reports_provider>(
                            builder: (BuildContext context, value, Widget? child) {
                              return value.selectedIndex==2?Container(
                                height: size.getHeight()*5,
                                width: size.getWidth()*94,
                                child: ListView.builder(

                                    scrollDirection: Axis.horizontal,
                                    itemCount: value.days_ar.length,
                                    itemBuilder:(_,index){
                                      return  InkWell(
                                        onTap: () {
                                          setState(() {
                                            value.item = index;

                                          });

                                        },
                                        child: Container(

                                          margin: EdgeInsets.symmetric(horizontal: size.getWidth()*1),
                                          child:Column(
                                            children: [

                                              Container(
                                                  alignment: Alignment.center,
                                                  margin: EdgeInsets.symmetric(horizontal: size.getWidth()*3),
                                                 child: language.language==1?Text(value.days_ar[index],style: TextStyle(color:index != value.item? Color(theme.getColor("iconsColor")):Colors.blue,fontSize: 16,fontWeight: FontWeight.w500),):Text(value.days_en[index],style: TextStyle(color:index != value.item? Color(theme.getColor("iconsColor")):Colors.blue,fontSize: 16,fontWeight: FontWeight.w500),)
                                              ),
                                              (index == value.item)?Container(
                                                margin: EdgeInsets.only(top: size.getHeight()*0.3),
                                                decoration: BoxDecoration(
                                                  color: Colors.blue,
                                                  borderRadius: BorderRadius.circular(size.getWidth()),
                                                ),
                                                width: size.getWidth()*1,
                                                height: size.getWidth()*1,
                                              ):Container()
                                            ],
                                          ),
                                        ),
                                      );
                                    }),
                              ):value.selectedIndex==1?Container(
                                height: size.getHeight()*5,
                                width: size.getWidth()*94,
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: value.months.length,
                                    itemBuilder:(_,index){
                                      return  InkWell(
                                        onTap: () {
                                          setState(() {
                                            value.item = index;

                                          });

                                        },
                                        child: Container(

                                          margin: EdgeInsets.symmetric(horizontal: size.getWidth()*1),
                                          child:Column(
                                            children: [

                                              Container(
                                                  alignment: Alignment.center,
                                                  margin: EdgeInsets.symmetric(horizontal: size.getWidth()*3),
                                                  child: language.language==1?Text(value.months_er[index],style: TextStyle(color:index != value.item? Color(theme.getColor("iconsColor")):Colors.blue,fontSize: 16,fontWeight: FontWeight.w500),):Text(value.months[index],style: TextStyle(color:index != value.item? Color(theme.getColor("iconsColor")):Colors.blue,fontSize: 16,fontWeight: FontWeight.w500),)
                                              ),
                                              (index == value.item)?Container(
                                                margin: EdgeInsets.only(top: size.getHeight()*0.3),
                                                decoration: BoxDecoration(
                                                  color: Colors.blue,
                                                  borderRadius: BorderRadius.circular(size.getWidth()),
                                                ),
                                                width: size.getWidth()*1,
                                                height: size.getWidth()*1,
                                              ):Container()
                                            ],
                                          ),
                                        ),
                                      );
                                    }),
                              ):Container(
                                height: size.getHeight()*5,
                                width: size.getWidth()*94,
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: value.year.length,
                                    itemBuilder:(_,index){
                                      return  InkWell(
                                        onTap: () {
                                          setState(() {
                                            value.item = index;

                                          });

                                        },
                                        child: Container(

                                          margin: EdgeInsets.symmetric(horizontal: size.getWidth()*1),
                                          child:Column(
                                            children: [

                                              Container(
                                                  alignment: Alignment.center,
                                                  margin: EdgeInsets.symmetric(horizontal: size.getWidth()*3),
                                                  child:Text(value.year[index], style: TextStyle(color:index != value.item? Color(theme.getColor("iconsColor")):Colors.blue,fontSize: 16,fontWeight: FontWeight.w500),)
                                              ),
                                              (index == value.item)?Container(
                                                margin: EdgeInsets.only(top: size.getHeight()*0.3),
                                                decoration: BoxDecoration(
                                                  color: Colors.blue,
                                                  borderRadius: BorderRadius.circular(size.getWidth()),
                                                ),
                                                width: size.getWidth()*1,
                                                height: size.getWidth()*1,
                                              ):Container()
                                            ],
                                          ),
                                        ),
                                      );
                                    }),
                              );
                            },

                          ),
                          for(int i=0;i<value.last_transaction_.length;i++)
                            last_transaction(value.last_transaction_[i][0], value.last_transaction_[i][1], size,value.last_transaction_[i][2],value.last_transaction_[i][3],theme.getColor("iconsColor")),

                        ],
                      );
                    },

                  ),
                ),

              ),
              onNotification: (ScrollNotification notification) {

                if (notification is UserScrollNotification) {
                  if (notification.direction == ScrollDirection.forward) {
                    print("up");
                    value.show_button();

                  } else if (notification.direction == ScrollDirection.reverse) {
                    value.hint_button_();
                    print("down");

                  }
                }
                return true;
              },

            );

          },

        ),

          Consumer<reports_provider>(
            builder: (BuildContext context, value, Widget? child) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [


                  SizedBox(width: size.getWidth()),
                  Visibility(
                    visible: value.hint_button,
                    child: Container(
                      width: size.getWidth()*90,
                      height:size.getHeight()*8,
                      margin: EdgeInsets.symmetric(horizontal: size.getWidth()*10 , vertical: size.getHeight()*2),
                      child:ElevatedButton(

                        onPressed: () {
                          setState(() {

                            DatePicker.showDatePicker(context,
                                showTitleActions: true,

                                theme: DatePickerTheme(

                                    headerColor:  Color(theme.getColor("contentColor")),
                                    backgroundColor: Color(theme.getColor("contentColor")),
                                    itemStyle: TextStyle(
                                      color: Color(theme.getColor("iconsColor")),
                                      fontWeight: FontWeight.bold,

                                    ),

                                    doneStyle:TextStyle(color: Color(theme.getColor("iconsColor")))),

                                minTime: DateTime(2022, 10, 5),
                                maxTime: DateTime(2022, 10, 30),
                                /*
                              onChanged: (date) {
                                print('change $date');
                              },

                               */
                                onConfirm: (date) {
                                  print('confirm $date');
                                },
                                // currentTime: DateTime.now(),

                                locale: language.language==1?LocaleType.ar:LocaleType.en);
                            // _showModalSheet(context);
                            //    _selectDate(context);
                            // _showModalSheet(context);
                          });

                        },
                        child: Text('Send'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red,

                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(size.getHeight()*1),
                          ),
                        ),
                      ),
                    ),
                  ),

                ],
              );
            },

          ),


        ],
      ),
    );
  }

}





class LineChartContent extends StatelessWidget {
  List<Color> gradientColors = [
    const Color(0xff2c7cff),
    const Color(0xff2c7cff),
  ];
  List<Color> gradientColors2 = [
    const Color(0xffc3ffff),
    const Color(0xff15305e),
  ];
  Themes theme = Themes();

  bool showAvg = false;
  @override
  Widget build(BuildContext context) {
    var size = mediaQuery(context);
    return Stack(
      children: <Widget>[
        // AspectRatio(
        //   aspectRatio: size.getHeight()*0.2,
        //   child:
          Container(
            decoration:  BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(size.getWidth()*4),
                ),
                color: Color(theme.getColor("backgrouund_2")),),
            child: LineChart(
                mainData(),
            ),
          ),
        // ),


      ],
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff68737d),
      fontWeight: FontWeight.bold,
      fontSize: 16,
    );
    Widget text;
    switch (value.toInt()) {
      case 2:
        text = const Text('2020', style: style);
        break;
      case 5:
        text = const Text('2021', style: style);
        break;
      case 8:
        text = const Text('2022', style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 8.0,
      child: text,
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff67727d),
      fontWeight: FontWeight.bold,
      fontSize: 15,
    );
    String text;
    switch (value.toInt()) {
      case 1:
        text = '10K';
        print("g");
        break;
      case 3:
        text = '30k';
        break;
      case 5:
        text = '50k';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }

  LineChartData mainData() {
    return LineChartData(
      backgroundColor:Color(theme.getColor("backgrouund_2")),
      gridData: FlGridData(
        show: false,
        drawVerticalLine: false,
        horizontalInterval: 1,
        verticalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
            reservedSize: 27,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
            interval: 1,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 42,
          ),
        ),
      ),
      borderData: FlBorderData(
          show: false,
          border: Border.all(color: const Color(0xff37434d), width: 1)),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 3),
            FlSpot(2.6, 2),
            FlSpot(4.9, 5),
            FlSpot(6.8, 3.1),
            FlSpot(8, 4),
            FlSpot(9.5, 3),
            FlSpot(11, 4),
          ],
          isCurved: true,
          gradient: LinearGradient(

            colors: gradientColors,
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: true,//يضهر النقاط
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: gradientColors
                  .map((color) => color.withOpacity(0.2))
                  .toList(),
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
        ),
      ],
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
                crossAxisAlignment: CrossAxisAlignment.start,
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




