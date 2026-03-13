import 'package:movie_c17_me/features/profile/data/data_sourc/model/user_model.dart';

abstract class UpdateUserEvent {}
class UpdateUser extends UpdateUserEvent{

  UserModel userModel;
  UpdateUser(this.userModel);
}
class ChangeAvatr extends UpdateUserEvent{
  dynamic selectedIndex;
  ChangeAvatr(this.selectedIndex);
}