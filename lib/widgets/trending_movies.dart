import 'package:flutter/material.dart';
import 'package:movie_app/pages/description.dart';
import 'package:movie_app/utils/custom_text.dart';

class TrendingMovies extends StatelessWidget {
  final List trending;

  const TrendingMovies({super.key, required this.trending});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const ModifiedText(text: "Trending Movies", size: 26,),
          SizedBox(height: 15,),
          Container(
            height: 270,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: trending.length,
              itemBuilder: (context, index){
                return InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Description(
                      name: trending[index]['title'],
                      bannerUrl: 'https://image.tmdb.org/t/p/w500' + trending[index]['backdrop_path'],
                      posertUrl: 'https://image.tmdb.org/t/p/w500' + trending[index]['poster_path'],
                      description: trending[index]['overview'],
                      vote: trending[index]['vote_average'].toString(),
                      launchOn: trending[index]['release_date'],
                    )));
                  },
                  child: trending[index]['title'] != null ? Container(
                    width: 140,
                    child: Column(
                      children: [
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                'https://image.tmdb.org/t/p/w500' + trending[index]['poster_path']
                              )
                            )
                          ),
                        ),
                        Container(
                          child: ModifiedText(text: trending[index]['title'] != null ? trending[index]['title'] : 'Loading...'),
                        )
                      ],
                    ),
                  ):Container(),
                );
              }
            ),
          )
        ],
      ),
    );
  }
}