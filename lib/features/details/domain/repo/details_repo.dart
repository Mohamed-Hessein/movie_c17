import '../../data/model/details_model.dart';
import '../../data/model/suggestion_model.dart';

abstract class DetailsRepo {

 Future<detailsOfMovie> getDetails(dynamic id);

}