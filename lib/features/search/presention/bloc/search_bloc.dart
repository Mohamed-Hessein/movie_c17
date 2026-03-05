import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_c17_me/features/search/domain/usecase/search_usecase.dart';
import 'package:movie_c17_me/features/search/presention/bloc/saerch_event.dart';
import 'package:movie_c17_me/features/search/presention/bloc/search_state.dart';
@injectable
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchUsecase searchUsecase;
  SearchBloc(this.searchUsecase): super(SearchState()){
    on<getSearchEvent> ((evet, emit)async{
      emit(state.copyWith(SearchStatus: RequestStatus.loading));
try{

  final res= await searchUsecase.call(evet.title);
emit(state.copyWith(SearchStatus: RequestStatus.success,searchModel: res));

}catch(e){
  emit(state.copyWith(SearchStatus: RequestStatus.error,    errorMassage: e.toString(), ));
}
    });
  }
}