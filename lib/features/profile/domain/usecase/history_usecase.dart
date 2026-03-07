import 'package:injectable/injectable.dart';
import 'package:movie_c17_me/features/profile/domain/repo/history_rep.dart';

import '../../../home/data/model/MoviseResponse.dart';
import '../../data/data_sourc/model/history_model.dart';
@injectable
class HistoryUsecase {

  HistoryRep historyRep;
  HistoryUsecase(this.historyRep);
  Future< void> call(dynamic id,)async{
    var res =await historyRep.saveHistory(id);
    return res;
  }
}