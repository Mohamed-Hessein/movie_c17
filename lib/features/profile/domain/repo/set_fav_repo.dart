import '../../data/data_sourc/model/history_model.dart';

abstract class SetFavRepo {

  Future<void> saveFav(dynamic movieId,{LastSeenMovie model});

}