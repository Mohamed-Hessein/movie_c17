import '../model/search_model.dart';

abstract class SearchDs {

  Future<SearchModel> getSearch(dynamic title);
}