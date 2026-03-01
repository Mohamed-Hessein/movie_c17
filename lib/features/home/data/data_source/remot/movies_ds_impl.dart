
import 'package:injectable/injectable.dart';
import '../../../../../core/api/api_manager.dart';
import '../../../../../core/api/end_point.dart';
import '../../model/MoviseResponse.dart';
import 'movies_ds.dart';

@Injectable(as: MoviesRemoteDs)
class MoviesRemoteDsImpl implements MoviesRemoteDs{
  ApiManager apiManager;
  MoviesRemoteDsImpl(this.apiManager);
  @override
  Future<MoviesResponse> getMovies(String sortBy) async {
    try {
      var response = await apiManager.get(EndPoint.moviesList,
        queryParameters: {
          'sort_by': sortBy,
          'limit': 20,
        },
      );
      MoviesResponse moviesResponse = MoviesResponse.fromJson(response.data);
      return moviesResponse;
    } catch (e) {
      rethrow;
    }
  }


}