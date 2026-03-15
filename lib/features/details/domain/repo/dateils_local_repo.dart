import '../../data/model/details_model.dart';
import '../../data/model/suggestion_model.dart';

abstract class DateilsLocalRepo {
  Future<detailsOfMovie?> getLocalDetails(dynamic id);
  Future<void> saveLocalDetails(detailsOfMovie deatilsModel);
  Future<void> saveLocalSuggestions(Suggestions suggetsionModel);
  Future<Suggestions?> getLocalsuggentons(dynamic id);
}