import 'package:flutter/material.dart';
import 'package:moviesapp/discriptions.dart';
import 'package:moviesapp/utilies/text.dart';


class PopularMovies extends StatelessWidget {
  final List popular;

  const PopularMovies({ Key? key, required this.popular}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const modified_text(
            text: 'Most Popular Movies',
            size: 26, color: Colors.white,
          ),
          const SizedBox(height: 10),
          SizedBox(
            // color: Colors.red,
              height: 270,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: popular.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Description(
                                  name: popular[index]['title'],
                                  bannerurl:
                                  'https://image.tmdb.org/t/p/w500' +
                                      popular[index]['backdrop_path'],
                                  posterurl:
                                  'https://image.tmdb.org/t/p/w500' +
                                      popular[index]['poster_path'],
                                  description: popular[index]['overview'],
                                  vote: popular[index]['vote_average']
                                      .toString(),
                                  launch_on: popular[index]
                                  ['release_date'],
                                )));
                      },
                      child: SizedBox(
                        width: 140,
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                      'https://image.tmdb.org/t/p/w500' +
                                          popular[index]['poster_path']),
                                ),
                              ),
                              height: 200,
                            ),
                            const SizedBox(height: 5),
                            modified_text(
                              size: 15,
                              text: popular[index]['title'] ?? 'Loading', color: Colors.blue,)
                          ],
                        ),
                      ),
                      );

                  }))
        ],
      ),
    );
  }
}