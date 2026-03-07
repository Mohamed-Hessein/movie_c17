import 'package:injectable/injectable.dart';
import 'package:movie_c17_me/features/home/data/model/MoviseResponse.dart';
import 'package:movie_c17_me/features/home/domain/repo/move_repo.dart';

@injectable
class MoviesUseCase {
  MoviesRepo moviesRepo;
  MoviesUseCase(this.moviesRepo);

  Future<MoviesResponse> call(String sortBy) async {
    return await moviesRepo.getMovies(sortBy);
  }
}