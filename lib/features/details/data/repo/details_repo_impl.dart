import 'package:injectable/injectable.dart';
import 'package:movie_c17_me/features/details/data/data_source/remote/details_ds.dart';
import 'package:movie_c17_me/features/details/data/model/details_model.dart';
import 'package:movie_c17_me/features/details/data/model/suggestion_model.dart';
import 'package:movie_c17_me/features/details/domain/repo/details_repo.dart';
@Injectable(as :DetailsRepo)
class DetailsRepoImpl implements DetailsRepo {
  DetailsDs detailsDs;
  DetailsRepoImpl(this.detailsDs);
  @override
  Future<detailsOfMovie> getDetails(id) async {
try{

  detailsOfMovie data = await detailsDs.getDetails(id);
  return data;


}catch(e){

  rethrow;
}
  }




}