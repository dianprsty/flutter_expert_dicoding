import 'package:bloc/bloc.dart';
import '../../../../common/state_enum.dart';
import '../../../../domain/entities/movie.dart';
import '../../../../domain/usecases/movies/get_top_rated_movies.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'top_rated_movie_event.dart';
part 'top_rated_movie_state.dart';
part 'top_rated_movie_bloc.freezed.dart';

class TopRatedMovieBloc extends Bloc<TopRatedMovieEvent, TopRatedMovieState> {
  final GetTopRatedMovies _getTopRatedMovies;

  TopRatedMovieBloc({required GetTopRatedMovies getTopRatedMovies})
    : _getTopRatedMovies = getTopRatedMovies,
      super(TopRatedMovieState()) {
    on<_FetchTopRatedMovies>(_fetchTopRatedMovies);
  }

  void _fetchTopRatedMovies(_FetchTopRatedMovies event, emit) async {
    emit(state.copyWith(requestState: RequestState.Loading));

    final result = await _getTopRatedMovies.execute();

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
