import 'package:flutter/material.dart';
import 'package:tmdb_app/description.dart';
import 'package:tmdb_app/utils/text.dart';

class TV extends StatelessWidget {
  const TV({super.key, required this.tv});

  final List tv;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const MovieText(text: 'TV Shows', color: Colors.white, size: 20),
          const SizedBox(height: 15),
          SizedBox(
            height: 230,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: tv.length,
              itemBuilder: (ctx, i) => InkWell(
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => Discription(
                      name: tv[i]['original_name'],
                      description: tv[i]['overview'],
                      bannerurl:
                          'https://image.tmdb.org/t/p/w500${tv[i]['backdrop_path']}',
                      posterurl:
                          'https://image.tmdb.org/t/p/w500${tv[i]['poster_path']}',
                      rating: tv[i]['vote_average'].toString(),
                      launchDate: tv[i]['first_air_date'],
                    ),
                  ),
                ),
                child: tv[i]['original_name'] != null
                    ? Container(
                        padding: const EdgeInsets.all(5),
                        width: 250,
                        child: Column(
                          children: [
                            Container(
                              width: 250,
                              height: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                  image: NetworkImage(
                                    'https://image.tmdb.org/t/p/w500${tv[i]['backdrop_path']}',
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            MovieText(
                              text: tv[i]['original_name'] ?? 'Loading',
                              color: Colors.white,
                              size: 16,
                            )
                          ],
                        ),
                      )
                    : Container(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
