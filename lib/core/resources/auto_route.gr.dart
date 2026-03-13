// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'auto_route.dart';

/// generated route for
/// [ForgetPasswordScreen]
class ForgetPasswordRoute extends PageRouteInfo<void> {
  const ForgetPasswordRoute({List<PageRouteInfo>? children})
    : super(ForgetPasswordRoute.name, initialChildren: children);

  static const String name = 'ForgetPasswordRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ForgetPasswordScreen();
    },
  );
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<HomeRouteArgs> {
  HomeRoute({Key? key, List<PageRouteInfo>? children})
    : super(
        HomeRoute.name,
        args: HomeRouteArgs(key: key),
        initialChildren: children,
      );

  static const String name = 'HomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<HomeRouteArgs>(
        orElse: () => const HomeRouteArgs(),
      );
      return HomeScreen(key: args.key);
    },
  );
}

class HomeRouteArgs {
  const HomeRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'HomeRouteArgs{key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! HomeRouteArgs) return false;
    return key == other.key;
  }

  @override
  int get hashCode => key.hashCode;
}

/// generated route for
/// [LoginScreen]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const LoginScreen();
    },
  );
}

/// generated route for
/// [MovieDetailsScreen]
class MovieDetailsRoute extends PageRouteInfo<MovieDetailsRouteArgs> {
  MovieDetailsRoute({
    Key? key,
    required Movies movies,
    List<PageRouteInfo>? children,
  }) : super(
         MovieDetailsRoute.name,
         args: MovieDetailsRouteArgs(key: key, movies: movies),
         initialChildren: children,
       );

  static const String name = 'MovieDetailsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<MovieDetailsRouteArgs>();
      return MovieDetailsScreen(key: args.key, movies: args.movies);
    },
  );
}

class MovieDetailsRouteArgs {
  const MovieDetailsRouteArgs({this.key, required this.movies});

  final Key? key;

  final Movies movies;

  @override
  String toString() {
    return 'MovieDetailsRouteArgs{key: $key, movies: $movies}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! MovieDetailsRouteArgs) return false;
    return key == other.key && movies == other.movies;
  }

  @override
  int get hashCode => key.hashCode ^ movies.hashCode;
}

/// generated route for
/// [OnboardingScreen]
class OnboardingRoute extends PageRouteInfo<void> {
  const OnboardingRoute({List<PageRouteInfo>? children})
    : super(OnboardingRoute.name, initialChildren: children);

  static const String name = 'OnboardingRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const OnboardingScreen();
    },
  );
}

/// generated route for
/// [ProfileScreen]
class ProfileRoute extends PageRouteInfo<ProfileRouteArgs> {
  ProfileRoute({
    Key? key,
    required UserModel user,
    List<PageRouteInfo>? children,
  }) : super(
         ProfileRoute.name,
         args: ProfileRouteArgs(key: key, user: user),
         initialChildren: children,
       );

  static const String name = 'ProfileRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ProfileRouteArgs>();
      return ProfileScreen(key: args.key, user: args.user);
    },
  );
}

class ProfileRouteArgs {
  const ProfileRouteArgs({this.key, required this.user});

  final Key? key;

  final UserModel user;

  @override
  String toString() {
    return 'ProfileRouteArgs{key: $key, user: $user}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ProfileRouteArgs) return false;
    return key == other.key && user == other.user;
  }

  @override
  int get hashCode => key.hashCode ^ user.hashCode;
}

/// generated route for
/// [RegisterScreen]
class RegisterRoute extends PageRouteInfo<void> {
  const RegisterRoute({List<PageRouteInfo>? children})
    : super(RegisterRoute.name, initialChildren: children);

  static const String name = 'RegisterRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const RegisterScreen();
    },
  );
}

/// generated route for
/// [StartScreen]
class StartRoute extends PageRouteInfo<void> {
  const StartRoute({List<PageRouteInfo>? children})
    : super(StartRoute.name, initialChildren: children);

  static const String name = 'StartRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const StartScreen();
    },
  );
}
