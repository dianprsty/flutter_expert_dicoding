part of 'search_tv_series_bloc.dart';

@freezed
abstract class SearchTvSeriesState with _$SearchTvSeriesState {
  factory SearchTvSeriesState({
    @Default(RequestState.Empty) RequestState state,
    @Default([]) List<TvSeries> searchResult,
    @Default('') String message,
  }) = _SearchTvSeriesState;
}
