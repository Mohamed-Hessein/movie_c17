import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_c17_me/di.dart';
import 'package:movie_c17_me/features/home/domain/usecase/movie_local_usecase.dart';
import 'package:movie_c17_me/features/home/domain/usecase/movies_use_case.dart';
import 'package:movie_c17_me/features/home/presentation/bloc/home_event.dart';
import 'package:movie_c17_me/features/home/presentation/bloc/home_state.dart';

import '../../../../core/resources/internet_checker.dart';
import '../../data/model/MoviseResponse.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  MoviesUseCase moviesUseCase;
  MovieLocalUsecase
  movieLocalUsecase;
  HomeBloc(this.moviesUseCase,this.movieLocalUsecase) : super(HomeState()){
    on<ChangeSelectedBottomNavBar>((event, emit) {
      emit(state.copyWith(  currentIndex: event.index));
    });
    on<ChangeBackgroundEvent>((event, emit) {
      emit(state.copyWith(currentBackground: event.imageUrl));
    });
    on<GetMovies>((event, emit) async {
      emit(state.copyWith(getMoviesStatus: RequestStatus.loading));

      try {
        final results = await Future.wait([
          moviesUseCase.call("year"),
          moviesUseCase.call("download_count"),
        ]);
        if (results.any((r) => r == null )) {
          throw Exception("Remote data invalid");
        }
        final latestResponse = results[0];
        final popularResponse = results[1];


        emit(state.copyWith(
          getMoviesStatus: RequestStatus.success,
          latestMoviesResponse: latestResponse,
          popularMoviesResponse: popularResponse,
        ));


      await  movieLocalUsecase.saveMovies(latestResponse);

      } catch (_) {

        print("Remote failed: $e");
     final   latestResponse = await movieLocalUsecase.call() ;
        final popularResponse = latestResponse;
        emit(state.copyWith(
          getMoviesStatus: RequestStatus.success,
          latestMoviesResponse: latestResponse,
          popularMoviesResponse: popularResponse,
        ));

      }
    });






  }
 }