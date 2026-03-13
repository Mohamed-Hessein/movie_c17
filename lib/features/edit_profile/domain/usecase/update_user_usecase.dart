import 'package:injectable/injectable.dart';
import 'package:movie_c17_me/features/edit_profile/domain/repo/update_user_repo.dart';
import 'package:movie_c17_me/features/profile/data/data_sourc/model/user_model.dart';
@injectable
class UpdateUserUsecase {
  UpdateUserRepo userRepo;
  UpdateUserUsecase(this.userRepo);
  Future<void> call(UserModel user)async{
    return await userRepo.updateUser(user);
  }
}