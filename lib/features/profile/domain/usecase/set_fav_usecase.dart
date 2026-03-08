import 'package:injectable/injectable.dart';
import 'package:movie_c17_me/features/profile/domain/repo/set_fav_repo.dart';

import '../../data/data_sourc/model/history_model.dart';
@injectable
class SetFavUsecase {
  SetFavRepo setFavRepo;
  SetFavUsecase(this.setFavRepo);
  Future<void> call(dynamic movieId,{required LastSeenMovie model}){
   return setFavRepo.saveFav(movieId,model: model);
  }
}