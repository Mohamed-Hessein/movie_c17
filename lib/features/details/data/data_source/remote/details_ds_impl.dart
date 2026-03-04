import 'package:injectable/injectable.dart';
import 'package:movie_c17_me/core/api/api_manager.dart';
import 'package:movie_c17_me/core/api/end_point.dart';
import 'package:movie_c17_me/features/details/data/data_source/remote/details_ds.dart';
import 'package:movie_c17_me/features/details/data/model/details_model.dart';
@Injectable(as : DetailsDs)
class DetailsDsImpl implements DetailsDs {
  ApiManager apiManager;
  DetailsDsImpl(this.apiManager);
  @override
  Future<detailsOfMovie> getDetails(id) async{
    // TODO: implement getDetails
try{
  var response =  await apiManager.get(EndPoint.detailsOfMovie,queryParameters: {'movie_id': id});

  detailsOfMovie data = detailsOfMovie.fromJson(response.data);
  return data;
}catch(e){
  rethrow;
}
  }
}