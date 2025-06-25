import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/entities/movie.dart';
import 'package:ditonton/domain/usecases/movies/get_now_playing_movies.dart';
import 'package:ditonton/domain/usecases/movies/get_popular_movies.dart';
import 'package:ditonton/domain/usecases/movies/get_top_rated_movies.dart';

part 'home_movie_event.dart';
part 'home_movie_state.dart';
part 'home_movie_bloc.freezed.dart';

class HomeMovieBloc extends Bloc<HomeMovieEvent, HomeMovieState> {
  final GetNowPlayingMovies _getNowPlayingMovies;
  final GetPopularMovies _getPopularMovies;
  final GetTopRatedMovies _getTopRatedMovies;

  HomeMovieBloc({
    required GetNowPlayingMovies getNowPlayingMovies,
    required GetPopularMovies getPopularMovies,
    required GetTopRatedMovies getTopRatedMovies,
  }) : _getNowPlayingMovies = getNowPlayingMovies,
       _getPopularMovies = getPopularMovies,
       _getTopRatedMovies = getTopRatedMovies,
       super(HomeMovieState()) {
    on<_FetchNowPlayingMovies>(_fetchNowPlayingMovies);
    on<_FetchPopularMovies>(_fetchPopularMovies);
    on<_FetchTopRatedMovies>(_fetchTopRatedMovies);
  }

  void _fetchNowPlayingMovies(_FetchNowPlayingMovies event, emit) async {
    emit(state.copyWith(nowPlayingState: RequestState.Loading));

    final result = await _getNowPlayingMovies.execute();

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            nowPlayingState: RequestState.Error,
            message: failure.message,
          ),
        );
      },
      (moviesData) {
        emit(
          state.copyWith(
            nowPlayingState: RequestState.Loaded,
            nowPlayingMovies: moviesData,
          ),
        );
      },
    );
  }

  void _fetchPopularMovies(_FetchPopularMovies event, emit) async {
    emit(state.copyWith(popularState: RequestState.Loading));

    final result = await _getPopularMovies.execute();

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            popularState: RequestState.Error,
            message: failure.message,
          ),
        );
      },
      (moviesData) {
        emit(
          state.copyWith(
            popularState: RequestState.Loaded,
            popularMovies: moviesData,
          ),
        );
      },
    );
  }

  void _fetchTopRatedMovies(_FetchTopRatedMovies event, emit) async {
    emit(state.copyWith(topRatedState: RequestState.Loading));

    final result = await _getTopRatedMovies.execute();

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            topRatedState: RequestState.Error,
            message: failure.message,
          ),
        );
      },
      (moviesData) {
        emit(
          state.copyWith(
            topRatedState: RequestState.Loaded,
            topRatedMovies: moviesData,
          ),
        );
      },
    );
  }
}