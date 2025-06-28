part of 'popular_tv_series_bloc.dart';

@freezed
abstract class PopularTvSeriesState with _$PopularTvSeriesState {
  factory PopularTvSeriesState({
    @Default(RequestState.Empty) RequestState requestState,
    @Default([]) List<TvSeries> tvSeries,
    @Default('') String message,
  }) = _PopularTvSeriesState;
}
