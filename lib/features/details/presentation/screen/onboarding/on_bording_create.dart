import 'package:flutter/material.dart';
import 'package:movie/core/resources/colors_app.dart';
import 'package:movie/core/resources/style_app.dart';

class CreatePage extends StatelessWidget {
  const CreatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset('assets/images/onboardingcreate.png', fit: BoxFit.cover),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
               Color(0xFF4C2471).withOpacity(0.3),
                Colors.black.withOpacity(0.9),
                Colors.black,
              ],
              stops: const [0.0, 0.3, 0.7, 1.0],
            ),
          ),
        ),
        Positioned(
          bottom: 160,
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
                Text('Create Watchlists',
                    style: StyleApp.lgText.copyWith(fontSize: 24,
                        fontWeight: FontWeight.w700),
                    textAlign: TextAlign.center),
                SizedBox(height: 15),
                Text('Save movies to your watchlist to keep track of what you want to watch next. Enjoy films in various qualities and genres.',
                    style: StyleApp.smText.copyWith(fontSize: 18,
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