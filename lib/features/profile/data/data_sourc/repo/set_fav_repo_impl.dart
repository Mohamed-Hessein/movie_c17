import 'package:injectable/injectable.dart';
import 'package:movie_c17_me/features/profile/data/data_sourc/model/history_model.dart';
import 'package:movie_c17_me/features/profile/data/data_sourc/remote/set_fav_ds.dart';
import 'package:movie_c17_me/features/profile/domain/repo/set_fav_repo.dart';
@Injectable(as: SetFavRepo)
class SetFavRepoImpl implements SetFavRepo {
  SetFavDs setFavDsl;
  SetFavRepoImpl(this.setFavDsl);
  @override
  Future<void> saveFav(movieId,{LastSeenMovie? model}) async {
    try{  if (model == null) {
      throw ArgumentError('model must not be null');
    }
     await setFavDsl.setFav(movieId, model);
    }catch(e){
      rethrow;
    }
  }
}