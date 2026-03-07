import 'package:movie_c17_me/features/home/data/model/MoviseResponse.dart';

abstract class MoviesRemoteDs {
  Future<MoviesResponse> getMovies(String sortBy);


}