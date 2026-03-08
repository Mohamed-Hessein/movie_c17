import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_c17_me/features/profile/data/data_sourc/model/history_model.dart';
import 'package:movie_c17_me/features/profile/data/data_sourc/remote/firebase_history_ds.dart';
import 'package:movie_c17_me/features/profile/data/data_sourc/remote/set_fav_ds.dart';

import 'firebase_history_ds_impl.dart';
@Injectable(as: SetFavDs)
class SetFavDsImpl implements SetFavDs {

  SetFavDsImpl();
  @override
  Future<void> setFav(movieId, LastSeenMovie model) async {
try{

  var collec =await FirebaseHistoryDsImpl.creatClollection();
  var ref = collec.doc(movieId.toString());
  ref.set(model, SetOptions(merge: true));

}catch(e){
  rethrow;
}
  }
}