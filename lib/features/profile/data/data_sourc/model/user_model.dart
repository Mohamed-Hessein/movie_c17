class UserModel {
String? phone;
  String id;
  String name;
  String email;
String ?avatar;
  UserModel({required this.id ,required this.email,this.avatar,this.phone, required this.name});
  UserModel.fromJson(Map<String, dynamic> json) :this(
    id: json['id'],
    avatar: json['avatar'],
    phone: json['phone'],
    name: json['name'],
    email: json['email'],
  );
  Map<String,dynamic> tojson(){

    return {
      'id':id,
      'avatar':avatar,
      'phone':phone,
      'name': name,
      'email':email,
    };
  }


}