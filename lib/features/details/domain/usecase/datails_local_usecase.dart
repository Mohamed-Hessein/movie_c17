import 'package:injectable/injectable.dart';
import 'package:movie_c17_me/features/details/domain/repo/dateils_local_repo.dart';

import '../../data/model/details_model.dart';
@injectable
class DatailsLocalUsecase {
  DateilsLocalRepo dateilsLocalRepo;
  DatailsLocalUsecase(this.dateilsLocalRepo);
  Future<detailsOfMovie?> call(dynamic id)async{
    return await dateilsLocalRepo.getLocalDetails(id);

  }
  Future<void> saveDetails(detailsOfMovie  deatilsModel)async{
    return  dateilsLocalRepo.saveLocalDetails(deatilsModel);

  }
}