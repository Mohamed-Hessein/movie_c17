import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_c17_me/di.dart';
import 'package:movie_c17_me/features/auth/data/data_source/firebase_auth_ds.dart';
import 'package:movie_c17_me/features/profile/presentation/bloc/user_bloc.dart';

import '../../../profile/data/data_sourc/model/user_model.dart';
import '../../../profile/presentation/bloc/user_event.dart';
@Injectable(as:FirebaseAuthDs )
class FirebaseAuthDsImpl implements FirebaseAuthDs {
  @override
  Future<void> logIn(String emailAddress, String password)async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress,
        password: password,

      );


      if(credential.user!.emailVerified){

      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('Wrong password provided for that user.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }else{

      }

    } catch (e) {
   rethrow;
    }
  }

  @override
  Future<void> signUP(String emailAddress, String password,String phone,String name, dynamic avatar) async{
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      credential.user!.sendEmailVerification();
      var user = UserModel(id:credential.user?.uid??'', email: emailAddress, name:name, phone: phone,avatar: avatar);

      
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }else{
        print(e.code);
      }

    } catch (e) {
rethrow;

    }
  }}


