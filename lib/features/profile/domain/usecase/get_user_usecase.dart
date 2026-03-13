import 'package:injectable/injectable.dart';
import 'package:movie_c17_me/features/profile/data/data_sourc/model/user_model.dart';
import 'package:movie_c17_me/features/profile/domain/repo/get_user_repo.dart';
@injectable
class GetUserUsecase {
  UserRepo userRepo;
  GetUserUsecase(this.userRepo);
  Future<UserModel?> call()async{
    return await userRepo.getUser();
  }
}