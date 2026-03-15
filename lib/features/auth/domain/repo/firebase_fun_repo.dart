abstract class FirebaseFunRepo {
  Future<void> signUP(    String emailAddress,
      String password,String phone,String name, dynamic avatar
      );
  Future<void> logIn(    String emailAddress,
      String password,
      );
}