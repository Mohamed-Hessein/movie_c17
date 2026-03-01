
import '../../model/MoviseResponse.dart';

abstract class MoviesRemoteDs {
  Future<MoviesResponse> getMovies(String sortBy);


}