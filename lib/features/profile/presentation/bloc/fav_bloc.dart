import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_c17_me/features/details/data/model/details_model.dart';
import 'package:movie_c17_me/features/details/domain/usecase/details_use_case.dart';
import 'package:movie_c17_me/features/profile/data/data_sourc/model/history_model.dart';
import 'package:movie_c17_me/features/profile/domain/usecase/fav_usecase.dart';
import 'package:movie_c17_me/features/profile/domain/usecase/set_fav_usecase.dart';
import 'package:movie_c17_me/features/profile/presentation/bloc/fav_event.dart';
import 'package:movie_c17_me/features/profile/presentation/bloc/fav_state.dart';
@injectable
class FavBloc extends Bloc<FavEvent, FavState> {
  List<detailsOfMovie> movies = [];
  SetFavUsecase setFavUsecase;
  DetailsUseCase detailsUseCase;
  FavUsecase favUsecase;
  FavBloc(this.setFavUsecase,this.detailsUseCase, this.favUsecase) : super(FavState()){
    _subscribeToFavStream();

    on<AddToFav>((event, emit) async {
      try {
        emit(state.copyWith(getMoviesStatus: RequestStatus.loading));


        final details = await detailsUseCase.call(event.id.toString());
        if(details != null){
          emit(state.copyWith(
            lastSeenMovie: [...?state.lastSeenMovie, details],
            getMoviesStatus: RequestStatus.success,
          ));
        }

        await setFavUsecase.call(event.id, model: LastSeenMovie(
          id: FirebaseAuth.instance.currentUser!.uid,
          ids: event.id,
        ));

      } catch (e) {
        emit(state.copyWith(getMoviesStatus: RequestStatus.error, errorMassage: e.toString()));
      }
    });
  }

  void _subscribeToFavStream() {
    favUsecase.call(true).listen((snapshot) async {
      List<detailsOfMovie> movies = [];
      for (var doc in snapshot.docs) {
        final lastSeen = doc.data();
        final details = await detailsUseCase.call(lastSeen.ids);
        if(details != null) movies.add(details);
      }

      emit(state.copyWith(
        lastSeenMovie: movies,
        getMoviesStatus: RequestStatus.success,
      ));
    });

    on<getFav>((event, emit) async {
      try {
        emit(state.copyWith(getMoviesStatus: RequestStatus.loading));

        movies.clear();

        final snapshot = await favUsecase.call(true).first;

        for (var doc in snapshot.docs) {
          final lastSeen = doc.data();
          final details = await detailsUseCase.call(lastSeen.ids);
          movies.add(details);
        }

        emit(state.copyWith(
          getMoviesStatus: RequestStatus.success,
          lastSeenMovie: movies,
        ));
      } catch (e) {
        emit(state.copyWith(
          getMoviesStatus: RequestStatus.error,
          errorMassage: e.toString(),
        ));
      }
    });
  }
}