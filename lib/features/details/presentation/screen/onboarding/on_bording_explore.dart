import 'package:flutter/material.dart';
import 'package:movie/core/resources/colors_app.dart';
import 'package:movie/core/resources/style_app.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(

      children: [
        Image.asset('assets/images/onboardingexplore.png', fit: BoxFit.cover),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                Color(0xFF85210E).withOpacity(0.3),
                Colors.black.withOpacity(0.9),
                Colors.black,
              ],

            ),
          ),
        ),
        Positioned(
          bottom: 140,
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
                Text('Explore All Genres',
                    style: StyleApp.lgText.copyWith(fontSize: 23,
                        fontWeight: FontWeight.w700),
                    textAlign: TextAlign.center),
                SizedBox(height: 15),
                Text('Discover movies from every genre, in all available qualities. Find something new and exciting to watch every day.',
                    style: StyleApp.smText.copyWith(fontSize: 18,
                        color: ColorsApp.textSecondary,
                        height: 1.5),
                    textAlign: TextAlign.center),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
