
import 'package:flutter/cupertino.dart';
import 'package:movie_c17_me/features/details/data/model/details_model.dart';

import '../../../../core/resources/colors_app.dart';
import '../../../../core/resources/style_app.dart';

class genresGrid extends StatelessWidget {
  genresGrid({super.key,required this.geners,required this.count});
  dynamic count;
  Movie geners;
  @override
  Widget build(BuildContext context) {
    return    GridView.builder(
        shrinkWrap: true,
        itemCount: count,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisSpacing: 54,mainAxisSpacing: 20,crossAxisCount: 2,childAspectRatio: 12/3), itemBuilder: (context,index ){


      return Container(

        decoration: BoxDecoration(color: ColorsApp.sceondry,borderRadius: BorderRadius.circular(16)),
        child: Center(child: Text(geners.genres![index],style: StyleApp.smText,)),);
    });
  }
}
