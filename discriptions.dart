import 'package:flutter/material.dart';
import 'package:moviesapp/utilies/text.dart';


class Description extends StatelessWidget {
  final String name, description, bannerurl, posterurl, vote, launch_on;

  const Description(
      { Key? key,
        required this.name,
        required this.description,
        required this.bannerurl,
        required this.posterurl,
        required this.vote,
        required this.launch_on})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      appBar: AppBar(backgroundColor: Colors.transparent,

        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.orange),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const modified_text(
          text: 'Cinema Time',
          size: 22, color: Colors.white,
        ),

      ),
      body: ListView(children: [
        SizedBox(
            height: 250,
            child: Stack(children: [
              Positioned(
                child: SizedBox(
                  height: 250,
                  width: MediaQuery.of(context).size.width,
                  child: Image.network(
                    bannerurl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                  bottom: 10,
                  child: modified_text(text: '⭐ Average Rating - ' + vote, color: Colors.white, size:12,)),
            ])),
        const SizedBox(height: 15),
        Container(
            padding: const EdgeInsets.all(10),
            child: modified_text(
                text:  name, size: 24, color: Colors.white,)),
        Container(
            padding: const EdgeInsets.only(left: 10),
            child:
            modified_text(text: 'Releasing On - ' + launch_on, size: 14, color: Colors.white,)),
        Row(
          children: [
            SizedBox(
              height: 200,
              width: 100,
              child: Image.network(posterurl),
            ),
            Flexible(
              child: Container(
                  padding: const EdgeInsets.all(10),
                  child: modified_text(text: description, size: 18, color: Colors.white,)),
            ),
          ],
        )
      ]),
    );
  }
}