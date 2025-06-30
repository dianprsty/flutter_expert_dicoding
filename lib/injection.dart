import 'presentation/bloc/movie/detail/movie_detail_bloc.dart';
import 'presentation/bloc/movie/home/home_movie_bloc.dart';
import 'presentation/bloc/movie/popular/popular_movie_bloc.dart';
import 'presentation/bloc/movie/search/search_movie_bloc.dart';
import 'presentation/bloc/movie/top_rated/top_rated_movie_bloc.dart';
import 'presentation/bloc/movie/watchlist/watchlist_movie_bloc.dart';
import 'presentation/bloc/tv_series/home/home_tv_series_bloc.dart';
import 'presentation/bloc/tv_series/popular/popular_tv_series_bloc.dart';
import 'presentation/bloc/tv_series/search/search_tv_series_bloc.dart';
import 'presentation/bloc/tv_series/top_rated/top_rated_tv_series_bloc.dart';
import 'presentation/bloc/tv_series/watchlist/watchlist_tv_series_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import 'data/datasources/db/database_helper.dart';
import 'data/datasources/movie_local_data_source.dart';
import 'data/datasources/movie_remote_data_source.dart';
import 'data/datasources/tv_series_local_data_source.dart';
import 'data/datasources/tv_series_remote_data_source.dart';
import 'data/repositories/movie_repository_impl.dart';
import 'data/repositories/tv_series_repository_impl.dart';
import 'domain/repositories/movie_repository.dart';
import 'domain/repositories/tv_series_repository.dart';
import 'domain/usecases/movies/get_movie_detail.dart';
import 'domain/usecases/movies/get_movie_recommendations.dart';
import 'domain/usecases/movies/get_now_playing_movies.dart';
import 'domain/usecases/movies/get_popular_movies.dart';
import 'domain/usecases/movies/get_top_rated_movies.dart';
import 'domain/usecases/movies/get_watchlist_movies.dart';
import 'domain/usecases/movies/get_watchlist_status.dart';
import 'domain/usecases/movies/remove_watchlist.dart';
import 'domain/usecases/movies/save_watchlist.dart';
import 'domain/usecases/movies/search_movies.dart';
import 'domain/usecases/tv_series/get_on_the_air_tv_series.dart';
import 'domain/usecases/tv_series/get_popular_tv_series.dart';
import 'domain/usecases/tv_series/get_top_rated_tv_series.dart';
import 'domain/usecases/tv_series/get_tv_series_detail.dart';
import 'domain/usecases/tv_series/get_tv_series_recommendations.dart';
import 'domain/usecases/tv_series/get_watchlist_tv_series.dart';
import 'domain/usecases/tv_series/get_watchlist_tv_status.dart';
import 'domain/usecases/tv_series/remove_watchlist_tv.dart';
import 'domain/usecases/tv_series/save_watchlist_tv.dart';
import 'domain/usecases/tv_series/search_tv_series.dart';
import 'presentation/bloc/tv_series/detail/tv_series_detail_bloc.dart';
import 'presentation/bloc/tv_series/on_the_air/on_the_air_tv_series_bloc.dart';

final locator = GetIt.instance;

void init() {
  // bloc
  locator.registerFactory<OnTheAirTvSeriesBloc>(
    () => OnTheAirTvSeriesBloc(getOnTheAirTvSeries: locator()),
  );

  locator.registerFactory<PopularTvSeriesBloc>(
    () => PopularTvSeriesBloc(getPopularTvSeries: locator()),
  );

  locator.registerFactory<TopRatedTvSeriesBloc>(
    () => TopRatedTvSeriesBloc(getTopRatedTvSeries: locator()),
  );

  locator.registerFactory<TvSeriesDetailBloc>(
    () => TvSeriesDetailBloc(
      getTvSeriesDetail: locator(),
      getTvSeriesRecommendations: locator(),
      getWatchListStatus: locator(),
      saveWatchlist: locator(),
      removeWatchlist: locator(),
    ),
  );

  locator.registerFactory<WatchlistTvSeriesBloc>(
    () => WatchlistTvSeriesBloc(getWatchlistTvSeries: locator()),
  );

  locator.registerFactory<WatchlistMovieBloc>(
    () => WatchlistMovieBloc(getWatchlistMovies: locator()),
  );

  locator.registerFactory<HomeTvSeriesBloc>(
    () => HomeTvSeriesBloc(
      getOnTheAirTvSeries: locator(),
      getPopularTvSeries: locator(),
      getTopRatedTvSeries: locator(),
    ),
  );

  locator.registerFactory<HomeMovieBloc>(
    () => HomeMovieBloc(
      getNowPlayingMovies: locator(),
      getPopularMovies: locator(),
      getTopRatedMovies: locator(),
    ),
  );

  locator.registerFactory<PopularMovieBloc>(
    () => PopularMovieBloc(getPopularMovies: locator()),
  );

  locator.registerFactory<TopRatedMovieBloc>(
    () => TopRatedMovieBloc(getTopRatedMovies: locator()),
  );

  locator.registerFactory<MovieDetailBloc>(
    () => MovieDetailBloc(
      getMovieDetail: locator(),
      getMovieRecommendations: locator(),
      getWatchListStatus: locator(),
      saveWatchlist: locator(),
      removeWatchlist: locator(),
    ),
  );

  locator.registerFactory<SearchTvSeriesBloc>(
    () => SearchTvSeriesBloc(searchTvSeries: locator()),
  );

  locator.registerFactory<SearchMovieBloc>(
    () => SearchMovieBloc(searchMovies: locator()),
  );

  // use case
  locator.registerLazySingleton(() => GetNowPlayingMovies(locator()));
  locator.registerLazySingleton(() => GetPopularMovies(locator()));
  locator.registerLazySingleton(() => GetTopRatedMovies(locator()));
  locator.registerLazySingleton(() => GetMovieDetail(locator()));
  locator.registerLazySingleton(() => GetMovieRecommendations(locator()));
  locator.registerLazySingleton(() => SearchMovies(locator()));
  locator.registerLazySingleton(() => GetWatchListStatus(locator()));
  locator.registerLazySingleton(() => SaveWatchlist(locator()));
  locator.registerLazySingleton(() => RemoveWatchlist(locator()));
  locator.registerLazySingleton(() => GetWatchlistMovies(locator()));
  locator.registerLazySingleton(() => GetOnTheAirTvSeries(locator()));
  locator.registerLazySingleton(() => GetPopularTvSeries(locator()));
  locator.registerLazySingleton(() => GetTopRatedTvSeries(locator()));
  locator.registerLazySingleton(() => GetTvSeriesDetail(locator()));
  locator.registerLazySingleton(() => GetTvSeriesRecommendations(locator()));
  locator.registerLazySingleton(() => SearchTvSeries(locator()));
  locator.registerLazySingleton(() => GetWatchlistTvStatus(locator()));
  locator.registerLazySingleton(() => SaveWatchlistTv(locator()));
  locator.registerLazySingleton(() => RemoveWatchlistTv(locator()));
  locator.registerLazySingleton(() => GetWatchlistTvSeries(locator()));

  // repository
  locator.registerLazySingleton<MovieRepository>(
    () => MovieRepositoryImpl(
      remoteDataSource: locator(),
      localDataSource: locator(),
    ),
  );
  locator.registerLazySingleton<TvSeriesRepository>(
    () => TvSeriesRepositoryImpl(
      remoteDataSource: locator(),
      localDataSource: locator(),
    ),
  );

  // data sources
  locator.registerLazySingleton<MovieRemoteDataSource>(
    () => MovieRemoteDataSourceImpl(client: locator()),
  );
  locator.registerLazySingleton<MovieLocalDataSource>(
    () => MovieLocalDataSourceImpl(databaseHelper: locator()),
  );
  locator.registerLazySingleton<TvSeriesRemoteDataSource>(
    () => TvSeriesRemoteDataSourceImpl(client: locator()),
  );
  locator.registerLazySingleton<TvSeriesLocalDataSource>(
    () => TvSeriesLocalDataSourceImpl(databaseHelper: locator()),
  );

  // helper
  locator.registerLazySingleton<DatabaseHelper>(() => DatabaseHelper());

  // external
  locator.registerLazySingleton(() => http.Client());
}
