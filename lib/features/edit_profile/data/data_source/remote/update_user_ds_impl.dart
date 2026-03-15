import 'package:injectable/injectable.dart';
import 'package:movie_c17_me/features/edit_profile/data/data_source/remote/update_user_ds.dart';
import 'package:movie_c17_me/features/profile/data/data_sourc/model/user_model.dart';
import 'package:movie_c17_me/features/profile/data/data_sourc/remote/firebase_history_ds.dart';

import '../../../../profile/data/data_sourc/remote/user_ds.dart';
@Injectable(as: UpdateUserDs)
class UpdateUserDsImpl implements UpdateUserDs  {
  UserDs userDs;
  UpdateUserDsImpl(this.userDs);
  @override
  Future<void> updateUser(UserModel user) async {
try{
  var collec = userDs.CreateCollectionUSer();
  var ref = collec.doc(user.id);
 await ref.update(user.tojson());
}catch(e){
  rethrow;
}
  }


}