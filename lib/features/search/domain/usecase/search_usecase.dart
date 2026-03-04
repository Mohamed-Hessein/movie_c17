import 'package:injectable/injectable.dart';
import 'package:movie_c17_me/features/search/data/model/search_model.dart';
import 'package:movie_c17_me/features/search/domain/repo/search_repo.dart';
@injectable
class SearchUsecase {
  SearchRepo searchRepo;
  SearchUsecase(this.searchRepo);
  Future<SearchModel> call(dynamic title)async{
    return await searchRepo.getSearch(title);
  }

}