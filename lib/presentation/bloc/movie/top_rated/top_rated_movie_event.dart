part of 'top_rated_movie_bloc.dart';

@freezed
abstract class TopRatedMovieEvent with _$TopRatedMovieEvent {
  const factory TopRatedMovieEvent.fetchTopRatedMovies() = _FetchTopRatedMovies;
}