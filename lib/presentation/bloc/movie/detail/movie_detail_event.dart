part of 'movie_detail_bloc.dart';

@freezed
abstract class MovieDetailEvent with _$MovieDetailEvent {
  const factory MovieDetailEvent.fetchMovieDetail(int id) = _FetchMovieDetail;
  const factory MovieDetailEvent.addWatchlist(MovieDetail movie) =
      _AddWatchlist;
  const factory MovieDetailEvent.removeFromWatchlist(MovieDetail movie) =
      _RemoveFromWatchlist;
  const factory MovieDetailEvent.loadWatchlistStatus(int id) =
      _LoadWatchlistStatus;
}
