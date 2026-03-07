import '../../../home/data/model/MoviseResponse.dart';
import '../../data/data_sourc/model/history_model.dart';

abstract class HistoryRep {

  Future<void> saveHistory(dynamic id,);
}