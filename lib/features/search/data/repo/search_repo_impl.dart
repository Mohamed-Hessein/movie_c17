import 'package:injectable/injectable.dart';
import 'package:movie_c17_me/features/search/data/data_source/serach_ds.dart';
import 'package:movie_c17_me/features/search/data/model/search_model.dart';
import 'package:movie_c17_me/features/search/domain/repo/search_repo.dart';
@Injectable(as:SearchRepo )
class SearchRepoImpl implements SearchRepo {
  SearchDs searchDs;
  SearchRepoImpl(this.searchDs);
  @override
  Future<SearchModel> getSearch(title)async {
try{    SearchModel res  = await searchDs.getSearch(title);
return res;
}
catch(e){

  rethrow;
}
  }
}