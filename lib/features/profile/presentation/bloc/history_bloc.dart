import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_c17_me/features/details/data/model/details_model.dart';
import 'package:movie_c17_me/features/details/domain/usecase/details_use_case.dart';
import 'package:movie_c17_me/features/profile/data/data_sourc/model/history_model.dart';
import 'package:movie_c17_me/features/profile/domain/usecase/get_history_usecase.dart';
import 'package:movie_c17_me/features/profile/domain/usecase/history_usecase.dart';
import 'package:movie_c17_me/features/profile/presentation/bloc/history_event.dart';

import 'hsitory_state.dart';
@injectable
class HistoryBloc  extends Bloc<HistoryEvent, HsitoryState>{
  HistoryUsecase historyUsecase;
  GetHistoryUsecase getHistoryUsecase;
  DetailsUseCase detailsUseCase;

  HistoryBloc(this.historyUsecase,this.getHistoryUsecase, this.detailsUseCase) : super(HsitoryState()){


    _subscribeToFavStream(); on<HistorySave>((event, emit) async{
  try{
    emit(state.copyWith(getMoviesStatus:  RequestStatus.loading));
    var history = await historyUsecase.call(event.id);
    emit(state.copyWith(getMoviesStatus:  RequestStatus.success));

  } catch(e){
    emit(state.copyWith(getMoviesStatus:  RequestStatus.error,errorMassage: e.toString()));
  }
    });
    on<HistoryGet>((event, emit) async{
      try{
        emit(state.copyWith(getMoviesStatus:  RequestStatus.loading));
        QuerySnapshot<LastSeenMovie> history = await getHistoryUsecase.call().first;
        var historyStream = getHistoryUsecase.call();
        var historySnapshot = await historyStream.first;
        print('History docs length: ${historySnapshot.docs.length}');

        List<detailsOfMovie> film = await Future.wait(
            history.docs.map((e) async {
              var movieFromHome = await detailsUseCase.call(e.data().ids);
              print('l;;epg46i[ui65 ${e.data().id}');

              return detailsOfMovie(
                data: Data(
                  movie: Movie(
                    id: movieFromHome.data?.movie?.id,
                    title: movieFromHome.data?.movie?.title,
                    largeCoverImage: movieFromHome.data?.movie?.largeCoverImage,
                    rating: movieFromHome.data?.movie?.rating,

                  ),
                ),
              );
            }).toList()
        );

      emit(

      state.copyWith(

              getMoviesStatus: RequestStatus.success,
              lastSeenMovie:  film,
            ));
      } catch(e){
        emit(state.copyWith(getMoviesStatus:  RequestStatus.error,errorMassage: e.toString()));
      }
    });

  }
 void _subscribeToFavStream() {
   getHistoryUsecase.call().listen((snapshot) async {
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

}}