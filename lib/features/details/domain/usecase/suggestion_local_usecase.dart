
import 'package:injectable/injectable.dart';
import 'package:movie_c17_me/features/details/data/model/suggestion_model.dart';

import '../repo/dateils_local_repo.dart';
@injectable
class SuggestionLocalUsecase {
  DateilsLocalRepo dateilsLocalRepo;
  SuggestionLocalUsecase(this.dateilsLocalRepo);
  Future<Suggestions?> call(dynamic id)async{
    return await dateilsLocalRepo.getLocalsuggentons(id);

  }
  Future<void> saveDetails(Suggestions  suggetsionModel)async{
    return  dateilsLocalRepo.saveLocalSuggestions(suggetsionModel);

  }
}