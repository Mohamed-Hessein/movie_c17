import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:movie_c17_me/core/api/api_manager.dart';
import 'package:movie_c17_me/core/api/end_point.dart';
import 'package:movie_c17_me/features/browser/data/data_source/browser_ds.dart';
import 'package:movie_c17_me/features/details/data/model/details_model.dart';

import '../../../../core/api/api_manager.dart';
import '../../../../core/api/end_point.dart';
import '../../../search/data/model/search_model.dart';
import 'browser_ds.dart';

@Injectable(as:BrowserDs )
class BrowserDsImpl implements BrowserDs {
  ApiManager apiManager;
  BrowserDsImpl(this.apiManager);
  @override
  Future<SearchModel> getBrowser() async {
    final res = await apiManager.get(EndPoint.moviesList);


    SearchModel moviesFromApi =  SearchModel.fromJson(res.data);

    return moviesFromApi;
  }}