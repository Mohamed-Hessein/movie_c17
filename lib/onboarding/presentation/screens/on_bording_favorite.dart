import 'package:flutter/material.dart';

import '../../../core/resources/colors_app.dart';
import '../../../core/resources/image&icon.dart';
import '../../../core/resources/style_app.dart';

class FavoritePage extends StatelessWidget {
  final VoidCallback onNext;
  const FavoritePage({super.key, required this.onNext});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.background,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              ImageApp.onboardingfav,
              fit: BoxFit.cover,
            ),
          ),

          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.2),
                    Colors.black.withOpacity(0.3),
                    Colors.black.withOpacity(0.2),
                    Colors.black.withOpacity(0.2),
                    Colors.black,
                  ],
                ),
              ),
            ),
          ),

          // 3. Content - Text and Button aligned at the bottom
          Positioned(
            left: 20,
            right: 20,
            bottom: 40,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Find Your Next\nFavorite Movie Here",
                  textAlign: TextAlign.center,
                  style: StyleApp.lgText.copyWith(
                    fontSize: 34,
                    height: 1.2,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  "Get access to a huge library of movies\nto suit all tastes. You will surely like it.",
                  textAlign: TextAlign.center,
                  style: StyleApp.smText.copyWith(
                    color: ColorsApp.textSecondary,
                    fontSize: 16,
                    height: 1.1,
                  ),
                ),
                SizedBox(height: 27),
                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: onNext,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorsApp.secondaryGold,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 0,
                    ),
                    child: Text(
                      "Explore Now",
                      style: StyleApp.mdText.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 21,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}