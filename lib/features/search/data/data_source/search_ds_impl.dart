import 'package:injectable/injectable.dart';
import 'package:movie_c17_me/core/api/api_manager.dart';
import 'package:movie_c17_me/core/api/end_point.dart';
import 'package:movie_c17_me/features/search/data/data_source/serach_ds.dart';
import 'package:movie_c17_me/features/search/data/model/search_model.dart';
@Injectable(as: SearchDs)
class SearchDsImpl implements SearchDs {
  @override
  // TODO: implement getSearch
  ApiManager apiManager;
  SearchDsImpl(this.apiManager);
  Future<SearchModel> getSearch(title) async{

   try{var res = await apiManager.get(EndPoint.search,queryParameters: {'query_term':title});
   SearchModel searchModel = SearchModel.fromJson(res.data);
   return searchModel;}
  catch(e){

     rethrow;
  }}
}