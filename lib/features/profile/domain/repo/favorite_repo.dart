import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movie_c17_me/features/profile/data/data_sourc/model/fav_model.dart';

import '../../data/data_sourc/model/history_model.dart';

abstract class FavoriteRepo {

  Stream<QuerySnapshot<LastSeenMovie>> getFav(bool isfav);
Future<void> updateFav(LastSeenMovie movie);
}