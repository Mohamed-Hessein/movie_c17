import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_c17_me/core/resources/app_string.dart';
import 'package:movie_c17_me/core/resources/colors_app.dart';
import 'package:movie_c17_me/di.dart';
import 'package:movie_c17_me/features/details/data/model/details_model.dart';
import 'package:movie_c17_me/features/details/presentation/Bloc/details_bloc.dart';
import 'package:movie_c17_me/features/details/presentation/Bloc/details_events.dart';
import 'package:movie_c17_me/features/details/presentation/Bloc/details_state.dart';

import '../../../../core/resources/image&icon.dart';
import '../../../../core/resources/style_app.dart';
import '../../../home/data/model/MoviseResponse.dart';
import '../widgets/cast_list_view.dart';
import '../widgets/cusotm_btn.dart';
import '../widgets/custom_list_of_chips.dart';
import '../widgets/geners_gird_biew.dart';
import '../widgets/screen_shot_list.dart';
import '../widgets/similar_gridView.dart';
@RoutePage()
class MovieDetailsScreen extends StatelessWidget {
  Movies movies ;
  MovieDetailsScreen({super.key,required this.movies});

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create:(context) => getIt<DetailsBloc>()..add(getDetails(movies.id))..add(getSuggest(movies.id)),
      child: BlocConsumer<DetailsBloc, DetailsState>(
          listener: (context, state){



          },
          builder: (context, state) {

            if (state.getDetailsStatus == RequestStatus.loading) {
              return   Center(child: CircularProgressIndicator());
            }

            if (state.getDetailsStatus == RequestStatus.error) {
              return
                Center(child: Text("Something went wrong"));

            }

            final movie = state.detailsOfMovies?.data?.movie;
            final suggest= state.suggestions;
            if(suggest ==null){
              return SizedBox();
            }
            if (movie == null) {
              return SizedBox();

            }
            else
            {
              return      Scaffold(
                  backgroundColor: ColorsApp.background,
                  extendBodyBehindAppBar: true,
                  appBar: AppBar(
                    backgroundColor: Colors.transparent,
                    automaticallyImplyActions: false,
                    leadingWidth: 50,
                    automaticallyImplyLeading: false,
                    title: GestureDetector(onTap: (){context.pop();},
                        child: ImageIcon(AssetImage(IconApp.arrowBack),color: Colors.white,size: 24,)),
                    actions: [ImageIcon(AssetImage(IconApp.saveIc),color: Colors.white,),SizedBox(width: 15,)],),
                  body: SingleChildScrollView(child: Column(

                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.network(movie.mediumCoverImage ??'',width: 430.w,height: 630.h,fit: BoxFit.cover,),

                          Center(
                            child: Image.asset(ImageApp.play,width: 97.w,height: 97.h,),
                          ),
                          Positioned(
                              bottom: 100,
                              left: 16,
                              right: 16,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text(textAlign: TextAlign.center,movie.title??'',style: StyleApp.lgText,),
                              )),
                          Positioned(
                              bottom: 60.sp,
                              left: 16,
                              right: 16,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text(textAlign: TextAlign.center,movie.dateUploaded!.substring(0,4)??'',style: StyleApp.lgText,),
                              )),
                        ],
                      ),
                      CustomBtn(text: 'watch', onPressed: () {  },),
                      SizedBox(height: 15.h,),
                      RowRating(star:movie.torrents?.first.seeds??'', time: movies.runtime?? '', fav: movies.rating,),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(AppString.subTitleDetailsScreenShots,style: StyleApp.lgText,),
                      ),SizedBox(height: 1.h,),
                      ScreenShotList(image: movie.backgroundImage),
                      SizedBox(height: 9.h,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(AppString.simialr,style: StyleApp.lgText,),
                      ),SizedBox(height: 1.h,),
                      CusctomGridView(suggest: suggest,),
                      SizedBox(height: 5.h,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(AppString.summary,style: StyleApp.lgText,),
                      ),SizedBox(height: 1.h,),
                      Text(

                          style:StyleApp.smText.copyWith(letterSpacing: 0) ,'${movies.summary}')


                      , Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(AppString.cast,style: StyleApp.lgText,),
                      ),SizedBox(height: 1.h,),
                      ListCastView( name:movie.title??'', image: movie.smallCoverImage??'',),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(AppString.genres,style: StyleApp.lgText,),
                      ),SizedBox(height: 1.h,),

                      genresGrid(geners: movie, count: movie.genres?.length,),
                    ],)));
            }

          }

      ),
    );
  }
}