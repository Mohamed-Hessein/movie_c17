import 'package:injectable/injectable.dart';
import 'package:movie_c17_me/features/home/data/data_source/local/movie_local_ds.dart';
import 'package:movie_c17_me/features/home/domain/repo/movie_local_repo.dart';

import '../model/MoviseResponse.dart';

@Injectable(as: MovieLocalRepo)
class MovieLocalRepoImpl implements MovieLocalRepo{
  MovieLocalDs movieLocalDs;
  MovieLocalRepoImpl(this.movieLocalDs);

  @override
  Future<MoviesResponse?> getMovies()async {
    try{
      MoviesResponse? response =await movieLocalDs.getMovies();
      return response;
    }catch(e){
      rethrow;
    }
  }}