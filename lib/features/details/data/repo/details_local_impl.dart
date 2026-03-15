import 'package:injectable/injectable.dart';
import 'package:movie_c17_me/features/details/data/data_source/local/details_local_ds.dart';
import 'package:movie_c17_me/features/details/data/model/details_model.dart';
import 'package:movie_c17_me/features/details/data/model/suggestion_model.dart';
import 'package:movie_c17_me/features/details/domain/repo/dateils_local_repo.dart';
@Injectable(as:DateilsLocalRepo )
class DetailsLocalImpl implements DateilsLocalRepo {
  DetailsLocalDs detailsLocalDs;
  DetailsLocalImpl(this.detailsLocalDs);
  @override
  Future<detailsOfMovie?> getLocalDetails(id)async {
try{

  detailsOfMovie? res = await detailsLocalDs.getLocalDetails(id);
  return res;
}catch(e){
  rethrow;
}
  }

  @override
  Future<Suggestions?> getLocalsuggentons(id)async {
    try{

      Suggestions? res = await detailsLocalDs.getLocalsuggentons(id);
      return res;
    }catch(e){
      rethrow;
    }
  }

  @override
  Future<void> saveLocalDetails(detailsOfMovie deatilsModel)async {
    try{
    return await detailsLocalDs.saveLocalDetails(deatilsModel);

    }catch(e){
      rethrow;
    }
  }

  @override
  Future<void> saveLocalSuggestions(Suggestions suggetsionModel) async{
    try{
      return await detailsLocalDs.saveLocalSuggestions(suggetsionModel);

    }catch(e){
      rethrow;
    }
  }
}