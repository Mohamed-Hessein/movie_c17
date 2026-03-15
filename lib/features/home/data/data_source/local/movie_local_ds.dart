

import '../../model/MoviseResponse.dart';

abstract class MovieLocalDs {
  Future<MoviesResponse?> getMovies();

  Future<void> saveMovies(MoviesResponse movies);


}