import 'package:movie_c17_me/features/profile/data/data_sourc/model/user_model.dart';

abstract class UpdateUserRepo {
  Future<void> updateUser(UserModel user);
}