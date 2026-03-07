import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_c17_me/features/profile/data/data_sourc/model/history_model.dart';
import 'package:movie_c17_me/features/profile/data/data_sourc/remote/get_history_ds.dart';
import 'package:movie_c17_me/features/profile/domain/repo/get_history_repo.dart';
@Injectable(as:GetHistoryRepo )
class GetHistoryRepoImpl implements GetHistoryRepo {
  GetHistoryDs getHistoryDs;
  GetHistoryRepoImpl(this.getHistoryDs);

  @override
  Stream<QuerySnapshot<LastSeenMovie>> getHistory() {
  return getHistoryDs.getHsitory();
  }
}