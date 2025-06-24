part of 'top_rated_tv_series_bloc.dart';

@freezed
abstract class TopRatedTvSeriesState with _$TopRatedTvSeriesState {
  factory TopRatedTvSeriesState({
    @Default(RequestState.Empty) RequestState requestState,
    @Default([]) List<TvSeries> tvSeries,
    @Default('') String message,
  }) = _TopRatedTvSeriesState;
}