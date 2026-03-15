import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_c17_me/features/auth/domain/usecase/log_in_usecase.dart';
import 'package:movie_c17_me/features/auth/domain/usecase/signUp_usecase.dart';
import 'package:movie_c17_me/features/auth/presentation/bloc/firebase_auth_state.dart';
@injectable
class FirebaseAuthCubit  extends Cubit<FirebaseAuthState>{
  LogInUsecase logInUsecase;
  SignupUsecase signupUsecase;
  FirebaseAuthCubit(this.logInUsecase, this.signupUsecase): super(FirebaseAuthInaitl());
  logIn(    String emailAddress,
      String password,
      )async{
  try{
    emit(LogInLoading());
    await  logInUsecase.call(emailAddress, password);
    emit(LogInSucess());

  }catch(e){
    emit(LogInError(e.toString()));

  }
  }
  signUP(    String emailAddress,
      String password,String phone,String name, dynamic avatar
      )async{
    try{
      emit(SignUpLoading());
      await  signupUsecase.call(emailAddress, password, name, avatar, phone);
      emit(SignUpSucess());

    }catch(e){
      emit(SignUpError(e.toString()));

    }
  }
}