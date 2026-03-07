import 'package:flutter/material.dart';

import '../../../core/resources/style_app.dart';

class FinishPage extends StatelessWidget {
  const FinishPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(

      children: [
        Image.asset('assets/images/onboardingfinish.png', fit: BoxFit.cover),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                Color(0xFF2A2C30).withOpacity(0.8),
                Color(0xFF2A2C30).withOpacity(0.9),
                Colors.black,
              ],
              stops: const [0.0, 0.4, 0.6, 1.0],
            ),
          ),
        ),
        Positioned(
          bottom: 155,
          left: 0,
          right: 0,
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFF121312),
              borderRadius: BorderRadius.circular(40),
            ),
            margin: EdgeInsets.only(left: 0,right: 0,bottom: 5,top: 0),
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Start Watching Now',
                    style: StyleApp.lgText.copyWith(fontSize: 25,
                        fontWeight: FontWeight.w700),
                    textAlign: TextAlign.center),
              ],
            ),
          ),
        ),
      ],
    );
  }
}