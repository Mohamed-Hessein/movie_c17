
import 'package:injectable/injectable.dart';
import 'package:movie_c17_me/core/api/api_manager.dart';
import 'package:movie_c17_me/core/api/end_point.dart';
import 'package:movie_c17_me/features/home/data/data_source/remot/movies_ds.dart';
import 'package:movie_c17_me/features/home/data/model/MoviseResponse.dart';

@Injectable(as: MoviesRemoteDs)
class MoviesRemoteDsImpl implements MoviesRemoteDs{
  ApiManager apiManager;
  MoviesRemoteDsImpl(this.apiManager);
  @override
  Future<MoviesResponse> getMovies(String sortBy) async {
    try {
      var response = await apiManager.get(EndPoint.moviesList,
        queryParameters: {


        },
      );
      MoviesResponse moviesResponse = MoviesResponse.fromJson(response.data);
      return moviesResponse;
    } catch (e) {
      rethrow;
    }
  }


}