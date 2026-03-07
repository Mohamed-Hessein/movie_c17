import 'package:flutter/material.dart';

import '../../../core/resources/colors_app.dart';
import '../../../core/resources/style_app.dart';

class DiscoverPage extends StatelessWidget {
  const DiscoverPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(

      children: [

        Image.asset(
          'assets/images/onboardingdisc.png',
          fit: BoxFit.cover,
        ),


        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                Color(0xFF084250).withOpacity(0.8),
                Color(0xFF084250).withOpacity(0.3),
                Colors.black,
              ],
            ),
          ),
        ),


        Positioned(
          bottom: 80,
          left: 0,
          right: 0,
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFF121312),
              borderRadius: BorderRadius.circular(40),
            ),
            margin: EdgeInsets.only(right: 0,left: 0,bottom: 10,top: 5),
            padding: EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Discover Movies',
                  style: StyleApp.lgText.copyWith(
                    fontSize: 24,

                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Text(
                  'Explore a vast collection of movies in all qualities and genres. Find your next favorite film with ease.',
                  style: StyleApp.smText.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: ColorsApp.textSecondary,
                    height: 1.4,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}