import 'package:injectable/injectable.dart';


import '../../domain/repo/move_repo.dart';
import '../data_source/remot/movies_ds.dart';
import '../model/MoviseResponse.dart';

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