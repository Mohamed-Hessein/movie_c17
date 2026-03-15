class FavModel {
  dynamic id;
  String ids;

  FavModel({required this.id,required this.ids});


  factory FavModel.fromJson(Map<String, dynamic> json) {
    return FavModel(
      id: json['id'] as int,
      ids:   json['ids'] as String,
    );
  }


  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'ids' :ids,
    };
  }
}