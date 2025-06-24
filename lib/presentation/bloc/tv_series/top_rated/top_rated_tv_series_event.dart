part of 'top_rated_tv_series_bloc.dart';

@freezed
abstract class TopRatedTvSeriesEvent with _$TopRatedTvSeriesEvent {
  const factory TopRatedTvSeriesEvent.fetchTopRatedTvSeries() = _FetchTopRatedTvSeries;
}