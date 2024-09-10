import 'package:flutter/material.dart';
import 'package:tmdb_app/utils/text.dart';

class Discription extends StatelessWidget {
  const Discription(
      {super.key,
      required this.name,
      required this.description,
      required this.bannerurl,
      required this.posterurl,
      required this.rating,
      required this.launchDate});

  final String name, description, bannerurl, posterurl, rating, launchDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
            height: 250,
            child: Stack(
              children: [
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
                  child: MovieText(
                      text: 'Rating - $rating',
                      color: Colors.white,
                      size: 18),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          Container(
            padding: const EdgeInsets.all(10),
            child: MovieText(
              text: name,
              color: Colors.white,
              size: 24,
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 10),
            child: MovieText(
              text: 'Releasing on - $launchDate',
              color: Colors.white,
              size: 14,
            ),
          ),
          Row(children: [Container(
            height: 200,
            width: 100,
            margin: const EdgeInsets.all(5),
            child: Image.network(posterurl),
          ),
          Flexible(child: MovieText(text: description, color: Colors.white, size: 15))
          ],)
        ],
      ),
    );
  }
}
