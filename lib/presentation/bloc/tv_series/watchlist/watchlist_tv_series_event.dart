part of 'watchlist_tv_series_bloc.dart';

@freezed
abstract class WatchlistTvSeriesEvent with _$WatchlistTvSeriesEvent {
  const factory WatchlistTvSeriesEvent.fetchWatchlistTvSeries() = _FetchWatchlistTvSeries;
}