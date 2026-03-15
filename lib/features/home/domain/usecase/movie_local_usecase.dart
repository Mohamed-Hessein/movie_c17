import 'package:injectable/injectable.dart';
import 'package:movie_c17_me/features/home/data/data_source/local/movie_local_ds.dart';
import 'package:movie_c17_me/features/home/domain/repo/movie_local_repo.dart';

import '../../data/model/MoviseResponse.dart';

@injectable
class MovieLocalUsecase {
  MovieLocalRepo movieLocalRepo;
  MovieLocalDs movieLocalDs;

  MovieLocalUsecase(this.movieLocalRepo, this.movieLocalDs);

  Future<MoviesResponse?> call() async {
    return await movieLocalRepo.getMovies();
  }

  Future<void> saveMovies(MoviesResponse movies) async {
    await movieLocalDs.saveMovies(movies);
  }
}