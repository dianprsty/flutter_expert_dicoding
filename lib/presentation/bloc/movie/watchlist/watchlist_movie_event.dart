part of 'watchlist_movie_bloc.dart';

@freezed
class WatchlistMovieEvent with _$WatchlistMovieEvent {
  const factory WatchlistMovieEvent.fetchWatchlistMovies() =
      _FetchWatchlistMovies;
}
