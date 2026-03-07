import 'package:movie_c17_me/features/details/data/model/details_model.dart';
import 'package:movie_c17_me/features/details/data/model/suggestion_model.dart';
import 'package:movie_c17_me/features/home/data/model/MoviseResponse.dart';

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
  Suggestions? suggestions;


  DetailsState({

    this.getDetailsStatus = RequestStatus.init,
    this.suggestions ,
this.detailsOfMovies,
    this.errorMassage,
 });

  DetailsState copyWith({
    Suggestions ?suggestions,
    RequestStatus? getDetailsStatus,
    detailsOfMovie? detailsOfMovies,
    String? errorMassage,
    String? currentBackground,}){
    return DetailsState(
      suggestions: suggestions ?? this.suggestions,
      getDetailsStatus: getDetailsStatus ?? this.getDetailsStatus,
      detailsOfMovies:  detailsOfMovies ?? this.detailsOfMovies,
      errorMassage: errorMassage ?? this.errorMassage,

    );
  }
}