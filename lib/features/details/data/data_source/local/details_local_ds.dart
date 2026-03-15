import '../../model/details_model.dart';
import '../../model/suggestion_model.dart';

abstract class DetailsLocalDs {
  Future<detailsOfMovie?> getLocalDetails(dynamic id);
  Future<void> saveLocalDetails(detailsOfMovie deatilsModel);
  Future<void> saveLocalSuggestions(Suggestions suggetsionModel);
  Future<Suggestions?> getLocalsuggentons(dynamic id);

}