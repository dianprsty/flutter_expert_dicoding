part of 'top_rated_movie_bloc.dart';

@freezed
abstract class TopRatedMovieState with _$TopRatedMovieState {
  factory TopRatedMovieState({
    @Default(RequestState.Empty) RequestState requestState,
    @Default([]) List<Movie> movies,
    @Default('') String message,
  }) = _TopRatedMovieState;
}