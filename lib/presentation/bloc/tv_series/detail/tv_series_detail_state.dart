part of 'tv_series_detail_bloc.dart';

@freezed
abstract class TvSeriesDetailState with _$TvSeriesDetailState {
  factory TvSeriesDetailState({
    @Default(RequestState.Empty) RequestState tvSeriesState,
    @Default(null) TvSeriesDetail? tvSeriesDetail,
    @Default(RequestState.Empty) RequestState recommendationState,
    @Default([]) List<TvSeries> tvSeriesRecommendations,
    @Default(false) bool isAddedToWatchlist,
    @Default('') String message,
    @Default('') String watchlistMessage,
  }) = _TvSeriesDetailState;
}