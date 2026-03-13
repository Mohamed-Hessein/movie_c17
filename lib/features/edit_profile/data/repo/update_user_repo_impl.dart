import 'package:injectable/injectable.dart';
import 'package:movie_c17_me/features/edit_profile/data/data_source/remote/update_user_ds.dart';
import 'package:movie_c17_me/features/edit_profile/domain/repo/update_user_repo.dart';
import 'package:movie_c17_me/features/profile/data/data_sourc/model/user_model.dart';
@Injectable(as:UpdateUserRepo )
class UpdateUserRepoImpl  implements UpdateUserRepo{
  UpdateUserDs updateUserDs;
  UpdateUserRepoImpl(this.updateUserDs);
  @override
  Future<void> updateUser(UserModel user)async {
   try{
     await updateUserDs.updateUser(user);
   }catch(e){
     rethrow;
   }
  }
}