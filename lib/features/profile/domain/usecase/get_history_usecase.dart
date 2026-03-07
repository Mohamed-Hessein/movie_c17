import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_c17_me/features/profile/domain/repo/get_history_repo.dart';

import '../../data/data_sourc/model/history_model.dart';
@injectable
class GetHistoryUsecase {
  GetHistoryRepo getHistoryRepo;
  GetHistoryUsecase(this.getHistoryRepo);
  Stream<QuerySnapshot<LastSeenMovie>> call(){
  return   getHistoryRepo.getHistory();
  }
}