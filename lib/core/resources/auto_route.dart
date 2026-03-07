import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import '../../features/home/data/model/MoviseResponse.dart' show Movies;
import '../../onboarding/presentation/auth/forget_password_screen.dart';
import '../../onboarding/presentation/auth/login_screen.dart';
import '../../onboarding/presentation/auth/register_screen.dart';
import '../../features/details/presentation/screen/movie_details_screen.dart';
import '../../features/home/presentation/screen/home_screen.dart';
import '../../onboarding/presentation/screens/on_boarding_screen.dart';
part 'auto_route.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {

  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: OnboardingRoute.page, initial: true),
    AutoRoute(page: LoginRoute.page),
    AutoRoute(page: RegisterRoute.page),
    AutoRoute(page: ForgetPasswordRoute.page),
    AutoRoute(page: HomeRoute.page),
    AutoRoute(page: MovieDetailsRoute.page),
  ];
}