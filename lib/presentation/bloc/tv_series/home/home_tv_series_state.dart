part of 'home_tv_series_bloc.dart';

@freezed
abstract class HomeTvSeriesState with _$HomeTvSeriesState {
  factory HomeTvSeriesState({
    @Default(RequestState.Empty) RequestState onTheAirState,
    @Default([]) List<TvSeries> onTheAirTvSeries,
    
    @Default(RequestState.Empty) RequestState popularState,
    @Default([]) List<TvSeries> popularTvSeries,
    
    @Default(RequestState.Empty) RequestState topRatedState,
    @Default([]) List<TvSeries> topRatedTvSeries,
    @Default('') String message,
  }) = _HomeTvSeriesState;
}