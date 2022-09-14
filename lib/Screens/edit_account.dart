import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../Constants/language.dart';
import '../Constants/size.dart';
import '../Constants/theme.dart';
import 'package:provider/provider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../Providers/edit_account_provider.dart';
class edit_account extends StatefulWidget {
  const edit_account({Key? key}) : super(key: key);

  @override
  State<edit_account> createState() => _edit_accountState();
}

class _edit_accountState extends State<edit_account> {


  @override
  Widget build(BuildContext context) {
    Language language = Language();
    Themes theme = Themes();
    var size = mediaQuery(context);
    Future.delayed(Duration.zero, () {
      context.read<edit_account_provider>().addMarkers();
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
        title: Text(language.GetWord('Edit account'),style: TextStyle(color: Color(theme.getColor("iconsColor"))),),

      ),
      body: Column(
        children: [
          SizedBox(
            height: size.getHeight() * 2,
          ),
          Center(
            child:Container(
              decoration:BoxDecoration(
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
          ),
          SizedBox(
            height: size.getHeight() * 4,
          ),
          Row(

            children: [
              SizedBox(
                width: size.getWidth() * 6,

              ),
               Text("Name", style: TextStyle(color: Color(theme.getColor("iconsColor")),)),
            ],
          ),
          Consumer<edit_account_provider>(
            builder: (BuildContext context, value, Widget? child) {
              return  Row(
                children: [

                  Container(
                    margin: EdgeInsets.all(size.getWidth()*5),
                    height: size.getHeight() *6,
                    width: size.getWidth() *90,

                    decoration: BoxDecoration(
                      color: Color(theme.getColor("contentColor")),
                      borderRadius: BorderRadius.circular(size.getWidth() * 3),
                    ),
                    child:Row(
                      children: [
                        SizedBox(
                          width: size.getWidth() * 2,
                        ),
                        Text(value.name, style: TextStyle(color: Color(theme.getColor("iconsColor")),)),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),

          Row(

            children: [
              SizedBox(
                width: size.getWidth() * 6,

              ),
              Text("Email", style: TextStyle(    color: Color(theme.getColor("iconsColor")),)),
            ],
          ),
          Consumer<edit_account_provider>(
            builder: (BuildContext context, value, Widget? child) {
              return  Row(
                children: [

                  Container(
                    margin: EdgeInsets.all(size.getWidth()*5),
                    height: size.getHeight() *6,
                    width: size.getWidth() *90,

                    decoration: BoxDecoration(
                      color: Color(theme.getColor("contentColor")),
                      borderRadius: BorderRadius.circular(size.getWidth() * 3),
                    ),
                    child:Row(
                      children: [
                        SizedBox(
                          width: size.getWidth() * 2,
                        ),
                        Text(value.email, style: TextStyle(color: Color(theme.getColor("iconsColor")),)),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
          Row(

            children: [
              SizedBox(
                width: size.getWidth() * 6,

              ),
                Text("Mobile", style: TextStyle(color: Color(theme.getColor("iconsColor")),)),
            ],
          ),
          Consumer<edit_account_provider>(
            builder: (BuildContext context, value, Widget? child) {
              return  Row(
                children: [

                  Container(
                    margin: EdgeInsets.all(size.getWidth()*5),
                    height: size.getHeight() *6,
                    width: size.getWidth() *90,

                    decoration: BoxDecoration(
                      color: Color(theme.getColor("contentColor")),
                      borderRadius: BorderRadius.circular(size.getWidth() * 3),
                    ),
                    child:Row(
                      children: [
                        SizedBox(
                          width: size.getWidth() * 2,
                        ),
                        Text(value.nmber_mobile, style: TextStyle(color: Color(theme.getColor("iconsColor")),)),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
          Row(

            children: [
              SizedBox(
                width: size.getWidth() * 6,

              ),
                Text("Address", style: TextStyle(color: Color(theme.getColor("iconsColor")),)),
            ],
          ),
          Consumer<edit_account_provider>(
            builder: (BuildContext context, value, Widget? child) {
              return  Row(
                children: [

                  Container(
                    margin: EdgeInsets.all(size.getWidth()*5),
                    height: size.getHeight() *27,
                    width: size.getWidth() *90,

                    decoration: BoxDecoration(
                      color: Colors.white38,
                      borderRadius: BorderRadius.circular(size.getWidth() * 3),
                    ),


                    child: Consumer<edit_account_provider>(
              builder: (BuildContext context, value, Widget? child){
                 return Stack(
                   children: [


                     GoogleMap(

                       zoomControlsEnabled: false,
                       zoomGesturesEnabled: false,

                       initialCameraPosition: CameraPosition(
                         target: value.carLocation,
                         zoom: 14.0,


                       ),
                       markers: value.markers,
                       mapType: MapType.normal, //map type
                       onMapCreated: (controller) {
                         setState(() {
                         //  mapController = controller;

                         });
                       },
                     ),
                     Container(
                       child:Container(
                         decoration: BoxDecoration(
                           color: Colors.transparent,
                         ),
                       ),
                     ),
                   ],
                 );
              }

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
