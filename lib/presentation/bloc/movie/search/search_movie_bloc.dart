import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rxdart/rxdart.dart';

import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/entities/movie.dart';
import 'package:ditonton/domain/usecases/movies/search_movies.dart';

part 'search_movie_event.dart';
part 'search_movie_state.dart';
part 'search_movie_bloc.freezed.dart';

class SearchMovieBloc extends Bloc<SearchMovieEvent, SearchMovieState> {
  final SearchMovies _searchMovies;

  SearchMovieBloc({required SearchMovies searchMovies})
    : _searchMovies = searchMovies,
      super(SearchMovieState()) {
    on<_OnQueryChanged>(
      _onQueryChanged,
      transformer: _debounce(const Duration(milliseconds: 500)),
    );
  }

  EventTransformer<T> _debounce<T>(Duration duration) {
    return (events, mapper) => events.debounceTime(duration).flatMap(mapper);
  }

  void _onQueryChanged(_OnQueryChanged event, emit) async {
    final query = event.query;

    emit(state.copyWith(state: RequestState.Loading));

    final result = await _searchMovies.execute(query);

    result.fold(
      (failure) {
        emit(
          state.copyWith(state: RequestState.Error, message: failure.message),
        );
      },
      (data) {
        emit(state.copyWith(state: RequestState.Loaded, searchResult: data));
      },
    );
  }
}
