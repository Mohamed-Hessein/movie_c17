import 'package:movie_c17_me/features/profile/domain/repo/delete_user_repo.dart';

import '../repo/get_user_repo.dart';

class LogOutUsercase {
  UserRepo  userRepo;
  LogOutUsercase(this.userRepo);
  Future<void> call()async{
    await userRepo.logOut();
  }
}