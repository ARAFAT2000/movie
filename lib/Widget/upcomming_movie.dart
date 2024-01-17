import 'package:flutter/material.dart';
import 'package:movie/Description/description.dart';
import 'package:movie/Utils/text.dart';


class UpcommingMovie extends StatelessWidget {
  /// access data  treandingmovies ,,,on homepage
  final List upcomming;
  const UpcommingMovie({super.key,required this.upcomming});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          modified_Text(text: 'UpComing Movie', size: 20.5,),
          SizedBox(height: 15,),
          Container(
            height: 265,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: upcomming.length,
                itemBuilder: (context,index){
                  return InkWell(
                    onTap: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context)=>DescripTion(
                              name: upcomming[index]['original_title'],
                              description: upcomming[index]['overview'].toString(),
                              bannerurl: 'https://image.tmdb.org/t/p/w500'+upcomming[index]['backdrop_path'].toString(),
                              posterurl: 'https://image.tmdb.org/t/p/w500'+upcomming[index]['poster_path'].toString(),
                              vote:upcomming[index]['vote_average'].toString(),
                              launch_on: upcomming[index]['release_date'].toString())));
                    },
                    child:upcomming[index]['original_title']!=null ?Container(
                      width: 140,
                      child: Column(
                        children: [
                          Container(
                            height:200,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage( 'https://image.tmdb.org/t/p/w500'+upcomming[index]['poster_path']))
                            ),
                          ),
                          SizedBox(height: 5,),
                          Container(
                            child: modified_Text(text: upcomming[index]['original_title']!=null ?upcomming[index]['original_title']:'Looding', size: 15),)
                        ],
                      ),
                    ):Container() ,
                  );
                }),
          )
        ],
      ),
    );
  }
}
