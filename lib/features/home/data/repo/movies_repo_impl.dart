import 'package:injectable/injectable.dart';
import 'package:movie_c17_me/features/home/data/data_source/remot/movies_ds.dart';
import 'package:movie_c17_me/features/home/data/model/MoviseResponse.dart';
import 'package:movie_c17_me/features/home/domain/repo/move_repo.dart';

@Injectable(as: MoviesRepo)
class MoviesRepoImpl implements MoviesRepo{
  MoviesRemoteDs moviesRemoteDs;
  MoviesRepoImpl(this.moviesRemoteDs);

  @override
  Future<MoviesResponse> getMovies(String sortBy)async {
    try{
      MoviesResponse response =await moviesRemoteDs.getMovies(sortBy);
      return response;
    }catch(e){
      rethrow;
    }
  }



}