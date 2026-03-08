import 'package:flutter/cupertino.dart';

class LastSeenMovie {
  dynamic id;
  dynamic ids;
  bool isfav;

  LastSeenMovie({required this.id, required this.ids, this.isfav = false});

  factory LastSeenMovie.fromJson(Map<String, dynamic> json) {
    debugPrint('json ids: ${json['ids']} (${json['ids'].runtimeType})');
    return LastSeenMovie(
      id: json['id'],
      ids: json['ids']?.toString() ?? '',
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