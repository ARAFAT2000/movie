import 'package:flutter/material.dart';
import 'package:movie/Utils/text.dart';

import '../Description/description.dart';


class TopRatedMovie extends StatelessWidget {
  /// access data  treandingmovies ,,,on homepage
  final List toprated;
  const TopRatedMovie({super.key,required this.toprated});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          modified_Text(text: 'Top Rated Movie', size: 20.5,),
          SizedBox(height: 15,),
          Container(
            height: 265,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: toprated.length,
                itemBuilder: (context,index){
                  return InkWell(
                    onTap: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context)=>DescripTion(
                              name: toprated[index]['title'],
                              description: toprated[index]['overview'].toString(),
                              bannerurl: 'https://image.tmdb.org/t/p/w500'+toprated[index]['backdrop_path'].toString(),
                              posterurl: 'https://image.tmdb.org/t/p/w500'+toprated[index]['poster_path'].toString(),
                              vote:toprated[index]['vote_average'].toString(),
                              launch_on: toprated[index]['release_date'].toString())));
                    },
                    child:Container(
                      width: 140,
                      child: Column(
                        children: [
                          Container(
                            height:200,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage( 'https://image.tmdb.org/t/p/w500'+
                                        toprated[index]['poster_path']))
                            ),
                          ),
                          SizedBox(height: 5,),
                          Container(
                            child: modified_Text(text: toprated[index]['title']!=null ?toprated[index]['title']:'Looding', size: 15),)
                        ],
                      ),
                    ) ,
                  );
                }),
          )
        ],
      ),
    );
  }
}
