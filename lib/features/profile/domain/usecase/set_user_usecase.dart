import 'package:injectable/injectable.dart';
import 'package:movie_c17_me/features/profile/data/data_sourc/model/user_model.dart';
import 'package:movie_c17_me/features/profile/domain/repo/get_user_repo.dart';
@injectable
class SetUserUsecase {
  UserRepo userRepo;
  SetUserUsecase(this.userRepo);
  Future<void> call(UserModel user)async{
    return await userRepo.setUser(user);
  }
}