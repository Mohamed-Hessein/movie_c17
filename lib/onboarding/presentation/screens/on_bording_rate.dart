
import 'package:flutter/material.dart';

import '../../../core/resources/colors_app.dart';
import '../../../core/resources/style_app.dart';

class RatePage extends StatelessWidget {
  const RatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(

      children: [
        Image.asset('assets/images/onboardingrate.png',
            fit: BoxFit.cover),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                Color(0xFF601321).withOpacity(0.8),
                Colors.black.withOpacity(0.9),
                Colors.black,
              ],
              stops: const [0.0, 0.5, 0.7, 1.0],
            ),
          ),
        ),
        Positioned(
          bottom: 170,
          left: 0,
          right: 0,
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFF121312),
              borderRadius: BorderRadius.circular(40),
            ),
            margin: EdgeInsets.only(right: 0,left: 0,bottom: 0,top: 0),
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Rate, Review, and Learn',
                    style: StyleApp.lgText.copyWith(fontSize: 24,
                        fontWeight: FontWeight.w700),
                    textAlign: TextAlign.center),
                SizedBox(height: 15),
                Text('Share your thoughts on the movies you\'ve watched. Dive deep into film details and help others discover great movies with your reviews.',
                    style: StyleApp.smText.copyWith(fontSize: 19,
                        fontWeight: FontWeight.w400,
                        color: ColorsApp.textSecondary, height: 1.4),
                    textAlign: TextAlign.center),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
