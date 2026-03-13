import 'package:movie_c17_me/features/home/data/model/MoviseResponse.dart';
import 'package:movie_c17_me/features/profile/data/data_sourc/model/history_model.dart';
import 'package:movie_c17_me/features/profile/data/data_sourc/model/user_model.dart';

import '../../../details/data/model/details_model.dart';

enum RequestStatus{
  init,
  loading,
  success,
  error,
}

class UserState {
  RequestStatus? getUserStatus;

UserModel? userModel;
  String? errorMassage;

  UserState({
    this.getUserStatus = RequestStatus.init,
this.userModel ,

    this.errorMassage,
});

  UserState copyWith({
    RequestStatus? getMoviesStatus,
    UserModel? userModel,
    String? errorMassage,
 }){
    return UserState(
      getUserStatus: getMoviesStatus ?? this.getUserStatus,
     userModel:  userModel?? this.userModel,
      errorMassage: errorMassage ?? this.errorMassage,


    );
  }
}