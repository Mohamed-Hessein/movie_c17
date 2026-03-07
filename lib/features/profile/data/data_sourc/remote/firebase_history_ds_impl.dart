import 'package:injectable/injectable.dart';
import 'package:movie_c17_me/features/home/data/model/MoviseResponse.dart';
import 'package:movie_c17_me/features/profile/data/data_sourc/remote/firebase_history_ds.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/history_model.dart';
@LazySingleton(as: FirebaseHistoryDs)
class FirebaseHistoryDsImpl implements FirebaseHistoryDs {
  @override
  Future<void> SaveHistroy(id)async {
    var collec = creatClollection();
  var ref = collec.doc();

  var model = LastSeenMovie(
    id: ref.id,
    ids: id,
  );

  await ref.set(model);
  }

  static CollectionReference<LastSeenMovie> creatClollection(){
    return FirebaseFirestore.instance
        .collection('history').withConverter(fromFirestore: (snapshot, _){
      return LastSeenMovie.fromJson(snapshot.data()!);
    }, toFirestore: (model, _){
      return  model.toJson();
    });

  }
}