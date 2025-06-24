part of 'popular_tv_series_bloc.dart';

@freezed
class PopularTvSeriesEvent with _$PopularTvSeriesEvent {
  const factory PopularTvSeriesEvent.fetchPopularTvSeries() =
      _FetchPopularTvSeries;
}