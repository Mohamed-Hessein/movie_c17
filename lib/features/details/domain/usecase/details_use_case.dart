

import 'package:injectable/injectable.dart';
import 'package:movie_c17_me/features/details/domain/repo/details_repo.dart';

import '../../data/model/details_model.dart';

@injectable
class DetailsUseCase {
  DetailsRepo detailsRepo;
  DetailsUseCase(this.detailsRepo);
  Future<detailsOfMovie> call(dynamic id)async{
   return await detailsRepo.getDetails(id);
  }
}