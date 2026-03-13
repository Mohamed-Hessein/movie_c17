
import '../../../details/data/model/details_model.dart';
import '../../../search/data/model/search_model.dart';

abstract class BrowserRepo {
  Future<SearchModel> getBrowser();

}