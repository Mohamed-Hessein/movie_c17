import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_c17_me/features/profile/data/data_sourc/model/fav_model.dart';
import 'package:movie_c17_me/features/profile/domain/repo/favorite_repo.dart';

import '../../data/data_sourc/model/history_model.dart';
@injectable
class FavUsecase {
  FavoriteRepo favoriteRepo;
  FavUsecase(this.favoriteRepo);
  Stream<QuerySnapshot<LastSeenMovie>> call(bool isfav){
    return favoriteRepo.getFav(isfav);
  }
}