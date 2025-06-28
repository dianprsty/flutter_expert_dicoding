part of 'movie_detail_bloc.dart';

@freezed
abstract class MovieDetailState with _$MovieDetailState {
  factory MovieDetailState({
    @Default(RequestState.Empty) RequestState movieState,
    @Default(null) MovieDetail? movieDetail,
    @Default(RequestState.Empty) RequestState recommendationState,
    @Default([]) List<Movie> movieRecommendations,
    @Default(false) bool isAddedToWatchlist,
    @Default('') String message,
    @Default('') String watchlistMessage,
  }) = _MovieDetailState;
}
