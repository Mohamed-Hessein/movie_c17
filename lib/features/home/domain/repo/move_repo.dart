import 'package:movie_c17_me/features/home/data/model/MoviseResponse.dart';

abstract class MoviesRepo{
 Future<MoviesResponse>getMovies(String sortBy);
}
