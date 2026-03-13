import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_c17_me/features/profile/data/data_sourc/model/history_model.dart';
import 'package:movie_c17_me/features/profile/data/data_sourc/remote/firebase_history_ds.dart';
import 'package:movie_c17_me/features/profile/data/data_sourc/remote/get_history_ds.dart';

import 'firebase_history_ds_impl.dart';
@Injectable(as: GetHistoryDs)
class GetHistoryDsIpm   implements GetHistoryDs{

  final FirebaseHistoryDs firebaseHistoryDs;

  GetHistoryDsIpm(this.firebaseHistoryDs);

  @override
  Stream<QuerySnapshot<LastSeenMovie>> getHsitory() {
var data;
data =FirebaseHistoryDsImpl.creatClollection().where('id', isEqualTo: FirebaseAuth.instance.currentUser!.uid).snapshots();
return data;
  }
}