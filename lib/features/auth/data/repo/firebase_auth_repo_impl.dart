import 'package:injectable/injectable.dart';
import 'package:movie_c17_me/features/auth/data/data_source/firebase_auth_ds.dart';
import 'package:movie_c17_me/features/auth/domain/repo/firebase_fun_repo.dart';
@Injectable(as:FirebaseFunRepo )
class FirebaseAuthRepoImpl  implements FirebaseFunRepo{
  FirebaseAuthDs firebaseAuthDs;
  FirebaseAuthRepoImpl(this.firebaseAuthDs);
  @override
  Future<void> logIn(String emailAddress, String password)async {
    try{
      await firebaseAuthDs.logIn(emailAddress, password);
    }catch(e){rethrow;}
  }

  @override
  Future<void> signUP(String emailAddress, String password,String phone,String name, dynamic avatar) async{
    try{
      await firebaseAuthDs.signUP(emailAddress, password, name, avatar, phone);
    }catch(e){rethrow;}
  }
}