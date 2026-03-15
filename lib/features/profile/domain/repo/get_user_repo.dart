import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movie_c17_me/features/profile/data/data_sourc/model/user_model.dart';

abstract class UserRepo {
  Future<UserModel?> getUser();
  CollectionReference<UserModel> CreateCollectionUSer();
  Future<void> setUser(UserModel user);
  Future<void> logOut();
}