import '../../data/model/search_model.dart';

abstract class SearchRepo {

  Future<SearchModel> getSearch(dynamic title);
}