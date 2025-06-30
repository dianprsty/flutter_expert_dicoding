import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../common/state_enum.dart';
import '../../../../domain/entities/movie.dart';
import '../../../../domain/usecases/movies/search_movies.dart';

part 'search_movie_event.dart';
part 'search_movie_state.dart';
part 'search_movie_bloc.freezed.dart';

class SearchMovieBloc extends Bloc<SearchMovieEvent, SearchMovieState> {
  final SearchMovies _searchMovies;

  SearchMovieBloc({required SearchMovies searchMovies})
    : _searchMovies = searchMovies,
      super(SearchMovieState()) {
    on<_OnQueryChanged>(_onQueryChanged);
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
