import 'package:injectable/injectable.dart';
import 'package:movie_c17_me/features/browser/domain/repo/browser_repo.dart';
import 'package:movie_c17_me/features/details/data/model/suggestion_model.dart' hide Movies;
import 'package:movie_c17_me/features/search/data/model/search_model.dart';

import '../../../details/data/model/details_model.dart';
@injectable
class BrowserUsecase {
  BrowserRepo browserRepo;
  BrowserUsecase(this.browserRepo);
  Future<SearchModel> call()async{
    return await browserRepo.getBrowser();
  }

}