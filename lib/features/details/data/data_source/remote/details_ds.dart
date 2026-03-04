import '../../model/details_model.dart';

abstract class DetailsDs {
  Future<detailsOfMovie> getDetails (dynamic id);
}