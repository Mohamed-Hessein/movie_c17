
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/colors_app.dart';
import '../../../../core/resources/image&icon.dart';
import '../../../../core/resources/style_app.dart';

class ListCastView extends StatelessWidget {

   ListCastView({super.key,required this.name,required this.image});
dynamic image;
dynamic name;

  @override
  Widget build(BuildContext context) {
    return   ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {


        return     Container(
          padding: EdgeInsets.symmetric(horizontal: 5,vertical: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: ColorsApp.sceondry),
          child: Row(children: [
            ClipRRect(

              child: Image.network(image,width: 90,height: 90,),
              borderRadius: BorderRadius.circular(16),),
            Column(children: [Text('$name',style: StyleApp.mdText.copyWith(fontSize: 15.r),softWrap: true ,overflow: TextOverflow.ellipsis,),
             ],)
          ],),);
      }, separatorBuilder: (BuildContext context, int index) {return SizedBox(height: 15,);  }, itemCount: 3,

    );
  }
}