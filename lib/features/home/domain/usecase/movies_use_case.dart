import 'package:injectable/injectable.dart';
import '../../data/model/MoviseResponse.dart';
import '../repo/move_repo.dart';

@injectable
class MoviesUseCase {
  MoviesRepo moviesRepo;
  MoviesUseCase(this.moviesRepo);

  Future<MoviesResponse> call(String sortBy) async {
    return await moviesRepo.getMovies(sortBy);
  }
}