part of 'search_tv_series_bloc.dart';

@freezed
abstract class SearchTvSeriesEvent with _$SearchTvSeriesEvent {
  const factory SearchTvSeriesEvent.onQueryChanged(String query) = _OnQueryChanged;
}