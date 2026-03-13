import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_c17_me/features/profile/data/data_sourc/model/user_model.dart';
import 'package:movie_c17_me/features/profile/domain/repo/get_user_repo.dart';
@injectable
class CreateCollectionUsecase {
  UserRepo userRepo;
  CreateCollectionUsecase(this.userRepo);
  CollectionReference<UserModel> call(){
 return    userRepo.CreateCollectionUSer();
  }
}