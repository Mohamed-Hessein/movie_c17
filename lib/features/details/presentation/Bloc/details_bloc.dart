import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_c17_me/di.dart';
import 'package:movie_c17_me/features/details/presentation/Bloc/details_events.dart';
import 'package:movie_c17_me/features/details/presentation/Bloc/details_state.dart';
import 'package:movie_c17_me/features/home/presentation/bloc/home_event.dart';
import 'package:movie_c17_me/features/profile/data/data_sourc/model/history_model.dart';
import 'package:movie_c17_me/features/profile/presentation/bloc/history_bloc.dart';
import 'package:movie_c17_me/features/profile/presentation/bloc/history_event.dart';

import '../../../profile/domain/usecase/set_fav_usecase.dart';
import '../../domain/usecase/details_use_case.dart';
import '../../domain/usecase/suggestion_usercase.dart';
@injectable
class DetailsBloc  extends Bloc<DetailsEvents, DetailsState>{

  DetailsUseCase detailsUseCase;
  SuggestionUsercase suggestionUsercase;  SetFavUsecase setFavUsecase;
  DetailsBloc(this.detailsUseCase, this.suggestionUsercase, this.setFavUsecase) : super(DetailsState()){
on<getDetails>((event, emit)async{
  emit(state.copyWith(getDetailsStatus: RequestStatus.loading));
getIt<HistoryBloc>().add(HistorySave(event.id));

  try{

    var res = await detailsUseCase.call(event.id);
    emit(state.copyWith(
        getDetailsStatus: RequestStatus.success,
        detailsOfMovies: res
    ));

  }catch(e){
    emit(state.copyWith(getDetailsStatus: RequestStatus.error,errorMassage: e.toString()));

  }
  });
  on<getSuggest>((event, emit)async{ emit(state.copyWith(getDetailsStatus: RequestStatus.loading));

  try{

    var res = await suggestionUsercase.call(event.id);
    emit(state.copyWith(
        getDetailsStatus: RequestStatus.success,
        suggestions: res
    ));

  }catch(e){
    emit(state.copyWith(getDetailsStatus: RequestStatus.error,errorMassage: e.toString()));

  }
  });

on<AddToFav>((event, emit)async{
  try{
    emit(state.copyWith(getDetailsStatus:  RequestStatus.loading));
 await   setFavUsecase.call(event.id,model: LastSeenMovie(id: event.id, ids: event.id,isfav: true));
    emit(state.copyWith(getDetailsStatus:  RequestStatus.success, ));

  }catch(e){
    emit(state.copyWith(getDetailsStatus:  RequestStatus.error,errorMassage: e.toString() ));
  }
});
  }

}