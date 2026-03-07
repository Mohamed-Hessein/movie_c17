import 'package:injectable/injectable.dart';
import 'package:movie_c17_me/features/profile/data/data_sourc/remote/firebase_history_ds.dart';
import 'package:movie_c17_me/features/profile/domain/repo/history_rep.dart';
@Injectable(as: HistoryRep)
class SaveHistoryRepoImpl implements HistoryRep {
  FirebaseHistoryDs firebaseHistoryDs;
  SaveHistoryRepoImpl(this.firebaseHistoryDs);
  @override
  Future<void> saveHistory(id) async {
  try{
    var save =await firebaseHistoryDs.SaveHistroy(id);

  }catch(e){
    rethrow;
  }
  }
}