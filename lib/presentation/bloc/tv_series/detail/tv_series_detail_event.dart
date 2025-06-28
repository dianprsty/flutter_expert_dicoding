part of 'tv_series_detail_bloc.dart';

@freezed
abstract class TvSeriesDetailEvent with _$TvSeriesDetailEvent {
  const factory TvSeriesDetailEvent.fetchTvSeriesDetail(int id) =
      _FetchTvSeriesDetail;
  const factory TvSeriesDetailEvent.addWatchlist(TvSeriesDetail tvSeries) =
      _AddWatchlist;
  const factory TvSeriesDetailEvent.removeFromWatchlist(
    TvSeriesDetail tvSeries,
  ) = _RemoveFromWatchlist;
  const factory TvSeriesDetailEvent.loadWatchlistStatus(int id) =
      _LoadWatchlistStatus;
}
