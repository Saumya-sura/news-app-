// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/screens/home.dart';

class Spalsh extends StatefulWidget {
  const Spalsh({super.key});

  @override
  State<Spalsh> createState() => _SpalshState();
}

class _SpalshState extends State<Spalsh> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), (){
      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>Homee())); 
    
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(  
        body:Container( 
            child:Column( 
              children: [ 
                Image.asset('assets/splash_pic.jpg', 
                width:  MediaQuery.sizeOf(context).width*.9,
                height: MediaQuery.sizeOf(context).height*.6,
                ),
                SizedBox(height: 20,),
                Text( 'Top Headlines', style:GoogleFonts.anton(letterSpacing: 1.5, fontSize: 30, color: Colors.black),),
                SpinKitChasingDots(color: Colors.black, size: 50,)
              ],
            ),
        )
    );
  }
}