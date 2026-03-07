import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/resources/colors_app.dart';
import '../../../../core/resources/image&icon.dart';
import '../bloc/history_bloc.dart';
import '../bloc/hsitory_state.dart';

class GridViewFilms extends StatelessWidget {
  const GridViewFilms({super.key});

  @override
  Widget build(BuildContext context) {
    return   BlocConsumer<HistoryBloc, HsitoryState>(
      builder: (BuildContext context,  state) {

        if(state.getMoviesStatus == RequestStatus.error){
          return Text(state.errorMassage.toString());

        }
        print('erorrrrrrrr?${state.errorMassage.toString()}');
        return  SizedBox(
        child: GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 2/3,mainAxisSpacing: 10,crossAxisSpacing: 10) ,itemCount:state.lastSeenMovie?.length, itemBuilder: (context, index){

var bloc = state.lastSeenMovie?[index];
return Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: CachedNetworkImage(

                  imageUrl:bloc?.data?.movie?.largeCoverImage??''  ,
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
                        '${bloc?.data?.movie?.rating??''}',
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
        }),

      );

        }, listener: (BuildContext context,  state) {


    },

    );
  }
}
