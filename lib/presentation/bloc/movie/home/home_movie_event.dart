part of 'home_movie_bloc.dart';

@freezed
class HomeMovieEvent with _$HomeMovieEvent {
  const factory HomeMovieEvent.fetchNowPlayingMovies() =
      _FetchNowPlayingMovies;
  const factory HomeMovieEvent.fetchPopularMovies() =
      _FetchPopularMovies;
  const factory HomeMovieEvent.fetchTopRatedMovies() =
      _FetchTopRatedMovies;
}