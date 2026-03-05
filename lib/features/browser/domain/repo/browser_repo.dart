import 'package:movie_c17_me/features/search/data/model/search_model.dart';

import '../../../details/data/model/details_model.dart';

abstract class BrowserRepo {
  Future<SearchModel> getBrowser();

}