import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_c17_me/features/profile/data/data_sourc/model/user_model.dart';
import 'package:movie_c17_me/features/profile/data/data_sourc/remote/user_ds.dart';
import 'package:movie_c17_me/features/profile/domain/repo/get_user_repo.dart';
@Injectable(as:UserRepo )
class UserRepoImpl  implements UserRepo{
  UserDs userDs;
  UserRepoImpl(this.userDs);
  @override
  CollectionReference<UserModel> CreateCollectionUSer() {
try{

  return userDs.CreateCollectionUSer();
}catch(e){

  rethrow;
}
  }

  @override
  Future<UserModel?> getUser() {
    try{
  return    userDs.getUser();
    }catch(e){
      rethrow;
    }
  }

  @override
  Future<UserModel> setUser(UserModel user) {
    // TODO: implement setUser
 try{
  return userDs.setUser(user);
 }catch(e){
   rethrow;
 }
  }

  @override
  Future<void> logOut() {
    // TODO: implement logOut
    throw UnimplementedError();
  }
}