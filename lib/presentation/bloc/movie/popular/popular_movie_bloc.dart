import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../common/state_enum.dart';
import '../../../../domain/entities/movie.dart';
import '../../../../domain/usecases/movies/get_popular_movies.dart';

part 'popular_movie_event.dart';
part 'popular_movie_state.dart';
part 'popular_movie_bloc.freezed.dart';

class PopularMovieBloc extends Bloc<PopularMovieEvent, PopularMovieState> {
  final GetPopularMovies _getPopularMovies;
  PopularMovieBloc({required GetPopularMovies getPopularMovies})
    : _getPopularMovies = getPopularMovies,
      super(PopularMovieState()) {
    on<_FetchPopularMovies>(_fetchPopularMovies);
  }

  void _fetchPopularMovies(_FetchPopularMovies event, emit) async {
    emit(state.copyWith(requestState: RequestState.Loading));

    final result = await _getPopularMovies.execute();

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            requestState: RequestState.Error,
            message: failure.message,
          ),
        );
      },
      (moviesData) {
        emit(
          state.copyWith(requestState: RequestState.Loaded, movies: moviesData),
        );
      },
    );
  }
}
