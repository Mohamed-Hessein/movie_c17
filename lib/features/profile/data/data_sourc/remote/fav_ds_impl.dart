import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
data = FirebaseHistoryDsImpl.creatClollection().where('id', isEqualTo: FirebaseAuth.instance.currentUser!.uid).where('isfav', isEqualTo: true).snapshots();
return data;
  }

  @override
  Future<void> updateFav(LastSeenMovie movie) async {
    var collect = FirebaseHistoryDsImpl.creatClollection();
    var ref = collect.doc('${movie.id}_${movie.ids}');

    var doc = await ref.get();
    if (doc.exists) {

      await ref.update(movie.toJson());
    } else {

      await ref.set(movie, SetOptions(merge: true));
    }
  }
}