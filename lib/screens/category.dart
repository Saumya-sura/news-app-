import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news/screens/home.dart';
import 'package:news/view_model/newsview.dart';

class Categori extends StatefulWidget {
  const Categori({super.key});

  @override
  State<Categori> createState() => _CategoriState();
}

class _CategoriState extends State<Categori> {
  final NewsViewModel newsView = NewsViewModel();
  
  final format =  DateFormat('MMMM dd');
  String name = 'general';
  List<String> CategoriesList = [
    'general',
    'business',
    'entertainment',
    'health',
    'science',
    'sports',
    'technology'
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar: AppBar(),
      body: Column( 
        children: [ 
          SizedBox( 
            height: 10,
          child:  ListView.builder( 
            scrollDirection: Axis.horizontal,
            itemCount: CategoriesList.length,
          itemBuilder: (context, index) {
              return Container( 
                  child: Text(CategoriesList[index]),
              );
          } ),
          ),
          
          
        ],
      ),
    );
  }
}