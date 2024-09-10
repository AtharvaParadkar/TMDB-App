import 'package:flutter/material.dart';
import 'package:tmdb_app/description.dart';
import 'package:tmdb_app/utils/text.dart';

class TrendingMovies extends StatelessWidget {
  const TrendingMovies({super.key, required this.trending});

  final List trending;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const MovieText(
              text: 'Trending Movies', color: Colors.white, size: 20),
          const SizedBox(height: 15),
          SizedBox(
            height: 270,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: trending.length,
              itemBuilder: (ctx, i) => InkWell(
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => Discription(
                      name: trending[i]['title'],
                      description: trending[i]['overview'],
                      bannerurl:
                          'https://image.tmdb.org/t/p/w500${trending[i]['backdrop_path']}',
                      posterurl:
                          'https://image.tmdb.org/t/p/w500${trending[i]['poster_path']}',
                      rating: trending[i]['vote_average'].toString(),
                      launchDate: trending[i]['release_date'],
                    ),
                  ),
                ),
                child: trending[i]['title'] != null
                    ? SizedBox(
                        width: 140,
                        child: Column(
                          children: [
                            Container(
                              height: 200,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                    'https://image.tmdb.org/t/p/w500${trending[i]['poster_path']}',
                                  ),
                                ),
                              ),
                            ),
                            MovieText(
                              text: trending[i]['title'] ?? 'Loading',
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
