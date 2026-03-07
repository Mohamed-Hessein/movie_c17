import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/resources/colors_app.dart';
import '../../../../core/resources/image&icon.dart';

class  RowRating extends StatelessWidget {
  RowRating({super.key,required this.star,required this.time,required this.fav});
  dynamic fav;
  dynamic time;
  dynamic star;

  @override
  Widget build(BuildContext context) {
    return             Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [

        Container(
          padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            color: Color(0xff2A2A2A),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              ImageIcon(AssetImage(IconApp.heart),color: ColorsApp.primaryGold,),
              SizedBox(width: 6),
              Text(
                '$fav',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ],
          ),
        ),


        Container(
          padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            color: Color(0xff2A2A2A),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              ImageIcon(AssetImage(IconApp.time),color: ColorsApp.primaryGold,),

              SizedBox(width: 6),
              Text(
               '$time',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ],
          ),
        ),


        Container(
          padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            color: Color(0xff2A2A2A),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              ImageIcon(AssetImage(IconApp.star),color: ColorsApp.primaryGold,),

              SizedBox(width: 6),
              Text(
               '$star',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ],
          ),
        ),

      ],
    );
  }
}