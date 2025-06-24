part of 'watchlist_tv_series_bloc.dart';

@freezed
abstract class WatchlistTvSeriesState with _$WatchlistTvSeriesState {
  factory WatchlistTvSeriesState({
    @Default(RequestState.Empty) RequestState requestState,
    @Default([]) List<TvSeries> watchlistTvSeries,
    @Default('') String message,
  }) = _WatchlistTvSeriesState;
  
  factory WatchlistTvSeriesState.initial() => WatchlistTvSeriesState();
}