import 'package:flutter/material.dart';
import 'package:movie_app/utils/custom_text.dart';

import '../pages/description.dart';

class PopularTvShows extends StatelessWidget {
  final List popularTvShows;

  const PopularTvShows({super.key, required this.popularTvShows});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const ModifiedText(text: "Popular Tv Shows", size: 26,),
          SizedBox(height: 15,),
          Container(
            height: 270,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: popularTvShows.length,
              itemBuilder: (context, index){
                return InkWell(
                  onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Description(
                      name: popularTvShows[index]['name'],
                      bannerUrl: 'https://image.tmdb.org/t/p/w500' + popularTvShows[index]['backdrop_path'],
                      posertUrl: 'https://image.tmdb.org/t/p/w500' + popularTvShows[index]['poster_path'],
                      description: popularTvShows[index]['overview'],
                      vote: popularTvShows[index]['vote_average'].toString(),
                      launchOn: popularTvShows[index]['release_date'],
                    )));
                  },
                  child: Container(
                    padding: EdgeInsets.all(5),
                    width: 250,
                    child: Column(
                      children: [
                        Container(
                          width: 250,
                          height: 140,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              image: NetworkImage(
                                'https://image.tmdb.org/t/p/w500' + popularTvShows[index]['backdrop_path']
                              ),
                              fit: BoxFit.cover
                            )
                          ),
                        ),
                        Container(
                          child: ModifiedText(text: popularTvShows[index]['name'] != null ? popularTvShows[index]['name'] : 'Loading...'),
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