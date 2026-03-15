import 'package:movie_c17_me/features/home/data/model/MoviseResponse.dart';

enum RequestStatus{
  init,
  loading,
  success,
  error,
}

class HomeState {
  RequestStatus? getMoviesStatus;
  MoviesResponse? moviesResponse;
  String? errorMassage;
  MoviesResponse? latestMoviesResponse;
  MoviesResponse? popularMoviesResponse;
  int? currentIndex;
  String? currentBackground;
  HomeState({
    this.getMoviesStatus = RequestStatus.init,
    this.latestMoviesResponse,
    this.popularMoviesResponse,
    this.moviesResponse,

    this.errorMassage,
    this.currentBackground,
    this.currentIndex = 0});

  HomeState copyWith({ int? currentIndex,

    RequestStatus? getMoviesStatus,
    MoviesResponse? moviesResponse,
    String? errorMassage,  MoviesResponse? latestMoviesResponse,
    MoviesResponse? popularMoviesResponse,

    String? currentBackground,}){
    return HomeState(
      currentIndex: currentIndex ?? this.currentIndex,
      getMoviesStatus: getMoviesStatus ?? this.getMoviesStatus,
      moviesResponse: moviesResponse ?? this.moviesResponse,
      errorMassage: errorMassage ?? this.errorMassage,
      latestMoviesResponse: latestMoviesResponse ?? this.latestMoviesResponse,
      popularMoviesResponse: popularMoviesResponse ?? this.popularMoviesResponse,
      currentBackground: currentBackground ?? this.currentBackground,
    );
  }
}