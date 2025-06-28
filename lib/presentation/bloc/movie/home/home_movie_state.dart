part of 'home_movie_bloc.dart';

@freezed
abstract class HomeMovieState with _$HomeMovieState {
  factory HomeMovieState({
    @Default(RequestState.Empty) RequestState nowPlayingState,
    @Default([]) List<Movie> nowPlayingMovies,

    @Default(RequestState.Empty) RequestState popularState,
    @Default([]) List<Movie> popularMovies,

    @Default(RequestState.Empty) RequestState topRatedState,
    @Default([]) List<Movie> topRatedMovies,
    @Default('') String message,
  }) = _HomeMovieState;
}
