import 'package:firebase_auth/firebase_auth.dart';

class FirebaseFunctions{
  static Future<void>login(
      String emailAddress,
      String password,

      {required Function onSuccess,required Function onError})async{
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress,
        password: password,

      );
      onSuccess();
      if(credential.user!.emailVerified){
        onSuccess();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        onError('Wrong password provided for that user.');
      } else if (e.code == 'wrong-password') {
        onError('Wrong password provided for that user.');
      }else{
        onError(e.code);
      }

    } catch (e) {
      onError(e.toString());
    }
  }

 static Future<void> createUser(
     String email,
     String password,

  {required Function onSuccess,required Function onError}
     )async{
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      credential.user!.sendEmailVerification();
        onSuccess();

    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        onError('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        onError('The account already exists for that email.');
      }else{
        onError(e.code);
      }

    } catch (e) {
      onError(e.toString());

    }
  }
}