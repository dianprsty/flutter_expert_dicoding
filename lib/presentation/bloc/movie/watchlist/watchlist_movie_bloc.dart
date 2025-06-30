import 'package:bloc/bloc.dart';
import '../../../../common/state_enum.dart';
import '../../../../domain/entities/movie.dart';
import '../../../../domain/usecases/movies/get_watchlist_movies.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'watchlist_movie_event.dart';
part 'watchlist_movie_state.dart';
part 'watchlist_movie_bloc.freezed.dart';

class WatchlistMovieBloc
    extends Bloc<WatchlistMovieEvent, WatchlistMovieState> {
  final GetWatchlistMovies getWatchlistMovies;

  WatchlistMovieBloc({required this.getWatchlistMovies})
    : super(WatchlistMovieState.initial()) {
    on<_FetchWatchlistMovies>((event, emit) async {
      emit(state.copyWith(requestState: RequestState.Loading));

      final result = await getWatchlistMovies.execute();
      result.fold(
        (failure) => emit(
          state.copyWith(
            requestState: RequestState.Error,
            message: failure.message,
          ),
        ),
        (moviesData) => emit(
          state.copyWith(
            requestState: RequestState.Loaded,
            watchlistMovies: moviesData,
          ),
        ),
      );
    });
  }
}
