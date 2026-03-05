import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/resources/colors_app.dart';
import '../../../../core/resources/image&icon.dart';
import '../bloc/browser_bloc.dart';
import '../bloc/browser_state.dart';

class GridViewCustomBrowser extends StatelessWidget {
  const GridViewCustomBrowser({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BrowserBloc, BrowserState>(
      builder: (context, state) {

        final movies = state.displayedMovies ?? state.browsermodel?.data?.movies ?? [];

        if (movies.isEmpty) {
          return Center(child: Text('No movies found'));
        }

        return SizedBox(
          height: 600,
          child: GridView.builder(
            shrinkWrap: true,

            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 2 / 3,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
            ),
            itemCount: movies.length,
            itemBuilder: (context, index) {
              final movie = movies[index];
              return Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: CachedNetworkImage(

                      imageUrl: movie.largeCoverImage??'',
                      placeholder: (context, url) => CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                  Positioned(
                    top: 8,
                    left: 8,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(18, 19, 18, 0.71),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            '${movie.rating}',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          SizedBox(width: 4),
                          ImageIcon(
                            AssetImage(IconApp.star),
                            color: ColorsApp.primaryGold,
                            size: 16,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}