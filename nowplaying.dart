import 'package:flutter/material.dart';
import 'package:moviesapp/utilies/text.dart';

import '../discriptions.dart';

class Nowplaying extends StatelessWidget {
  final List nowplaying;

  const Nowplaying({Key? key, required this.nowplaying}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const modified_text(
            text: 'Nowplaying Movies',
            size: 26, color: Colors.white,
          ),
          const SizedBox(height: 10),
          SizedBox(
              height: 270,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: nowplaying.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Description(
                                  name: nowplaying[index]['title'],
                                  bannerurl:
                                  'https://image.tmdb.org/t/p/w500' +
                                      nowplaying[index]['backdrop_path'],
                                  posterurl:
                                  'https://image.tmdb.org/t/p/w500' +
                                      nowplaying[index]['poster_path'],
                                  description: nowplaying[index]['overview'],
                                  vote: nowplaying[index]['vote_average']
                                      .toString(),
                                  launch_on: nowplaying[index]
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
                                          nowplaying[index]['poster_path']),
                                ),
                              ),
                              height: 200,
                            ),
                            const SizedBox(height: 5),
                            modified_text(
                              size: 15,
                              text: nowplaying[index]['title'] ?? 'Loading', color: Colors.blue,)
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
