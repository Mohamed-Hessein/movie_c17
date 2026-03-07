import 'package:injectable/injectable.dart';
import 'package:movie_c17_me/core/api/api_manager.dart';
import 'package:movie_c17_me/core/api/end_point.dart';
import 'package:movie_c17_me/features/details/data/data_source/remote/suggetsion_ds.dart';
import 'package:movie_c17_me/features/details/data/model/suggestion_model.dart';
@Injectable(as: SuggetsionDs)
class SuggestionsDsImpl implements SuggetsionDs {
  ApiManager apiManager;
  SuggestionsDsImpl(this.apiManager);
  @override
  Future<Suggestions> getSeuggestion(id)async {
    try{
      var res =await apiManager.get(EndPoint.suggestions,queryParameters: {
        'movie_id': id
      });
      Suggestions suggest = Suggestions.fromJson(res.data);
      return suggest;
    }catch(e){
      rethrow;
    }
  }
}