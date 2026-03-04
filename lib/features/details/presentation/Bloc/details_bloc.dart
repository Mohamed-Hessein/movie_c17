import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_c17_me/features/details/presentation/Bloc/details_events.dart';
import 'package:movie_c17_me/features/details/presentation/Bloc/details_state.dart';
import 'package:movie_c17_me/features/home/presentation/bloc/home_event.dart';

import '../../domain/usecase/details_use_case.dart';
import '../../domain/usecase/suggestion_usercase.dart';
@injectable
class DetailsBloc  extends Bloc<DetailsEvents, DetailsState>{

  DetailsUseCase detailsUseCase;
  SuggestionUsercase suggestionUsercase;
  DetailsBloc(this.detailsUseCase, this.suggestionUsercase) : super(DetailsState()){
on<getDetails>((event, emit)async{
  emit(state.copyWith(getDetailsStatus: RequestStatus.loading));

  try{

    var res = await detailsUseCase.call(event.id); // لو call async
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

    var res = await suggestionUsercase.call(event.id); // لو call async
    emit(state.copyWith(
        getDetailsStatus: RequestStatus.success,
        suggestions: res
    ));

  }catch(e){
    emit(state.copyWith(getDetailsStatus: RequestStatus.error,errorMassage: e.toString()));

  }
  });


  }

}