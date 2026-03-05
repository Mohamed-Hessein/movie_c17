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
import 'features/browser/data/data_source/browser_ds.dart' as _i369;
import 'features/browser/data/data_source/browser_ds_impl.dart' as _i343;
import 'features/browser/data/repo/browsr_repo_impl.dart' as _i853;
import 'features/browser/domain/repo/browser_repo.dart' as _i703;
import 'features/browser/domain/usercase/browser_usecase.dart' as _i407;
import 'features/browser/persentation/bloc/browser_bloc.dart' as _i609;
import 'features/details/data/data_source/remote/details_ds.dart' as _i6;
import 'features/details/data/data_source/remote/details_ds_impl.dart' as _i700;
import 'features/details/data/data_source/remote/suggestions_ds_impl.dart'
    as _i598;
import 'features/details/data/data_source/remote/suggetsion_ds.dart' as _i725;
import 'features/details/data/repo/details_repo_impl.dart' as _i894;
import 'features/details/data/repo/suggestion_repo_impl.dart' as _i296;
import 'features/details/domain/repo/details_repo.dart' as _i700;
import 'features/details/domain/repo/suggetsion_repo.dart' as _i1033;
import 'features/details/domain/usecase/details_use_case.dart' as _i583;
import 'features/details/domain/usecase/suggestion_usercase.dart' as _i580;
import 'features/details/presentation/Bloc/details_bloc.dart' as _i1043;
import 'features/home/data/data_source/remot/movies_ds.dart' as _i950;
import 'features/home/data/data_source/remot/movies_ds_impl.dart' as _i1050;
import 'features/home/data/repo/movies_repo_impl.dart' as _i558;
import 'features/home/domain/repo/move_repo.dart' as _i1064;
import 'features/home/domain/usecase/movies_use_case.dart' as _i1064;
import 'features/home/presentation/bloc/home_bloc.dart' as _i123;
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
    gh.lazySingleton<_i237.ApiManager>(() => _i237.ApiManager());
    gh.factory<_i725.SuggetsionDs>(
      () => _i598.SuggestionsDsImpl(gh<_i237.ApiManager>()),
    );
    gh.factory<_i369.BrowserDs>(
      () => _i343.BrowserDsImpl(gh<_i237.ApiManager>()),
    );
    gh.factory<_i6.DetailsDs>(
      () => _i700.DetailsDsImpl(gh<_i237.ApiManager>()),
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
    gh.factory<_i1064.MoviesRepo>(
      () => _i558.MoviesRepoImpl(gh<_i950.MoviesRemoteDs>()),
    );
    gh.factory<_i580.SuggestionUsercase>(
      () => _i580.SuggestionUsercase(gh<_i1033.SuggetsionRepo>()),
    );
    gh.factory<_i703.BrowserRepo>(
      () => _i853.BrowsrRepoImpl(gh<_i369.BrowserDs>()),
    );
    gh.factory<_i583.DetailsUseCase>(
      () => _i583.DetailsUseCase(gh<_i700.DetailsRepo>()),
    );
    gh.factory<_i623.SearchRepo>(
      () => _i541.SearchRepoImpl(gh<_i561.SearchDs>()),
    );
    gh.factory<_i407.BrowserUsecase>(
      () => _i407.BrowserUsecase(gh<_i703.BrowserRepo>()),
    );
    gh.factory<_i1064.MoviesUseCase>(
      () => _i1064.MoviesUseCase(gh<_i1064.MoviesRepo>()),
    );
    gh.factory<_i1043.DetailsBloc>(
      () => _i1043.DetailsBloc(
        gh<_i583.DetailsUseCase>(),
        gh<_i580.SuggestionUsercase>(),
      ),
    );
    gh.factory<_i123.HomeBloc>(
      () => _i123.HomeBloc(gh<_i1064.MoviesUseCase>()),
    );
    gh.factory<_i609.BrowserBloc>(
      () => _i609.BrowserBloc(gh<_i407.BrowserUsecase>()),
    );
    gh.factory<_i1044.SearchUsecase>(
      () => _i1044.SearchUsecase(gh<_i623.SearchRepo>()),
    );
    gh.factory<_i206.SearchBloc>(
      () => _i206.SearchBloc(gh<_i1044.SearchUsecase>()),
    );
    return this;
  }
}
