import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_c17_me/features/home/data/data_source/local/movie_local_ds.dart';
import 'package:movie_c17_me/features/home/data/model/MoviseResponse.dart';
@Injectable(as:MovieLocalDs)
class MovieLocalDsImpl  implements MovieLocalDs{
  static const String _boxName = 'moviesBox';
  @override
  Future<Box<MoviesResponse>> _openBox() async {
    if (!Hive.isBoxOpen(_boxName)) {
      return await Hive.openBox<MoviesResponse>(_boxName);
    }
    return Hive.box<MoviesResponse>(_boxName);
  }





  @override
  Future<MoviesResponse?> getMovies() async{
    final box = await _openBox();
    return box.get('movies');
  }





Future<void> clearMovies() async {
  final box = await _openBox();
  await box.clear();
}

  @override
  Future<void> saveMovies
(MoviesResponse movies) async {
      final box = await _openBox();
      await box.put('movies', movies);

  }

}