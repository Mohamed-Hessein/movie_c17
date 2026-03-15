
import 'package:injectable/injectable.dart';
import 'package:movie_c17_me/features/auth/domain/repo/firebase_fun_repo.dart';

@injectable
class SignupUsecase {
  FirebaseFunRepo firebaseFunRepo;
  SignupUsecase(this.firebaseFunRepo);
  Future<void> call(    String emailAddress,
      String password,String phone,String name, dynamic avatar
      )async{
    try{

      await  firebaseFunRepo.signUP(emailAddress, password, name, avatar, phone);
    }catch(e){
      rethrow;
    }
  }
}