import 'package:movie_c17_me/features/home/data/model/MoviseResponse.dart';
import 'package:movie_c17_me/features/profile/data/data_sourc/model/history_model.dart';

import '../../../details/data/model/details_model.dart';

enum RequestStatus{
  init,
  loading,
  success,
  error,
}

class HsitoryState {
  RequestStatus? getMoviesStatus;
  MoviesResponse? moviesResponse;

  String? errorMassage;
  List<detailsOfMovie>? lastSeenMovie;
  HsitoryState({
    this.getMoviesStatus = RequestStatus.init,

    this.moviesResponse,
    this.errorMassage,
   this.lastSeenMovie});

  HsitoryState copyWith({
    RequestStatus? getMoviesStatus,
    MoviesResponse? moviesResponse,
    String? errorMassage,
    List<detailsOfMovie>?  lastSeenMovie}){
    return HsitoryState(
      getMoviesStatus: getMoviesStatus ?? this.getMoviesStatus,
      moviesResponse: moviesResponse ?? this.moviesResponse,
      errorMassage: errorMassage ?? this.errorMassage,
      lastSeenMovie:  lastSeenMovie ?? this.lastSeenMovie,

    );
  }
}