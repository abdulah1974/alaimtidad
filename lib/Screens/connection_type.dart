import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../Constants/language.dart';
import '../Constants/size.dart';
import '../Constants/theme.dart';
import 'package:connectivity/connectivity.dart';
class connection_type extends StatefulWidget {
  const connection_type({Key? key}) : super(key: key);

  @override
  State<connection_type> createState() => _connection_typeState();
}

class _connection_typeState extends State<connection_type> {




  void sss() async {
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('connected');
      }
    } on SocketException catch (_) {
      print('not connected');
    }


  }
  String _connectionStatus = 'Unknown';
  bool wifi=false;
   bool mobile=false;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  @override
  void initState() {
    super.initState();

    initConnectivity();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  Future<void> initConnectivity() async {
    ConnectivityResult result = ConnectivityResult.none;

    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      print(e.toString());
    }

    if (!mounted) {
      return Future.value(null);
    }

    return _updateConnectionStatus(result);
  }

  @override
  Widget build(BuildContext context) {
    Language language = Language();
    Themes theme = Themes();
    var size = mediaQuery(context);
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
        title:  Text(language.GetWord("Connection type"),style: TextStyle(color: Color(theme.getColor("iconsColor"))),),
      ),
      body: Column(
        children: [
           SizedBox(height: size.getHeight()*25,),
          wifi==true?Center(child: Icon(Icons.wifi,color: Color(theme.getColor("iconsColor")),size: size.getWidth()*30,)):Center(),
          wifi==true?Text(language.GetWord("You are now online via")+" Wifi",style: TextStyle(fontSize:  size.getWidth()*7,color: Color(theme.getColor("iconsColor")),)):Center(),

          mobile==true?Center(child: Icon(Icons.four_g_plus_mobiledata_rounded,color: Color(theme.getColor("iconsColor")),size: size.getWidth()*30,)):Center(),
          mobile==true?Text(language.GetWord("You are now online via")+" Mobile",style: TextStyle(fontSize: size.getWidth()*7,color: Color(theme.getColor("iconsColor"),),)):Center(),

        ],
      ),
    );
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    switch (result) {
      case ConnectivityResult.wifi:

      case ConnectivityResult.mobile:
      case ConnectivityResult.none:
        setState((){
          _connectionStatus = result.toString();
         if(result==ConnectivityResult.mobile){
           mobile=true;
           print("mobile connection");
         }
          if(result==ConnectivityResult.wifi){
            wifi=true;
          }
          if(result==ConnectivityResult.none){
            wifi=false;
            mobile=false;
            print("ll");
          }
        });
        break;
      default:
        setState(() => _connectionStatus = '');
        break;
    }
  }
}