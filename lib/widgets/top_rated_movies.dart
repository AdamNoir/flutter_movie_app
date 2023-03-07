import 'package:flutter/material.dart';
import 'package:movie_app/utils/custom_text.dart';

import '../pages/description.dart';

class TopRatedMovies extends StatelessWidget {
  final List topRated;

  const TopRatedMovies({super.key, required this.topRated});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const ModifiedText(text: "Top Rated Movies", size: 26,),
          SizedBox(height: 15,),
          Container(
            height: 270,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: topRated.length,
              itemBuilder: (context, index){
                return InkWell(
                  onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Description(
                      name: topRated[index]['title'],
                      bannerUrl: 'https://image.tmdb.org/t/p/w500' + topRated[index]['backdrop_path'],
                      posertUrl: 'https://image.tmdb.org/t/p/w500' + topRated[index]['poster_path'],
                      description: topRated[index]['overview'],
                      vote: topRated[index]['vote_average'].toString(),
                      launchOn: topRated[index]['release_date'],
                    )));
                  },
                  child: Container(
                    width: 140,
                    child: Column(
                      children: [
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                'https://image.tmdb.org/t/p/w500' + topRated[index]['poster_path']
                              )
                            )
                          ),
                        ),
                        Container(
                          child: ModifiedText(text: topRated[index]['title'] != null ? topRated[index]['title'] : 'Loading...'),
                        )
                      ],
                    ),
                  ),
                );
              }
            ),
          )
        ],
      ),
    );
  }
}