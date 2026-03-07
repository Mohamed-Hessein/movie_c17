import 'package:injectable/injectable.dart';
import 'package:movie_c17_me/features/details/data/data_source/remote/details_ds.dart';
import 'package:movie_c17_me/features/details/data/data_source/remote/suggetsion_ds.dart';
import 'package:movie_c17_me/features/details/data/model/details_model.dart';
import 'package:movie_c17_me/features/details/data/model/suggestion_model.dart';
import 'package:movie_c17_me/features/details/domain/repo/details_repo.dart';
import 'package:movie_c17_me/features/details/domain/repo/suggetsion_repo.dart';
@Injectable(as :SuggetsionRepo)
class SuggestionRepoImpl implements SuggetsionRepo {
  SuggetsionDs suggetsionDs;
  SuggestionRepoImpl(this.suggetsionDs);



  @override
  Future<Suggestions> getsuggentons(id) async{
    try{

      Suggestions data = await suggetsionDs.getSeuggestion(id);
      return data;


    }catch(e){

      rethrow;
    }
  }




}