import 'package:injectable/injectable.dart';
import 'package:movie_c17_me/features/browser/data/data_source/browser_ds.dart';
import 'package:movie_c17_me/features/browser/domain/repo/browser_repo.dart';
import 'package:movie_c17_me/features/search/data/model/search_model.dart';

import '../../../details/data/model/details_model.dart';
import '../../../search/data/model/search_model.dart';
import '../../domain/repo/browser_repo.dart';
import '../data_source/browser_ds.dart';
@Injectable(as:BrowserRepo)
class BrowsrRepoImpl  implements BrowserRepo{
  BrowserDs browserDs;
  BrowsrRepoImpl(this.browserDs);
  @override
  Future<SearchModel> getBrowser() {
try{

  return browserDs.getBrowser();
}catch(e){
  rethrow;
}
  }
}