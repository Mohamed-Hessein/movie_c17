import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_c17_me/features/profile/data/data_sourc/model/history_model.dart';
import 'package:movie_c17_me/features/profile/data/data_sourc/remote/fav_ds.dart';
import 'package:movie_c17_me/features/profile/domain/repo/favorite_repo.dart';
@Injectable(as: FavoriteRepo)
class FavRepoImpl implements FavoriteRepo {
  FavDs favDs;
  FavRepoImpl(this.favDs);
  @override
  Stream<QuerySnapshot<LastSeenMovie>> getFav(bool isfav) {
try{
  var data = favDs.getFav(isfav);
  return data;
}catch(e){
  rethrow;
}
  }

  @override
  Future<void> updateFav(LastSeenMovie movie)async {
  try{
 await   favDs.updateFav(movie);
  }catch(e){
    rethrow;
  }
  }
}