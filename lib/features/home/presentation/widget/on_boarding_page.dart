import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/colors_app.dart';
import '../../../../core/resources/style_app.dart';

class OnboardingPage extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  const OnboardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        // Background Image (Full Screen)
        Image.asset(
          image,
          fit: BoxFit.cover,
        ),

        // Gradient Overlay
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                Colors.black.withOpacity(0.2),
                Colors.black.withOpacity(0.1),
                Colors.black,
              ],
              stops: const [0.0, 0.4, 0.7, 1.0],
            ),
          ),
        ),

        // Text Content at Bottom
        Positioned(
          bottom: 150,
          left: 0,
          right: 0,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            decoration: BoxDecoration(

              borderRadius: BorderRadius.circular(24),
            ),
            margin: EdgeInsets.symmetric(horizontal: 16.w),

            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Title
                Text(
                  title,
                  style: StyleApp.lgText.copyWith(
                    fontSize: 32,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),

                SizedBox(height: 20),

                // Description
                Text(
                  description,
                  style: StyleApp.smText.copyWith(
                    fontSize: 16,
                    color: ColorsApp.textSecondary,
                    height: 1.5,
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