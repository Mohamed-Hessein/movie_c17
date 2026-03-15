import 'package:hive/hive.dart';



@HiveType(typeId: 20)
class Suggestions {

  @HiveField(0)
  String? status;

  @HiveField(1)
  String? statusMessage;

  @HiveField(2)
  Data? data;

  @HiveField(3)
  Meta? meta;

  Suggestions({this.status, this.statusMessage, this.data, this.meta});

  Suggestions.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusMessage = json['status_message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    meta = json['@meta'] != null ? Meta.fromJson(json['@meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['status'] = status;
    data['status_message'] = statusMessage;

    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }

    if (meta != null) {
      data['@meta'] = meta!.toJson();
    }

    return data;
  }
}

@HiveType(typeId: 21)
class Data {

  @HiveField(0)
  int? movieCount;

  @HiveField(1)
  List<Movies>? movies;

  Data({this.movieCount, this.movies});

  Data.fromJson(Map<String, dynamic> json) {
    movieCount = json['movie_count'];

    if (json['movies'] != null) {
      movies = <Movies>[];
      json['movies'].forEach((v) {
        movies!.add(Movies.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    data['movie_count'] = movieCount;

    if (movies != null) {
      data['movies'] = movies!.map((v) => v.toJson()).toList();
    }

    return data;
  }
}

@HiveType(typeId: 22)
class Movies {

  @HiveField(0)
  int? id;

  @HiveField(1)
  String? url;

  @HiveField(2)
  String? imdbCode;

  @HiveField(3)
  String? title;

  @HiveField(4)
  String? titleEnglish;

  @HiveField(5)
  String? titleLong;

  @HiveField(6)
  String? slug;

  @HiveField(7)
  int? year;

  @HiveField(8)
  double? rating;

  @HiveField(9)
  int? runtime;

  @HiveField(10)
  List<String>? genres;

  @HiveField(11)
  String? summary;

  @HiveField(12)
  String? descriptionFull;

  @HiveField(13)
  String? synopsis;

  @HiveField(14)
  String? ytTrailerCode;

  @HiveField(15)
  String? language;

  @HiveField(16)
  String? mpaRating;

  @HiveField(17)
  String? backgroundImage;

  @HiveField(18)
  String? backgroundImageOriginal;

  @HiveField(19)
  String? smallCoverImage;

  @HiveField(20)
  String? mediumCoverImage;

  @HiveField(21)
  String? state;

  @HiveField(22)
  List<Torrents>? torrents;

  @HiveField(23)
  String? dateUploaded;

  @HiveField(24)
  int? dateUploadedUnix;

  Movies({
    this.id,
    this.url,
    this.imdbCode,
    this.title,
    this.titleEnglish,
    this.titleLong,
    this.slug,
    this.year,
    this.rating,
    this.runtime,
    this.genres,
    this.summary,
    this.descriptionFull,
    this.synopsis,
    this.ytTrailerCode,
    this.language,
    this.mpaRating,
    this.backgroundImage,
    this.backgroundImageOriginal,
    this.smallCoverImage,
    this.mediumCoverImage,
    this.state,
    this.torrents,
    this.dateUploaded,
    this.dateUploadedUnix
  });

  Movies.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
    imdbCode = json['imdb_code'];
    title = json['title'];
    titleEnglish = json['title_english'];
    titleLong = json['title_long'];
    slug = json['slug'];
    year = json['year'];
    rating = (json['rating'] as num?)?.toDouble();
    runtime = json['runtime'];
    genres = json['genres']?.cast<String>();
    summary = json['summary'];
    descriptionFull = json['description_full'];
    synopsis = json['synopsis'];
    ytTrailerCode = json['yt_trailer_code'];
    language = json['language'];
    mpaRating = json['mpa_rating'];
    backgroundImage = json['background_image'];
    backgroundImageOriginal = json['background_image_original'];
    smallCoverImage = json['small_cover_image'];
    mediumCoverImage = json['medium_cover_image'];
    state = json['state'];
    dateUploaded = json['date_uploaded'];
    dateUploadedUnix = json['date_uploaded_unix'];

    if (json['torrents'] != null) {
      torrents = <Torrents>[];
      json['torrents'].forEach((v) {
        torrents!.add(Torrents.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    data['id'] = id;
    data['url'] = url;
    data['imdb_code'] = imdbCode;
    data['title'] = title;
    data['title_english'] = titleEnglish;
    data['title_long'] = titleLong;
    data['slug'] = slug;
    data['year'] = year;
    data['rating'] = rating;
    data['runtime'] = runtime;
    data['genres'] = genres;
    data['summary'] = summary;
    data['description_full'] = descriptionFull;
    data['synopsis'] = synopsis;
    data['yt_trailer_code'] = ytTrailerCode;
    data['language'] = language;
    data['mpa_rating'] = mpaRating;
    data['background_image'] = backgroundImage;
    data['background_image_original'] = backgroundImageOriginal;
    data['small_cover_image'] = smallCoverImage;
    data['medium_cover_image'] = mediumCoverImage;
    data['state'] = state;
    data['date_uploaded'] = dateUploaded;
    data['date_uploaded_unix'] = dateUploadedUnix;

    if (torrents != null) {
      data['torrents'] = torrents!.map((v) => v.toJson()).toList();
    }

    return data;
  }
}

@HiveType(typeId: 23)
class Torrents {

  @HiveField(0)
  String? url;

  @HiveField(1)
  String? hash;

  @HiveField(2)
  String? quality;

  @HiveField(3)
  String? isRepack;

  @HiveField(4)
  String? videoCodec;

  @HiveField(5)
  String? bitDepth;

  @HiveField(6)
  String? audioChannels;

  @HiveField(7)
  int? seeds;

  @HiveField(8)
  int? peers;

  @HiveField(9)
  String? size;

  @HiveField(10)
  int? sizeBytes;

  @HiveField(11)
  String? dateUploaded;

  @HiveField(12)
  int? dateUploadedUnix;

  Torrents({
    this.url,
    this.hash,
    this.quality,
    this.isRepack,
    this.videoCodec,
    this.bitDepth,
    this.audioChannels,
    this.seeds,
    this.peers,
    this.size,
    this.sizeBytes,
    this.dateUploaded,
    this.dateUploadedUnix
  });

  Torrents.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    hash = json['hash'];
    quality = json['quality'];
    isRepack = json['is_repack']?.toString();
    videoCodec = json['video_codec'];
    bitDepth = json['bit_depth'];
    audioChannels = json['audio_channels'];
    seeds = json['seeds'];
    peers = json['peers'];
    size = json['size'];
    sizeBytes = json['size_bytes'];
    dateUploaded = json['date_uploaded'];
    dateUploadedUnix = json['date_uploaded_unix'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    data['url'] = url;
    data['hash'] = hash;
    data['quality'] = quality;
    data['is_repack'] = isRepack;
    data['video_codec'] = videoCodec;
    data['bit_depth'] = bitDepth;
    data['audio_channels'] = audioChannels;
    data['seeds'] = seeds;
    data['peers'] = peers;
    data['size'] = size;
    data['size_bytes'] = sizeBytes;
    data['date_uploaded'] = dateUploaded;
    data['date_uploaded_unix'] = dateUploadedUnix;

    return data;
  }
}

@HiveType(typeId: 24)
class Meta {

  @HiveField(0)
  Migration? migration;

  @HiveField(1)
  int? apiVersion;

  @HiveField(2)
  String? executionTime;

  Meta({this.migration, this.apiVersion, this.executionTime});

  Meta.fromJson(Map<String, dynamic> json) {
    migration = json['migration'] != null
        ? Migration.fromJson(json['migration'])
        : null;
    apiVersion = json['api_version'];
    executionTime = json['execution_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    if (migration != null) {
      data['migration'] = migration!.toJson();
    }

    data['api_version'] = apiVersion;
    data['execution_time'] = executionTime;

    return data;
  }
}

@HiveType(typeId: 25)
class Migration {

  @HiveField(0)
  String? message;

  @HiveField(1)
  String? oldBase;

  @HiveField(2)
  String? newBase;

  @HiveField(3)
  String? sunset;

  Migration({this.message, this.oldBase, this.newBase, this.sunset});

  Migration.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    oldBase = json['old_base'];
    newBase = json['new_base'];
    sunset = json['sunset'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    data['message'] = message;
    data['old_base'] = oldBase;
    data['new_base'] = newBase;
    data['sunset'] = sunset;

    return data;
  }
}