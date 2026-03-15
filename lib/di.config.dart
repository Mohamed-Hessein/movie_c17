// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import 'core/api/api_manager.dart' as _i237;
import 'core/resources/internet_checker.dart' as _i228;
import 'features/auth/data/data_source/firebase_auth_ds.dart' as _i809;
import 'features/auth/data/data_source/firebase_auth_ds_impl.dart' as _i276;
import 'features/auth/data/repo/firebase_auth_repo_impl.dart' as _i110;
import 'features/auth/domain/repo/firebase_fun_repo.dart' as _i55;
import 'features/auth/domain/usecase/log_in_usecase.dart' as _i463;
import 'features/auth/domain/usecase/signUp_usecase.dart' as _i481;
import 'features/auth/presentation/bloc/firebase_auth_cubit.dart' as _i34;
import 'features/browser/data/data_source/browser_ds.dart' as _i369;
import 'features/browser/data/data_source/browser_ds_impl.dart' as _i343;
import 'features/browser/data/repo/browsr_repo_impl.dart' as _i853;
import 'features/browser/domain/repo/browser_repo.dart' as _i703;
import 'features/browser/domain/usercase/browser_usecase.dart' as _i407;
import 'features/browser/persentation/bloc/browser_bloc.dart' as _i609;
import 'features/details/data/data_source/local/details__local_ds_impl.dart'
    as _i850;
import 'features/details/data/data_source/local/details_local_ds.dart' as _i967;
import 'features/details/data/data_source/remote/details_ds.dart' as _i6;
import 'features/details/data/data_source/remote/details_ds_impl.dart' as _i700;
import 'features/details/data/data_source/remote/suggestions_ds_impl.dart'
    as _i598;
import 'features/details/data/data_source/remote/suggetsion_ds.dart' as _i725;
import 'features/details/data/repo/details_local_impl.dart' as _i338;
import 'features/details/data/repo/details_repo_impl.dart' as _i894;
import 'features/details/data/repo/suggestion_repo_impl.dart' as _i296;
import 'features/details/domain/repo/dateils_local_repo.dart' as _i739;
import 'features/details/domain/repo/details_repo.dart' as _i700;
import 'features/details/domain/repo/suggetsion_repo.dart' as _i1033;
import 'features/details/domain/usecase/datails_local_usecase.dart' as _i652;
import 'features/details/domain/usecase/details_use_case.dart' as _i583;
import 'features/details/domain/usecase/suggestion_local_usecase.dart' as _i236;
import 'features/details/domain/usecase/suggestion_usercase.dart' as _i580;
import 'features/details/presentation/Bloc/details_bloc.dart' as _i1043;
import 'features/edit_profile/data/data_source/remote/update_user_ds.dart'
    as _i129;
import 'features/edit_profile/data/data_source/remote/update_user_ds_impl.dart'
    as _i957;
import 'features/edit_profile/data/repo/update_user_repo_impl.dart' as _i461;
import 'features/edit_profile/domain/repo/update_user_repo.dart' as _i558;
import 'features/edit_profile/domain/usecase/update_user_usecase.dart' as _i229;
import 'features/edit_profile/presetation/bloc/update_user_bloc.dart' as _i433;
import 'features/home/data/data_source/local/movie_local_ds.dart' as _i934;
import 'features/home/data/data_source/local/movie_local_ds_impl.dart' as _i795;
import 'features/home/data/data_source/remot/movies_ds.dart' as _i950;
import 'features/home/data/data_source/remot/movies_ds_impl.dart' as _i1050;
import 'features/home/data/repo/movie_local_repo_impl.dart' as _i43;
import 'features/home/data/repo/movies_repo_impl.dart' as _i558;
import 'features/home/domain/repo/move_repo.dart' as _i1064;
import 'features/home/domain/repo/movie_local_repo.dart' as _i991;
import 'features/home/domain/usecase/movie_local_usecase.dart' as _i1050;
import 'features/home/domain/usecase/movies_use_case.dart' as _i1064;
import 'features/home/presentation/bloc/home_bloc.dart' as _i123;
import 'features/profile/data/data_sourc/remote/fav_ds.dart' as _i74;
import 'features/profile/data/data_sourc/remote/fav_ds_impl.dart' as _i540;
import 'features/profile/data/data_sourc/remote/firebase_history_ds.dart'
    as _i176;
import 'features/profile/data/data_sourc/remote/firebase_history_ds_impl.dart'
    as _i359;
import 'features/profile/data/data_sourc/remote/get_history_ds.dart' as _i224;
import 'features/profile/data/data_sourc/remote/get_history_ds_ipm.dart'
    as _i81;
import 'features/profile/data/data_sourc/remote/set_fav_ds.dart' as _i733;
import 'features/profile/data/data_sourc/remote/set_fav_ds_impl.dart' as _i832;
import 'features/profile/data/data_sourc/remote/user_ds.dart' as _i404;
import 'features/profile/data/data_sourc/remote/user_ds_impl.dart' as _i249;
import 'features/profile/data/data_sourc/repo/fav_repo_impl.dart' as _i452;
import 'features/profile/data/data_sourc/repo/get_history_repo_impl.dart'
    as _i620;
import 'features/profile/data/data_sourc/repo/save_history_repo_impl.dart'
    as _i632;
import 'features/profile/data/data_sourc/repo/set_fav_repo_impl.dart' as _i542;
import 'features/profile/data/data_sourc/repo/user_repo_impl.dart' as _i950;
import 'features/profile/domain/repo/favorite_repo.dart' as _i455;
import 'features/profile/domain/repo/get_history_repo.dart' as _i71;
import 'features/profile/domain/repo/get_user_repo.dart' as _i1053;
import 'features/profile/domain/repo/history_rep.dart' as _i24;
import 'features/profile/domain/repo/set_fav_repo.dart' as _i229;
import 'features/profile/domain/usecase/create_collection_usecase.dart'
    as _i181;
import 'features/profile/domain/usecase/fav_usecase.dart' as _i331;
import 'features/profile/domain/usecase/get_history_usecase.dart' as _i448;
import 'features/profile/domain/usecase/get_user_usecase.dart' as _i81;
import 'features/profile/domain/usecase/history_usecase.dart' as _i383;
import 'features/profile/domain/usecase/set_fav_usecase.dart' as _i1057;
import 'features/profile/domain/usecase/set_user_usecase.dart' as _i863;
import 'features/profile/domain/usecase/update_fav.dart' as _i374;
import 'features/profile/presentation/bloc/fav_bloc.dart' as _i814;
import 'features/profile/presentation/bloc/history_bloc.dart' as _i750;
import 'features/profile/presentation/bloc/user_bloc.dart' as _i46;
import 'features/search/data/data_source/search_ds_impl.dart' as _i234;
import 'features/search/data/data_source/serach_ds.dart' as _i561;
import 'features/search/data/repo/search_repo_impl.dart' as _i541;
import 'features/search/domain/repo/search_repo.dart' as _i623;
import 'features/search/domain/usecase/search_usecase.dart' as _i1044;
import 'features/search/presention/bloc/search_bloc.dart' as _i206;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.singleton<_i228.InternetConnectivity>(
      () => _i228.InternetConnectivity(),
    );
    gh.lazySingleton<_i237.ApiManager>(() => _i237.ApiManager());
    gh.factory<_i733.SetFavDs>(() => _i832.SetFavDsImpl());
    gh.factory<_i74.FavDs>(() => _i540.FavDsImpl());
    gh.factory<_i934.MovieLocalDs>(() => _i795.MovieLocalDsImpl());
    gh.lazySingleton<_i404.UserDs>(() => _i249.UserDsImpl());
    gh.lazySingleton<_i176.FirebaseHistoryDs>(
      () => _i359.FirebaseHistoryDsImpl(),
    );
    gh.factory<_i725.SuggetsionDs>(
      () => _i598.SuggestionsDsImpl(gh<_i237.ApiManager>()),
    );
    gh.factory<_i369.BrowserDs>(
      () => _i343.BrowserDsImpl(gh<_i237.ApiManager>()),
    );
    gh.factory<_i991.MovieLocalRepo>(
      () => _i43.MovieLocalRepoImpl(gh<_i934.MovieLocalDs>()),
    );
    gh.factory<_i967.DetailsLocalDs>(() => _i850.DetailsDsImpl());
    gh.factory<_i24.HistoryRep>(
      () => _i632.SaveHistoryRepoImpl(gh<_i176.FirebaseHistoryDs>()),
    );
    gh.factory<_i6.DetailsDs>(
      () => _i700.DetailsDsImpl(gh<_i237.ApiManager>()),
    );
    gh.factory<_i809.FirebaseAuthDs>(() => _i276.FirebaseAuthDsImpl());
    gh.factory<_i224.GetHistoryDs>(
      () => _i81.GetHistoryDsIpm(gh<_i176.FirebaseHistoryDs>()),
    );
    gh.factory<_i561.SearchDs>(
      () => _i234.SearchDsImpl(gh<_i237.ApiManager>()),
    );
    gh.factory<_i1033.SuggetsionRepo>(
      () => _i296.SuggestionRepoImpl(gh<_i725.SuggetsionDs>()),
    );
    gh.factory<_i700.DetailsRepo>(
      () => _i894.DetailsRepoImpl(gh<_i6.DetailsDs>()),
    );
    gh.factory<_i950.MoviesRemoteDs>(
      () => _i1050.MoviesRemoteDsImpl(gh<_i237.ApiManager>()),
    );
    gh.factory<_i383.HistoryUsecase>(
      () => _i383.HistoryUsecase(gh<_i24.HistoryRep>()),
    );
    gh.factory<_i1053.UserRepo>(() => _i950.UserRepoImpl(gh<_i404.UserDs>()));
    gh.factory<_i455.FavoriteRepo>(() => _i452.FavRepoImpl(gh<_i74.FavDs>()));
    gh.factory<_i129.UpdateUserDs>(
      () => _i957.UpdateUserDsImpl(gh<_i404.UserDs>()),
    );
    gh.factory<_i1064.MoviesRepo>(
      () => _i558.MoviesRepoImpl(gh<_i950.MoviesRemoteDs>()),
    );
    gh.factory<_i1050.MovieLocalUsecase>(
      () => _i1050.MovieLocalUsecase(
        gh<_i991.MovieLocalRepo>(),
        gh<_i934.MovieLocalDs>(),
      ),
    );
    gh.factory<_i580.SuggestionUsercase>(
      () => _i580.SuggestionUsercase(gh<_i1033.SuggetsionRepo>()),
    );
    gh.factory<_i739.DateilsLocalRepo>(
      () => _i338.DetailsLocalImpl(gh<_i967.DetailsLocalDs>()),
    );
    gh.factory<_i181.CreateCollectionUsecase>(
      () => _i181.CreateCollectionUsecase(gh<_i1053.UserRepo>()),
    );
    gh.factory<_i81.GetUserUsecase>(
      () => _i81.GetUserUsecase(gh<_i1053.UserRepo>()),
    );
    gh.factory<_i863.SetUserUsecase>(
      () => _i863.SetUserUsecase(gh<_i1053.UserRepo>()),
    );
    gh.factory<_i71.GetHistoryRepo>(
      () => _i620.GetHistoryRepoImpl(gh<_i224.GetHistoryDs>()),
    );
    gh.factory<_i229.SetFavRepo>(
      () => _i542.SetFavRepoImpl(gh<_i733.SetFavDs>()),
    );
    gh.factory<_i703.BrowserRepo>(
      () => _i853.BrowsrRepoImpl(gh<_i369.BrowserDs>()),
    );
    gh.factory<_i652.DatailsLocalUsecase>(
      () => _i652.DatailsLocalUsecase(gh<_i739.DateilsLocalRepo>()),
    );
    gh.factory<_i236.SuggestionLocalUsecase>(
      () => _i236.SuggestionLocalUsecase(gh<_i739.DateilsLocalRepo>()),
    );
    gh.factory<_i583.DetailsUseCase>(
      () => _i583.DetailsUseCase(gh<_i700.DetailsRepo>()),
    );
    gh.factory<_i623.SearchRepo>(
      () => _i541.SearchRepoImpl(gh<_i561.SearchDs>()),
    );
    gh.factory<_i558.UpdateUserRepo>(
      () => _i461.UpdateUserRepoImpl(gh<_i129.UpdateUserDs>()),
    );
    gh.factory<_i55.FirebaseFunRepo>(
      () => _i110.FirebaseAuthRepoImpl(gh<_i809.FirebaseAuthDs>()),
    );
    gh.factory<_i407.BrowserUsecase>(
      () => _i407.BrowserUsecase(gh<_i703.BrowserRepo>()),
    );
    gh.lazySingleton<_i46.UserBloc>(
      () => _i46.UserBloc(
        gh<_i404.UserDs>(),
        gh<_i863.SetUserUsecase>(),
        gh<_i181.CreateCollectionUsecase>(),
        gh<_i81.GetUserUsecase>(),
      ),
    );
    gh.factory<_i1064.MoviesUseCase>(
      () => _i1064.MoviesUseCase(gh<_i1064.MoviesRepo>()),
    );
    gh.factory<_i123.HomeBloc>(
      () => _i123.HomeBloc(
        gh<_i1064.MoviesUseCase>(),
        gh<_i1050.MovieLocalUsecase>(),
      ),
    );
    gh.factory<_i331.FavUsecase>(
      () => _i331.FavUsecase(gh<_i455.FavoriteRepo>()),
    );
    gh.factory<_i374.UpdateFavUseCase>(
      () => _i374.UpdateFavUseCase(gh<_i455.FavoriteRepo>()),
    );
    gh.factory<_i1057.SetFavUsecase>(
      () => _i1057.SetFavUsecase(gh<_i229.SetFavRepo>()),
    );
    gh.factory<_i463.LogInUsecase>(
      () => _i463.LogInUsecase(gh<_i55.FirebaseFunRepo>()),
    );
    gh.factory<_i481.SignupUsecase>(
      () => _i481.SignupUsecase(gh<_i55.FirebaseFunRepo>()),
    );
    gh.factory<_i34.FirebaseAuthCubit>(
      () => _i34.FirebaseAuthCubit(
        gh<_i463.LogInUsecase>(),
        gh<_i481.SignupUsecase>(),
      ),
    );
    gh.factory<_i609.BrowserBloc>(
      () => _i609.BrowserBloc(gh<_i407.BrowserUsecase>()),
    );
    gh.factory<_i448.GetHistoryUsecase>(
      () => _i448.GetHistoryUsecase(gh<_i71.GetHistoryRepo>()),
    );
    gh.factory<_i1044.SearchUsecase>(
      () => _i1044.SearchUsecase(gh<_i623.SearchRepo>()),
    );
    gh.factory<_i229.UpdateUserUsecase>(
      () => _i229.UpdateUserUsecase(gh<_i558.UpdateUserRepo>()),
    );
    gh.factory<_i814.FavBloc>(
      () => _i814.FavBloc(
        gh<_i1057.SetFavUsecase>(),
        gh<_i583.DetailsUseCase>(),
        gh<_i331.FavUsecase>(),
      ),
    );
    gh.factory<_i433.UpdateUserBloc>(
      () => _i433.UpdateUserBloc(gh<_i229.UpdateUserUsecase>()),
    );
    gh.factory<_i1043.DetailsBloc>(
      () => _i1043.DetailsBloc(
        gh<_i652.DatailsLocalUsecase>(),
        gh<_i236.SuggestionLocalUsecase>(),
        gh<_i331.FavUsecase>(),
        gh<_i374.UpdateFavUseCase>(),
        gh<_i583.DetailsUseCase>(),
        gh<_i580.SuggestionUsercase>(),
        gh<_i1057.SetFavUsecase>(),
      ),
    );
    gh.factory<_i750.HistoryBloc>(
      () => _i750.HistoryBloc(
        gh<_i383.HistoryUsecase>(),
        gh<_i448.GetHistoryUsecase>(),
        gh<_i583.DetailsUseCase>(),
      ),
    );
    gh.factory<_i206.SearchBloc>(
      () => _i206.SearchBloc(gh<_i1044.SearchUsecase>()),
    );
    return this;
  }
}
