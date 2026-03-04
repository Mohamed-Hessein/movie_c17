
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_c17_me/features/details/data/model/suggestion_model.dart';

import '../../../../core/resources/colors_app.dart';
import '../../../../core/resources/image&icon.dart';

class CusctomGridView extends StatelessWidget {
   CusctomGridView({super.key,required this.suggest});
   Suggestions suggest;

  @override
  Widget build(BuildContext context) {
    return     SizedBox(
      child: GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 16/9,mainAxisSpacing: 37,crossAxisSpacing: 37) ,itemCount:suggest.data?.movies?.length, itemBuilder: (context, index){


        return Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(

             suggest.data?.movies![index].backgroundImage ??'',
                fit: BoxFit.contain,
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
                      '${suggest.data?.movies![index].rating}',
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
  }
}