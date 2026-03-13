import 'package:firebase_auth/firebase_auth.dart';
import 'package:movie_c17_me/features/profile/data/data_sourc/model/user_model.dart';

abstract class UpdateUserDs {
  Future<void> updateUser(UserModel user);
}