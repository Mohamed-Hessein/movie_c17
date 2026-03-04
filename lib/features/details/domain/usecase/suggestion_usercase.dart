

import 'package:injectable/injectable.dart';
import 'package:movie_c17_me/features/details/data/model/suggestion_model.dart';
import 'package:movie_c17_me/features/details/domain/repo/details_repo.dart';
import 'package:movie_c17_me/features/details/domain/repo/suggetsion_repo.dart';

import '../../data/model/details_model.dart';

@injectable
class SuggestionUsercase {
  SuggetsionRepo suggetsionRepo;
  SuggestionUsercase(this.suggetsionRepo);
  Future<Suggestions> call(dynamic id)async{
    return await suggetsionRepo.getsuggentons(id);
  }
}