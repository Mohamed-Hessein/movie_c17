import 'package:injectable/injectable.dart';
import 'package:movie_c17_me/features/profile/data/data_sourc/model/history_model.dart';
import 'package:movie_c17_me/features/profile/domain/repo/favorite_repo.dart';
@injectable
class UpdateFavUseCase {
  FavoriteRepo favoriteRepo;
  UpdateFavUseCase(this.favoriteRepo);
  Future<void> call(LastSeenMovie movie)async{
    try{
      return await favoriteRepo.updateFav(movie);
    }catch(e){
      rethrow;
    }
  }
}