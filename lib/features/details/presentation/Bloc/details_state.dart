import 'package:movie_c17_me/features/details/data/model/details_model.dart';
import 'package:movie_c17_me/features/details/data/model/suggestion_model.dart';
import 'package:movie_c17_me/features/home/data/model/MoviseResponse.dart';
import 'package:movie_c17_me/features/profile/data/data_sourc/model/history_model.dart';

enum RequestStatus{
  init,
  loading,
  success,
  error,
}

class DetailsState {
  RequestStatus? getDetailsStatus;
  detailsOfMovie ? detailsOfMovies;
  String? errorMassage;
  List<detailsOfMovie> detailsOfMoviesList;
List<detailsOfMovie>? lastSeenMovie;
  Suggestions? suggestions;


  DetailsState({
    this.lastSeenMovie,
    this.detailsOfMoviesList = const [],
    this.getDetailsStatus = RequestStatus.init,
    this.suggestions ,
this.detailsOfMovies,
    this.errorMassage,
 });

  DetailsState copyWith({
    List<detailsOfMovie>? lastSeenMovie,
    Suggestions ?suggestions,
    RequestStatus? getDetailsStatus,
    List<detailsOfMovie>? detailsOfMoviesList,
    detailsOfMovie? detailsOfMovies,
    String? errorMassage,
    String? currentBackground,}){
    return DetailsState(
      lastSeenMovie:  lastSeenMovie ?? this.lastSeenMovie,
      detailsOfMoviesList: detailsOfMoviesList ?? this.detailsOfMoviesList,
      suggestions: suggestions ?? this.suggestions,
      getDetailsStatus: getDetailsStatus ?? this.getDetailsStatus,
      detailsOfMovies:  detailsOfMovies ?? this.detailsOfMovies,
      errorMassage: errorMassage ?? this.errorMassage,

    );
  }
}