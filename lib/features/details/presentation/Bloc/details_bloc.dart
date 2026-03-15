import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_c17_me/di.dart';
import 'package:movie_c17_me/features/details/domain/usecase/datails_local_usecase.dart';
import 'package:movie_c17_me/features/details/domain/usecase/suggestion_local_usecase.dart';
import 'package:movie_c17_me/features/details/presentation/Bloc/details_events.dart';
import 'package:movie_c17_me/features/details/presentation/Bloc/details_state.dart';
import 'package:movie_c17_me/features/home/presentation/bloc/home_event.dart';
import 'package:movie_c17_me/features/profile/data/data_sourc/model/history_model.dart';
import 'package:movie_c17_me/features/profile/domain/usecase/fav_usecase.dart';
import 'package:movie_c17_me/features/profile/domain/usecase/update_fav.dart';
import 'package:movie_c17_me/features/profile/presentation/bloc/fav_event.dart' hide AddToFav;
import 'package:movie_c17_me/features/profile/presentation/bloc/history_bloc.dart';
import 'package:movie_c17_me/features/profile/presentation/bloc/history_event.dart';

import '../../../profile/domain/usecase/set_fav_usecase.dart';
import '../../data/model/details_model.dart';
import '../../domain/usecase/details_use_case.dart';
import '../../domain/usecase/suggestion_usercase.dart';
@injectable
class DetailsBloc  extends Bloc<DetailsEvents, DetailsState>{
  UpdateFavUseCase updateFavUseCase;
DatailsLocalUsecase datailsLocalUsecase;
SuggestionLocalUsecase suggestionLocalUsecase;
  DetailsUseCase detailsUseCase;
  FavUsecase favUsecase;
  SuggestionUsercase suggestionUsercase;  SetFavUsecase setFavUsecase;
  DetailsBloc(this.datailsLocalUsecase, this.suggestionLocalUsecase,this.favUsecase,this.updateFavUseCase, this.detailsUseCase, this.suggestionUsercase, this.setFavUsecase) : super(DetailsState()){
    subscribeToFavs();
on<getDetails>((event, emit)async{
  emit(state.copyWith(getDetailsStatus: RequestStatus.loading));
getIt<HistoryBloc>().add(HistorySave(event.id));

  try{

    var res = await detailsUseCase.call(event.id);
    emit(state.copyWith(
        getDetailsStatus: RequestStatus.success,
        detailsOfMovies: res
    ));
await datailsLocalUsecase.saveDetails(state.detailsOfMovies!);
  }catch(_){
    var resLocal = await datailsLocalUsecase.call(event.id);
    emit(state.copyWith(getDetailsStatus: RequestStatus.success,detailsOfMovies: resLocal));

  }
  });
  on<getSuggest>((event, emit)async{ emit(state.copyWith(getDetailsStatus: RequestStatus.loading));

  try{

    var res = await suggestionUsercase.call(event.id);
    emit(state.copyWith(
        getDetailsStatus: RequestStatus.success,
        suggestions: res
    ));
    await suggestionLocalUsecase.saveDetails(state.suggestions!);
  }catch(_){
    var resLocal = await suggestionLocalUsecase.call(event.id);
    emit(state.copyWith(getDetailsStatus: RequestStatus.success,suggestions: resLocal));

  }
  });

on<AddToFav>((event, emit) async {
  try {
    emit(state.copyWith(getDetailsStatus: RequestStatus.loading));

   
    await updateFavUseCase.call(LastSeenMovie(
      id: FirebaseAuth.instance.currentUser!.uid,
      ids: event.id.toString(),
      isfav: true,
    ));


    await for (var snapshot in favUsecase.call(true)) {
      List<detailsOfMovie> movies = [];
      for (var doc in snapshot.docs) {
        final lastSeen = doc.data();
        final details = await detailsUseCase.call(lastSeen.ids);
        movies.add(details);
      }

      emit(state.copyWith(
        getDetailsStatus: RequestStatus.success,
        lastSeenMovie: movies,
      ));

      break;
    }

  } catch (e) {
    emit(state.copyWith(
      getDetailsStatus: RequestStatus.error,
      errorMassage: e.toString(),
    ));
  }

});


}
  void subscribeToFavs() {
    favUsecase.call(true).listen((snapshot) async {  print('Firestore docs: ${snapshot.docs.length}');

      List<detailsOfMovie> movies = [];
      for (var doc in snapshot.docs) {
        final lastSeen = doc.data();
        final details = await detailsUseCase.call(lastSeen.ids);
        movies.add(details);
      }

      emit(state.copyWith(
        getDetailsStatus: RequestStatus.success,
        lastSeenMovie: movies,
      ));
    });
  }
}