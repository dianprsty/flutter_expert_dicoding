part of 'popular_movie_bloc.dart';

@freezed
abstract class PopularMovieEvent with _$PopularMovieEvent {
  const factory PopularMovieEvent.fetchPopularMovies() = _FetchPopularMovies;
}
