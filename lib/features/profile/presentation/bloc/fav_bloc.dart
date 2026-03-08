import 'dart:math';

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
    on<AddToFav>((event, emit){
 try{
   emit(state.copyWith(getMoviesStatus:  RequestStatus.loading));

   emit(state.copyWith(getMoviesStatus:  RequestStatus.success, ));

 }catch(e){
   emit(state.copyWith(getMoviesStatus:  RequestStatus.error,errorMassage: e.toString() ));
 }
    });
    on<getFav>((event, emit) async {
      try {
        emit(state.copyWith(getMoviesStatus: RequestStatus.loading));



        await for (var snapshot in favUsecase.call(true)) {
         for (var doc in snapshot.docs) {
           final lastSeen = doc.data();

            final details = await detailsUseCase.call(lastSeen.ids);
            movies.add(details);
          }
       }

        emit(state.copyWith(
          getMoviesStatus: RequestStatus.success,
          lastSeenMovie: movies,
        ));
      } catch (e) {
        emit(state.copyWith(getMoviesStatus: RequestStatus.error, errorMassage: e.toString()));
      }
    });
  }
}