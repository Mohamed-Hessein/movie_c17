import 'package:movie_c17_me/features/profile/data/data_sourc/model/user_model.dart';

abstract class UserEvent {}
class craateCollec extends UserEvent{}
class setUser extends UserEvent{
  UserModel userModel;
  setUser(this.userModel);
}
class getUser extends UserEvent{}
class upDateUser extends UserEvent{
  UserModel userModel;
  upDateUser(
      this.userModel
      );

}  class logOutEvent extends UserEvent{}