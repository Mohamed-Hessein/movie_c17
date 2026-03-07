class LastSeenMovie {
   dynamic id;
   String ids;

  LastSeenMovie({required this.id,required this.ids});


  factory LastSeenMovie.fromJson(Map<String, dynamic> json) {
    return LastSeenMovie(
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