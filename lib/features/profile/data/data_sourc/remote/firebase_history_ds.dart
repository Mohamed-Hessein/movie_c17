 import '../../../../home/data/model/MoviseResponse.dart';
import '../model/history_model.dart';

abstract class FirebaseHistoryDs {
  Future<void> SaveHistroy(dynamic id
  );
}