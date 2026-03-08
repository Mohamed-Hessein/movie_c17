import '../model/history_model.dart';

abstract class SetFavDs {

  Future<void> setFav(dynamic movieId,LastSeenMovie model);

}