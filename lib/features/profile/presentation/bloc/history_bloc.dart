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
    on<HistorySave>((event, emit) async{
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


      List<detailsOfMovie> movies = [] ;

        List<detailsOfMovie> film = await Future.wait(history.docs.map((e) async =>detailsUseCase.call(e.data().ids)).toList());


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
}