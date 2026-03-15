import 'package:movie_c17_me/features/home/data/model/MoviseResponse.dart';
import 'package:movie_c17_me/features/search/data/model/search_model.dart';

enum RequestStatus{
  init,
  loading,
  success,
  error,
}

class SearchState {
  RequestStatus?   SearchStatus;
  SearchModel? searchModel;
  String? errorMassage;

  SearchState({
    this.SearchStatus = RequestStatus.init,
this.searchModel ,

    this.errorMassage,
 });

  SearchState copyWith({
    RequestStatus? SearchStatus,
    SearchModel? searchModel,
    String? errorMassage,
    String? currentBackground,}){
    return SearchState(
      SearchStatus: SearchStatus ?? this.SearchStatus,

      errorMassage: errorMassage ?? this.errorMassage,
     searchModel:  searchModel ?? this.searchModel,
    );
  }
}