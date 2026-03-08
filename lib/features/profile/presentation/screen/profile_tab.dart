import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_c17_me/core/resources/colors_app.dart';
import 'package:movie_c17_me/di.dart';
import 'package:movie_c17_me/features/profile/presentation/bloc/history_bloc.dart';
import 'package:movie_c17_me/features/profile/presentation/widget/grid_view_films.dart';

import '../../../../core/resources/image&icon.dart';
import '../../../../core/resources/style_app.dart';
import '../bloc/fav_bloc.dart';
import '../bloc/fav_event.dart';
import '../bloc/history_event.dart';
import '../widget/fav_grid.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [  BlocProvider(
        create: (context) => getIt<HistoryBloc>()..add(HistoryGet()),),
        BlocProvider(
          create: (context) => getIt<FavBloc>()..add(getFav()),)


      ],

        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: Column(


                  children: [Container(
                    decoration: BoxDecoration(color: ColorsApp.surface),
                    child: Column(
                      children: [
                        Row(
                          mainAxisSize:MainAxisSize.min,
                          children: [
                        Column(
                          mainAxisSize:MainAxisSize.min,
                          children: [
                            Image.asset(ImageApp.byProfile,height: 118.h,width: 118.w,),
                            Text('John Safwat',style: StyleApp.smText.copyWith(fontSize: 12.sp),),
                            SizedBox(height: 15.h,),
                          ],
                        ),SizedBox(height: 15.h,),
                          Column(children: [Text('12',style: StyleApp.profileText,),
                          Text('Wish List',style: StyleApp.mdText,)],),
                            Column(children: [Text('12',style: StyleApp.profileText,),
                              Text('History',style: StyleApp.mdText,)],),


                                ],

                        ), Row(children: [SizedBox(height: 56.h
                          ,
                          width: 230.w,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(backgroundColor: ColorsApp.primaryGold,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                              onPressed: (){}, child: Center(child: Text('Edit Profile',style: StyleApp.mdText.copyWith(color: Colors.black),),)),
                        ),
                          SizedBox(width: 15.w,),
                          SizedBox(height: 56.h,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(backgroundColor: Colors.red,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                                onPressed: (){}, child: Center(child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Text('Exit',style: StyleApp.mdText,),
                                    Icon(Icons.logout,color: Colors.white,)
                                  ],
                                ),)),
                          ),
                        ],)

                        ,
                        SizedBox(height: 16.h,),

                        DefaultTabController(

                          length: 2, child: Column(children: [TabBar(

                            tabs: [Tab(icon: ImageIcon(AssetImage(IconApp.menuIc),size: 24,color: ColorsApp.primaryGold,),child:   Text("Watch List  ",style: StyleApp.smText,),
                        ),Tab(icon: ImageIcon(AssetImage(IconApp.folderIc),size: 24,color: ColorsApp.primaryGold,),child:   Text("History",style: StyleApp.smText,),
                            )],
                        indicatorColor: ColorsApp.primaryGold,
                          dividerColor: ColorsApp.background,
                        ),




                          SizedBox(
                            height: 400.h,
                            child: TabBarView(
                              children: [
                                FavGrid(),
                             GridViewFilms(),
                              ],
                            ),
                          ), ],),)
                      ],
                    ),
                  ),


                  ],),
              ),
            ),
          ),
        ),

    );
  }
}
