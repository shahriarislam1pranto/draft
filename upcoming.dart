import 'package:flutter/material.dart';
import 'package:moviesapp/utilies/text.dart';

import '../discriptions.dart';

class UpcomingMovies extends StatelessWidget {
  final List upcoming;

  const UpcomingMovies({Key? key, required this.upcoming}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const modified_text(
            text: 'Upcoming Movies',
            size: 26, color: Colors.white,
          ),
          const SizedBox(height: 10),
          SizedBox(
              height: 270,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: upcoming.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Description(
                                  name: upcoming[index]['title'],
                                  bannerurl:
                                  'https://image.tmdb.org/t/p/w500' +
                                      upcoming[index]['backdrop_path'],
                                  posterurl:
                                  'https://image.tmdb.org/t/p/w500' +
                                      upcoming[index]['poster_path'],
                                  description: upcoming[index]['overview'],
                                  vote: upcoming[index]['vote_average']
                                      .toString(),
                                  launch_on: upcoming[index]
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
                                          upcoming[index]['poster_path']),
                                ),
                              ),
                              height: 200,
                            ),
                            const SizedBox(height: 5),
                            modified_text(
                              size: 15,
                              text: upcoming[index]['title'] ?? 'Loading', color: Colors.blue,)
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
