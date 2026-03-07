import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/history_model.dart';

abstract class GetHistoryDs {
  Stream<QuerySnapshot<LastSeenMovie>> getHsitory();
}