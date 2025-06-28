part of 'watchlist_movie_bloc.dart';

@freezed
abstract class WatchlistMovieState with _$WatchlistMovieState {
  const factory WatchlistMovieState({
    @Default(RequestState.Empty) RequestState requestState,
    @Default([]) List<Movie> watchlistMovies,
    @Default('') String message,
  }) = _WatchlistMovieState;

  factory WatchlistMovieState.initial() => WatchlistMovieState();
}
