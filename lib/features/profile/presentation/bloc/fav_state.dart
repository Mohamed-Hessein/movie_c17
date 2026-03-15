import 'package:movie_c17_me/features/home/data/model/MoviseResponse.dart';
import 'package:movie_c17_me/features/profile/data/data_sourc/model/history_model.dart';

import '../../../details/data/model/details_model.dart';

enum RequestStatus{
  init,
  loading,
  success,
  error,
}

class FavState {
  RequestStatus? getMoviesStatus;
  MoviesResponse? moviesResponse;

  String? errorMassage;
  List<detailsOfMovie>? lastSeenMovie;
  FavState({
    this.getMoviesStatus = RequestStatus.init,

    this.moviesResponse,
    this.errorMassage,
    this.lastSeenMovie});

  FavState copyWith({
    RequestStatus? getMoviesStatus,
    MoviesResponse? moviesResponse,
    String? errorMassage,
    List<detailsOfMovie>?  lastSeenMovie}){
    return FavState(
      getMoviesStatus: getMoviesStatus ?? this.getMoviesStatus,
      moviesResponse: moviesResponse ?? this.moviesResponse,
      errorMassage: errorMassage ?? this.errorMassage,
      lastSeenMovie:  lastSeenMovie ?? this.lastSeenMovie,

    );
  }
}