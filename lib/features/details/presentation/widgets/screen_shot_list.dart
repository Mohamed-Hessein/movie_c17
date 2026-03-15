
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/image&icon.dart';

class ScreenShotList extends StatelessWidget {
   ScreenShotList({super.key,required this.image});
dynamic image;

  @override
  Widget build(BuildContext context) {
    return   SizedBox(

      child: ListView.separated(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index){

            return   ClipRRect(borderRadius: BorderRadius.circular(16),child: Image.network(image??'',fit: BoxFit.cover,),);

          }, separatorBuilder: (constext, index){return SizedBox(height: 15,);}, itemCount: 3),
    );
  }
}
