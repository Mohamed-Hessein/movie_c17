import 'package:cloud_firestore/cloud_firestore.dart';

import '../../data/data_sourc/model/history_model.dart';

abstract class GetHistoryRepo {
  Stream<QuerySnapshot<LastSeenMovie>> getHistory();
}