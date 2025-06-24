part of 'on_the_air_tv_series_bloc.dart';

@freezed
abstract class OnTheAirTvSeriesState with _$OnTheAirTvSeriesState {
  factory OnTheAirTvSeriesState({
    @Default(RequestState.Empty) RequestState requestState,
    @Default([]) List<TvSeries> tvSeries,
    @Default('') String message,
  }) = _OnTheAirState;
}
