import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_c17_me/features/profile/data/data_sourc/model/fav_model.dart';
import 'package:movie_c17_me/features/profile/data/data_sourc/model/history_model.dart';
import 'package:movie_c17_me/features/profile/data/data_sourc/remote/fav_ds.dart';

import 'firebase_history_ds_impl.dart';
@Injectable(as:FavDs )
class FavDsImpl implements FavDs {

  FavDsImpl();
  @override
  Stream<QuerySnapshot<LastSeenMovie>> getFav(isfav) {
var data ;
data = FirebaseHistoryDsImpl.creatClollection().where('isfav', isEqualTo: isfav).snapshots();
return data;
  }
}