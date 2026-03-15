import 'package:hive/hive.dart';

import 'details_model.dart';


int? safeReadInt(dynamic value) =>
    value is int ? value : int.tryParse(value?.toString() ?? '');

String? safeReadString(dynamic value) => value?.toString();

double? safeReadDouble(dynamic value) =>
    value is double ? value : double.tryParse(value?.toString() ?? '');

bool? safeReadBool(dynamic value) {
  if (value is bool) return value;
  if (value.toString() == 'true') return true;
  if (value.toString() == 'false') return false;
  return null;
}

class DetailsOfMovieAdapter extends TypeAdapter<detailsOfMovie> {
  @override
  final int typeId = 10;

  @override
  detailsOfMovie read(BinaryReader reader) {
    return detailsOfMovie(
      status: safeReadString(reader.read()),
      statusMessage: safeReadString(reader.read()),
      data: reader.read() as Data?,
      meta: reader.read() as Meta?,
    );
  }

  @override
  void write(BinaryWriter writer, detailsOfMovie obj) {
    writer.write(obj.status);
    writer.write(obj.statusMessage);
    writer.write(obj.data);
    writer.write(obj.meta);
  }
}

class DataAdapter extends TypeAdapter<Data> {
  @override
  final int typeId = 11;

  @override
  Data read(BinaryReader reader) {
    return Data(
      movie: reader.read() as Movie?,
    );
  }

  @override
  void write(BinaryWriter writer, Data obj) {
    writer.write(obj.movie);
  }
}

class MovieAdapter extends TypeAdapter<Movie> {
  @override
  final int typeId = 12;

  @override
  Movie read(BinaryReader reader) {
    return Movie(
      id: safeReadInt(reader.read()),
      url: safeReadString(reader.read()),
      imdbCode: safeReadString(reader.read()),
      title: safeReadString(reader.read()),
      titleEnglish: safeReadString(reader.read()),
      titleLong: safeReadString(reader.read()),
      slug: safeReadString(reader.read()),
      year: safeReadInt(reader.read()),
      rating: safeReadInt(reader.read()),
      runtime: safeReadInt(reader.read()),
      genres: (reader.read() as List?)?.cast<String>(),
      likeCount: safeReadInt(reader.read()),
      descriptionIntro: safeReadString(reader.read()),
      descriptionFull: safeReadString(reader.read()),
      ytTrailerCode: safeReadString(reader.read()),
      language: safeReadString(reader.read()),
      mpaRating: safeReadString(reader.read()),
      backgroundImage: safeReadString(reader.read()),
      backgroundImageOriginal: safeReadString(reader.read()),
      smallCoverImage: safeReadString(reader.read()),
      mediumCoverImage: safeReadString(reader.read()),
      largeCoverImage: safeReadString(reader.read()),
      torrents: (reader.read() as List?)?.cast<Torrents>(),
      dateUploaded: safeReadString(reader.read()),
      dateUploadedUnix: safeReadInt(reader.read()),
    );
  }

  @override
  void write(BinaryWriter writer, Movie obj) {
    writer.write(obj.id);
    writer.write(obj.url);
    writer.write(obj.imdbCode);
    writer.write(obj.title);
    writer.write(obj.titleEnglish);
    writer.write(obj.titleLong);
    writer.write(obj.slug);
    writer.write(obj.year);
    writer.write(obj.rating);
    writer.write(obj.runtime);
    writer.write(obj.genres);
    writer.write(obj.likeCount);
    writer.write(obj.descriptionIntro);
    writer.write(obj.descriptionFull);
    writer.write(obj.ytTrailerCode);
    writer.write(obj.language);
    writer.write(obj.mpaRating);
    writer.write(obj.backgroundImage);
    writer.write(obj.backgroundImageOriginal);
    writer.write(obj.smallCoverImage);
    writer.write(obj.mediumCoverImage);
    writer.write(obj.largeCoverImage);
    writer.write(obj.torrents);
    writer.write(obj.dateUploaded);
    writer.write(obj.dateUploadedUnix);
  }
}

class TorrentsAdapter extends TypeAdapter<Torrents> {
  @override
  final int typeId = 13;

  @override
  Torrents read(BinaryReader reader) {
    return Torrents(
      url: safeReadString(reader.read()),
      hash: safeReadString(reader.read()),
      quality: safeReadString(reader.read()),
      type: safeReadString(reader.read()),
      isRepack: safeReadString(reader.read()),
      videoCodec: safeReadString(reader.read()),
      bitDepth: safeReadString(reader.read()),
      audioChannels: safeReadString(reader.read()),
      seeds: safeReadInt(reader.read()),
      peers: safeReadInt(reader.read()),
      size: safeReadString(reader.read()),
      sizeBytes: safeReadInt(reader.read()),
      dateUploaded: safeReadString(reader.read()),
      dateUploadedUnix: safeReadInt(reader.read()),
    );
  }

  @override
  void write(BinaryWriter writer, Torrents obj) {
    writer.write(obj.url);
    writer.write(obj.hash);
    writer.write(obj.quality);
    writer.write(obj.type);
    writer.write(obj.isRepack);
    writer.write(obj.videoCodec);
    writer.write(obj.bitDepth);
    writer.write(obj.audioChannels);
    writer.write(obj.seeds);
    writer.write(obj.peers);
    writer.write(obj.size);
    writer.write(obj.sizeBytes);
    writer.write(obj.dateUploaded);
    writer.write(obj.dateUploadedUnix);
  }
}

class MetaAdapter extends TypeAdapter<Meta> {
  @override
  final int typeId = 14;

  @override
  Meta read(BinaryReader reader) {
    return Meta(
      migration: reader.read() as Migration?,
      apiVersion: safeReadInt(reader.read()),
      executionTime: safeReadString(reader.read()),
    );
  }

  @override
  void write(BinaryWriter writer, Meta obj) {
    writer.write(obj.migration);
    writer.write(obj.apiVersion);
    writer.write(obj.executionTime);
  }
}

class MigrationAdapter extends TypeAdapter<Migration> {
  @override
  final int typeId = 15;

  @override
  Migration read(BinaryReader reader) {
    return Migration(
      message: safeReadString(reader.read()),
      oldBase: safeReadString(reader.read()),
      newBase: safeReadString(reader.read()),
      sunset: safeReadString(reader.read()),
    );
  }

  @override
  void write(BinaryWriter writer, Migration obj) {
    writer.write(obj.message);
    writer.write(obj.oldBase);
    writer.write(obj.newBase);
    writer.write(obj.sunset);
  }
}