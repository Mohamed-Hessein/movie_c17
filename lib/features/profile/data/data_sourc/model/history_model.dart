class LastSeenMovie {
  String id;
  String ids;
  bool isfav;

  LastSeenMovie({required this.id, required this.ids, this.isfav = false});

  factory LastSeenMovie.fromJson(Map<String, dynamic> json) {
    return LastSeenMovie(
      id: json['id'].toString(),
      ids: json['ids'].toString(),
      isfav: json['isfav'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'ids': ids,
      'isfav': isfav,
    };
  }
}