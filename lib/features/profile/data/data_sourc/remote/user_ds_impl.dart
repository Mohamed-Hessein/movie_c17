import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_c17_me/features/profile/data/data_sourc/model/user_model.dart';
import 'package:movie_c17_me/features/profile/data/data_sourc/remote/user_ds.dart';
@LazySingleton(as: UserDs)
class UserDsImpl  implements UserDs{
  @override
  CollectionReference<UserModel> CreateCollectionUSer() {
   try{
     return FirebaseFirestore.instance
         .collection('User').withConverter(fromFirestore: (snapshot, _){
       return UserModel.fromJson(snapshot.data()!);
     }, toFirestore: (model, _){
       return  model.tojson();
     });

   }catch(e){
     rethrow;
   }
  }

  @override
  Future<UserModel?> getUser() async{
try{
  var collection = CreateCollectionUSer();

  DocumentSnapshot<UserModel> user =await collection.doc(FirebaseAuth.instance.currentUser!.uid).get();

  return user.data();
}catch(e){
  rethrow;
}
  }

  @override
  @override
  Future<void> setUser(UserModel user) async {
    try {
      var collection = CreateCollectionUSer();
      var docRef = collection.doc(user.id);
      await docRef.set(user);
    } catch (e) {
      print(e);
    }
  }
}