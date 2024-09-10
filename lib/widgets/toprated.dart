import 'package:flutter/material.dart';
import 'package:tmdb_app/description.dart';
import 'package:tmdb_app/utils/text.dart';

class TopRatedMovies extends StatelessWidget {
  const TopRatedMovies({super.key, required this.topRated});

  final List topRated;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const MovieText(
              text: 'Top Rated Movies', color: Colors.white, size: 20),
          const SizedBox(height: 15),
          SizedBox(
            height: 270,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: topRated.length,
              itemBuilder: (ctx, i) => InkWell(
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => Discription(
                      name: topRated[i]['title'],
                      description: topRated[i]['overview'],
                      bannerurl:
                          'https://image.tmdb.org/t/p/w500${topRated[i]['backdrop_path']}',
                      posterurl:
                          'https://image.tmdb.org/t/p/w500${topRated[i]['poster_path']}',
                      rating: topRated[i]['vote_average'].toString(),
                      launchDate: topRated[i]['release_date'],
                    ),
                  ),
                ),
                child: topRated[i]['title'] != null
                    ? SizedBox(
                        width: 140,
                        child: Column(
                          children: [
                            Container(
                              height: 200,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                    'https://image.tmdb.org/t/p/w500${topRated[i]['poster_path']}',
                                  ),
                                ),
                              ),
                            ),
                            MovieText(
                              text: topRated[i]['title'] ?? 'Loading',
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
