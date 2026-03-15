
import 'package:injectable/injectable.dart';

import '../../../details/data/model/details_model.dart';
import '../../../search/data/model/search_model.dart';
import '../repo/browser_repo.dart';
@injectable
class BrowserUsecase {
  BrowserRepo browserRepo;
  BrowserUsecase(this.browserRepo);
  Future<SearchModel> call()async{
    return await browserRepo.getBrowser();
  }

}