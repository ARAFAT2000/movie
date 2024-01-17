import 'package:flutter/material.dart';
import 'package:movie/Utils/text.dart';

class DescripTion extends StatelessWidget {
 final String name,description,bannerurl,posterurl,vote,launch_on;

  const DescripTion({super.key, required this.name, required this.description, required this.bannerurl, required this.posterurl, required this.vote, required this.launch_on});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 10,right: 10),
        child: ListView(
          children: [
            Container(
              height: 250,
              child: Stack(
                children: [
                Positioned(
                    child: Container(
                   height: 250,
                      width: MediaQuery.of(context).size.width,
                      child: Image.network(bannerurl,fit: BoxFit.cover,),
                )),
                  Positioned(
                 bottom: 10,
                      child:
                  modified_Text(text: ' Avarage Ratting ★ -'+ vote, size: 15.5))
                ],
              ),
            ),
            SizedBox(height: 15,),
            Container(
              padding: EdgeInsets.all(10),
              child: modified_Text(text: name != null? name:'Loading ' , size: 24),
            ),
            Container(
              padding: EdgeInsets.only(left: 10),
              child: modified_Text(text: 'Realease on   '+launch_on, size: 16),
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.all(5),
                  height: 200,
                  width: 100,
                  child: Image.network(posterurl),
                ),
                Flexible(
                    child: Container(
                  child: modified_Text(text: description, size: 14),
                ))

              ],
            )
          ],
        ),
      ),
    );
  }
}
