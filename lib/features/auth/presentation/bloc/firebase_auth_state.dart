abstract class FirebaseAuthState {}
class FirebaseAuthInaitl extends FirebaseAuthState{}
class SignUpSucess extends FirebaseAuthState{}
class SignUpLoading extends FirebaseAuthState{}
class SignUpError extends FirebaseAuthState{
  String errorMessage;
  SignUpError(this.errorMessage);
}
class LogInSucess extends FirebaseAuthState{}
class LogInLoading extends FirebaseAuthState{}
class LogInError extends FirebaseAuthState{

  String errorMessage;
  LogInError(this.errorMessage);
}
