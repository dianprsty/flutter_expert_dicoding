part of 'popular_movie_bloc.dart';

@freezed
abstract class PopularMovieState with _$PopularMovieState {
  factory PopularMovieState({
    @Default(RequestState.Empty) RequestState requestState,
    @Default([]) List<Movie> movies,
    @Default('') String message,
  }) = _PopularMovieState;
}