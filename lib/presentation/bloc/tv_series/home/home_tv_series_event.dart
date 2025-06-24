part of 'home_tv_series_bloc.dart';

@freezed
class HomeTvSeriesEvent with _$HomeTvSeriesEvent {
  const factory HomeTvSeriesEvent.fetchOnTheAirTvSeries() =
      _FetchOnTheAirTvSeries;
  const factory HomeTvSeriesEvent.fetchPopularTvSeries() =
      _FetchPopularTvSeries;
  const factory HomeTvSeriesEvent.fetchTopRatedTvSeries() =
      _FetchTopRatedTvSeries;
}