import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/user_model.dart';

abstract class UserDs {
  Future<UserModel?> getUser();
  CollectionReference<UserModel> CreateCollectionUSer();
setUser(UserModel user);
  Future<void> logOut();
}