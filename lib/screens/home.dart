import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:news/models/headline.dart';
import 'package:news/view_model/newsview.dart';

class Homee extends StatefulWidget {
  const Homee({super.key});

  @override
  State<Homee> createState() => _HomeeState();
}

class _HomeeState extends State<Homee> {
  final NewsViewModel newsView = NewsViewModel();
  final format =  DateFormat('MMMM dd');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.apps),
          onPressed: () {},
        ),
        title: Text('NEws'),
      ),
      body: ListView( 
        children: [ 
          SizedBox( 
            height: MediaQuery.of(context).size.height * .55,
            width: MediaQuery.of(context).size.width,
            child: FutureBuilder<NewsChannelHeadlinesModel>(
        future: newsView.fetchHeadline(),
        builder: (BuildContext context, AsyncSnapshot<NewsChannelHeadlinesModel> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: SpinKitCircle(
                size: 50,  // Adjust the size as needed
                color: Colors.blue,
              ),
            );
          } 
                
              
            
           else {
            return ListView.builder(
              itemCount: snapshot.data!.articles!.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: ( context,  index) {
                DateTime date = DateTime.parse(snapshot.data!.articles![index].publishedAt.toString());
                
                  return SizedBox(  
                    child: Stack( 
                      alignment: Alignment.center,
                      children: [ 
                        Container(

                            height: MediaQuery.of(context).size.height * .6,
                            width: MediaQuery.of(context).size.width *.9,
                          child:  Padding(
                            padding: const EdgeInsets.symmetric( 
                              horizontal: 10,
                              vertical: 10,
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: CachedNetworkImage( 
                                imageUrl: snapshot.data!.articles![index].urlToImage.toString(),
                                fit: BoxFit.cover,
                                placeholder: (context, url) => Container(child: spkinkit2),
                                errorWidget: (context, url, error) => Icon(Icons.error_outline,color: Colors.red),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 20,
                          child: Card( 
                            elevation: 10,

                            shape: RoundedRectangleBorder( 
                              borderRadius: BorderRadius.circular(20),
                              
                            ),
                            child: Container( 
                              alignment: Alignment.bottomCenter,
                              padding: EdgeInsets.all(15),
                              height: MediaQuery.of(context).size.height * .22,
                              child: Column( 
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [ 
                                  Container( 
                                    width: MediaQuery.of(context).size.width * .9,
                                    child: Text( 
                                      snapshot.data!.articles![index].title.toString(),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle( 
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Spacer(),
                                    Container( 
                                      width: MediaQuery.of(context).size.width * .9,
                                      child: Row( 
                                        children: [ 
                                          Text( 
                                      snapshot.data!.articles![index].source!.name.toString(),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle( 
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  Text( 
                                      format.format(date),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle( 
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                          
                                        ],
                                      ),
                                    )

                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    
                  ),
                );
              },
            );
          
          }
        }
            ),
          ),
          
        ],
      )
  
      );
  
    
          }

}
const spkinkit2 = SpinKitFadingCircle( 
  color: Colors.blue,
  size: 50,
);

          