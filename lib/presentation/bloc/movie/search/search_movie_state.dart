part of 'search_movie_bloc.dart';

@freezed
abstract class SearchMovieState with _$SearchMovieState {
  factory SearchMovieState({
    @Default(RequestState.Empty) RequestState state,
    @Default([]) List<Movie> searchResult,
    @Default('') String message,
  }) = _SearchMovieState;
}