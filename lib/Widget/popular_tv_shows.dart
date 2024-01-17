import 'package:flutter/material.dart';
import 'package:movie/Utils/text.dart';

import '../Description/description.dart';


class Popular_TvShow extends StatelessWidget {
  /// access data  treandingmovies ,,,on homepage
  final List tvshow;
  const Popular_TvShow({super.key,required this.tvshow});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          modified_Text(text: 'Popular TV Show', size: 20.5,),
          SizedBox(height: 15,),
          Container(
            height: 200,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: tvshow.length,
                itemBuilder: (context,index){
                  return InkWell(
                    onTap: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context)=>DescripTion(
                              name: tvshow[index]['original_name'],
                              description: tvshow[index]['overview'].toString(),
                              bannerurl: 'https://image.tmdb.org/t/p/w500'+tvshow[index]['backdrop_path'].toString(),
                              posterurl: 'https://image.tmdb.org/t/p/w500'+tvshow[index]['poster_path'].toString(),
                              vote:tvshow[index]['vote_average'].toString(),
                              launch_on: tvshow[index]['first_air_date'].toString())));
                    },
                    child:Container(
                      width: 250,
                      child: Column(
                        children: [
                          Container(

                            height:140,
                            width:250 ,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                    image: NetworkImage( 'https://image.tmdb.org/t/p/w500'+tvshow[index]['backdrop_path']),)
                            ),
                          ),
                          SizedBox(height: 5,),
                          Container(
                            child: modified_Text(
                                text: tvshow[index]['original_name']!=null ?tvshow[index]['original_name']:'Looding', size: 15),)
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
