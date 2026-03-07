import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/resources/colors_app.dart';
import '../../../../core/resources/style_app.dart';
import '../bloc/browser_bloc.dart';
import '../bloc/browser_event.dart';
import '../bloc/browser_state.dart';

class ChipsListview extends StatelessWidget {
  ChipsListview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BrowserBloc, BrowserState>(
      builder: (context, state) {
        if (state.browserStatus == RequestStatus.loading) {
          return CircularProgressIndicator();
        }
        if (state.browserStatus == RequestStatus.error) {
          return Center(child: Text(state.errorMassage.toString()));
        }

        final movies = state.browsermodel?.data?.movies ?? [];
        final allGenres = <String>{};
        for (var movie in movies) {
          if (movie.genres != null) allGenres.addAll(movie.genres!);
        }
        final genreList = allGenres.toList();

        return SizedBox(
          height: 100,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: genreList.length,
            separatorBuilder: (_, __) => SizedBox(width: 10),
            itemBuilder: (context, index) {
              final genre = genreList[index];
              return ClipRRect(
                borderRadius: BorderRadius.circular(90),
                child: GestureDetector(
                  onTap: () {
                    context.read<BrowserBloc>().add(FilterByGenreEvent(genre));
                  },
                  child: Chip(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    backgroundColor: ColorsApp.background,
                    side: BorderSide(color: ColorsApp.textGlod,width: 1),
                    label: Text(
                      genre,
                      style: StyleApp.smText.copyWith(color: ColorsApp.textGlod),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}