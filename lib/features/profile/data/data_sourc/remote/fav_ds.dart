 import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movie_c17_me/features/profile/data/data_sourc/model/fav_model.dart';

import '../model/history_model.dart';

abstract class FavDs {
   Stream<QuerySnapshot<LastSeenMovie>> getFav(bool isfav);
}