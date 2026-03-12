import 'package:movie_c17_me/features/details/data/model/details_model.dart';
import 'package:movie_c17_me/features/details/data/model/suggestion_model.dart' hide Movies;
import 'package:movie_c17_me/features/home/data/model/MoviseResponse.dart' hide Movies;

import '../../../details/data/model/suggestion_model.dart' hide Movies;
import '../../../search/data/model/search_model.dart';

enum RequestStatus{
  init,
  loading,
  success,
  error,
}

class BrowserState {
  RequestStatus?browserStatus;
  SearchModel ? browsermodel;
  String? errorMassage;
  List<Movies>? displayedMovies;
  Suggestions? suggestions;


  BrowserState({
this.displayedMovies,
    this.browserStatus = RequestStatus.init,
    this.suggestions ,
    this.browsermodel,
    this.errorMassage,
  });

  BrowserState copyWith({
    Suggestions ?suggestions,
    RequestStatus? browserStatus,
    SearchModel? browsermodel,
    String? errorMassage,
    List<Movies>? displayedMovies,
    String? currentBackground,}){
    return BrowserState(
      displayedMovies: displayedMovies ?? this.displayedMovies,
      suggestions: suggestions ?? this.suggestions,
      browserStatus: browserStatus ?? this.browserStatus,
      browsermodel:  browsermodel ?? this.browsermodel,
      errorMassage: errorMassage ?? this.errorMassage,

    );
  }
}