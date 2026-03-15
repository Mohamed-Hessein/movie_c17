
import 'package:injectable/injectable.dart';
import 'package:movie_c17_me/features/auth/domain/repo/firebase_fun_repo.dart';

@injectable
class LogInUsecase {
  FirebaseFunRepo firebaseFunRepo;
  LogInUsecase(this.firebaseFunRepo);
  Future<void> call(    String emailAddress,
      String password,
      )async{
    try{

    await  firebaseFunRepo.logIn(emailAddress, password);
    }catch(e){
      rethrow;
    }
  }
}