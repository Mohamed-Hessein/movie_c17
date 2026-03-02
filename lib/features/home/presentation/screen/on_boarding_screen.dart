import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resources/auto_route.dart';
import '../../../../core/resources/colors_app.dart';
import '../../../../core/resources/image&icon.dart';
import '../../../../core/resources/style_app.dart';
import '../../../details/presentation/screen/on_bording_rate.dart';
import '../../../details/presentation/screen/onboarding/on_bording_create.dart';
import '../../../details/presentation/screen/onboarding/on_bording_discover.dart';
import '../../../details/presentation/screen/onboarding/on_bording_explore.dart';
import '../../../details/presentation/screen/onboarding/on_bording_favorite.dart';
import '../../../details/presentation/screen/onboarding/on_bording_finish.dart';
import '../widget/on_boarding_page.dart';

@RoutePage()
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});
  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;



  void _nextPage() {
    if (_currentPage < 6- 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      context.router.replace( HomeRoute());
    }
  }

  void _previousPage() {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      FavoritePage(onNext: _nextPage),
      const DiscoverPage(),
      const ExplorePage(),
      const CreatePage(),
      const RatePage(),
      const FinishPage(),
    ];
    return Scaffold(
      backgroundColor: ColorsApp.background,
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            children: pages,
          ),
          if(_currentPage > 0)
          Positioned(
            bottom: 40,
            left: 16,
            right: 16,
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: _nextPage,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorsApp.primaryGold,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      elevation: 0,
                    ),
                    child: Text(
                      _currentPage == 0
                          ? 'Explore Now'
                          : _currentPage == pages.length - 1
                          ? 'Finish'
                          : 'Next',
                      style: StyleApp.mdText.copyWith(
                        color: ColorsApp.background,
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                if (_currentPage >= 2) ...[
                  SizedBox(height: 14),
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: OutlinedButton(
                      onPressed: _previousPage,
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(
                          color: ColorsApp.primaryGold,
                          width: 2,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: Text(
                        'Back',
                        style: StyleApp.mdText.copyWith(

                          color: ColorsApp.primaryGold,
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}