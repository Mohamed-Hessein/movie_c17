import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_c17_me/features/search/data/model/search_model.dart';

import '../../domain/usercase/browser_usecase.dart';
import 'browser_event.dart';
import 'browser_state.dart';
@injectable
class BrowserBloc extends Bloc<BrowserEvent, BrowserState> {
  BrowserUsecase browserUsecase;
  BrowserBloc(this.browserUsecase):super(BrowserState()){
    on<getBrowserChips>((evet, emit)async{

  try{
    emit(state.copyWith(browserStatus: RequestStatus.loading));
  final res = await  browserUsecase.call();
    emit(state.copyWith(browserStatus: RequestStatus.success,browsermodel: res));

  }catch(e){
    emit(state.copyWith(browserStatus: RequestStatus.error,errorMassage: e.toString()));
    print(e.toString());
  }
    });


    on<FilterByGenreEvent>((event, emit) {
      final allMovies = state.browsermodel?.data?.movies ?? [];
      final filtered = allMovies
          .where((movie) => movie.genres != null && movie.genres!.contains(event.selectedGenre))
          .toList();

      emit(state.copyWith(displayedMovies: filtered));

    });
  }}