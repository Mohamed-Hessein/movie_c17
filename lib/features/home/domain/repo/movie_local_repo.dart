
import '../../data/model/MoviseResponse.dart';

abstract class MovieLocalRepo{
  Future<MoviesResponse?>getMovies();
}
