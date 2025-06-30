import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../common/state_enum.dart';
import '../../../../domain/entities/movie.dart';
import '../../../../domain/entities/movie_detail.dart';
import '../../../../domain/usecases/movies/get_movie_detail.dart';
import '../../../../domain/usecases/movies/get_movie_recommendations.dart';
import '../../../../domain/usecases/movies/get_watchlist_status.dart';
import '../../../../domain/usecases/movies/remove_watchlist.dart';
import '../../../../domain/usecases/movies/save_watchlist.dart';

part 'movie_detail_event.dart';
part 'movie_detail_state.dart';
part 'movie_detail_bloc.freezed.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  final GetMovieDetail _getMovieDetail;
  final GetMovieRecommendations _getMovieRecommendations;
  final GetWatchListStatus _getWatchListStatus;
  final SaveWatchlist _saveWatchlist;
  final RemoveWatchlist _removeWatchlist;

  static const watchlistAddSuccessMessage = 'Added to Watchlist';
  static const watchlistRemoveSuccessMessage = 'Removed from Watchlist';

  MovieDetailBloc({
    required GetMovieDetail getMovieDetail,
    required GetMovieRecommendations getMovieRecommendations,
    required GetWatchListStatus getWatchListStatus,
    required SaveWatchlist saveWatchlist,
    required RemoveWatchlist removeWatchlist,
  }) : _getMovieDetail = getMovieDetail,
       _getMovieRecommendations = getMovieRecommendations,
       _getWatchListStatus = getWatchListStatus,
       _saveWatchlist = saveWatchlist,
       _removeWatchlist = removeWatchlist,
       super(MovieDetailState()) {
    on<_FetchMovieDetail>(_fetchMovieDetail);
    on<_AddWatchlist>(_addWatchlist);
    on<_RemoveFromWatchlist>(_removeFromWatchlist);
    on<_LoadWatchlistStatus>(_loadWatchlistStatus);
  }

  void _fetchMovieDetail(_FetchMovieDetail event, emit) async {
    final id = event.id;

    emit(state.copyWith(movieState: RequestState.Loading));

    final detailResult = await _getMovieDetail.execute(id);
    final recommendationResult = await _getMovieRecommendations.execute(id);

    detailResult.fold(
      (failure) {
        emit(
          state.copyWith(
            movieState: RequestState.Error,
            message: failure.message,
          ),
        );
      },
      (movie) {
        recommendationResult.fold(
          (failure) {
            emit(
              state.copyWith(
                movieState: RequestState.Loaded,
                movieDetail: movie,
                recommendationState: RequestState.Error,
                message: failure.message,
              ),
            );
          },
          (recommendations) {
            emit(
              state.copyWith(
                movieState: RequestState.Loaded,
                movieDetail: movie,
                recommendationState: RequestState.Loaded,
                movieRecommendations: recommendations,
              ),
            );
          },
        );
      },
    );
  }

  void _addWatchlist(_AddWatchlist event, emit) async {
    final movie = event.movie;

    final result = await _saveWatchlist.execute(movie);

    await result.fold(
      (failure) async {
        final watchlistStatus = await _getWatchListStatus.execute(movie.id);
        emit(
          state.copyWith(
            watchlistMessage: failure.message,
            isAddedToWatchlist: watchlistStatus,
          ),
        );
      },
      (successMessage) async {
        final watchlistStatus = await _getWatchListStatus.execute(movie.id);
        emit(
          state.copyWith(
            watchlistMessage: watchlistAddSuccessMessage,
            isAddedToWatchlist: watchlistStatus,
          ),
        );
      },
    );
  }

  void _removeFromWatchlist(_RemoveFromWatchlist event, emit) async {
    final movie = event.movie;

    final result = await _removeWatchlist.execute(movie);

    await result.fold(
      (failure) async {
        final watchlistStatus = await _getWatchListStatus.execute(movie.id);
        emit(
          state.copyWith(
            watchlistMessage: failure.message,
            isAddedToWatchlist: watchlistStatus,
          ),
        );
      },
      (successMessage) async {
        final watchlistStatus = await _getWatchListStatus.execute(movie.id);
        emit(
          state.copyWith(
            watchlistMessage: watchlistRemoveSuccessMessage,
            isAddedToWatchlist: watchlistStatus,
          ),
        );
      },
    );
  }

  void _loadWatchlistStatus(_LoadWatchlistStatus event, emit) async {
    final id = event.id;

    final result = await _getWatchListStatus.execute(id);
    emit(state.copyWith(isAddedToWatchlist: result));
  }
}
