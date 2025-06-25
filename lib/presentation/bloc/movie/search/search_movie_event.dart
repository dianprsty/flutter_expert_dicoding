part of 'search_movie_bloc.dart';

@freezed
abstract class SearchMovieEvent with _$SearchMovieEvent {
  const factory SearchMovieEvent.onQueryChanged(String query) = _OnQueryChanged;
}