import '../../data/model/details_model.dart';
import '../../data/model/suggestion_model.dart';

abstract class SuggetsionRepo {


  Future<Suggestions> getsuggentons(dynamic id);
}