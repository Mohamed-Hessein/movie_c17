import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

import 'package:movie_c17_me/features/details/data/model/details_model.dart';
import 'package:movie_c17_me/features/details/data/model/suggestion_model.dart';

import '../remote/details_ds.dart';
import 'details_local_ds.dart';
@Injectable(as:DetailsLocalDs )
class DetailsDsImpl  implements DetailsLocalDs{
  static const String _boxName = 'detailsBox';
  static const String _boxNameSug = 'SugBox';
@override
Future<Box<detailsOfMovie>> _openBox() async {
  if (!Hive.isBoxOpen(_boxName)) {
    return await Hive.openBox<detailsOfMovie>(_boxName);
  }
  return Hive.box<detailsOfMovie>(_boxName);
}
  Future<Box<Suggestions>> _openBoxSug() async {
    if (!Hive.isBoxOpen(_boxName)) {
      return await Hive.openBox<Suggestions>(_boxName);
    }
    return Hive.box<Suggestions>(_boxName);
  }
  @override
  Future<detailsOfMovie?> getLocalDetails(id)async {
    final box = await _openBox();
    return box.get('movie');
  }

  @override
  Future<Suggestions?> getLocalsuggentons(id)async {
    final box = await _openBoxSug();
  return box.get('movies');
  }

  @override
  Future<void> saveLocalDetails(detailsOfMovie deatilsModel) async{
    final box = await _openBox();
   return box.put('movie', deatilsModel);
  }

  @override
  Future<void> saveLocalSuggestions(Suggestions suggetsionModel)async {
    final box = await _openBoxSug();
return box.put('movies', suggetsionModel);
  }
  Future<void> clearMovies() async {
    final box = await _openBox();
    await box.clear();
  }
  Future<void> clearSug() async {
    final box = await _openBoxSug();
    await box.clear();
  }

}