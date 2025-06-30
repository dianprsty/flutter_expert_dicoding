import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../common/state_enum.dart';
import '../../../../domain/entities/tv_series.dart';
import '../../../../domain/usecases/tv_series/get_on_the_air_tv_series.dart';
import '../../../../domain/usecases/tv_series/get_popular_tv_series.dart';
import '../../../../domain/usecases/tv_series/get_top_rated_tv_series.dart';

part 'home_tv_series_event.dart';
part 'home_tv_series_state.dart';
part 'home_tv_series_bloc.freezed.dart';

class HomeTvSeriesBloc extends Bloc<HomeTvSeriesEvent, HomeTvSeriesState> {
  final GetOnTheAirTvSeries _getOnTheAirTvSeries;
  final GetPopularTvSeries _getPopularTvSeries;
  final GetTopRatedTvSeries _getTopRatedTvSeries;

  HomeTvSeriesBloc({
    required GetOnTheAirTvSeries getOnTheAirTvSeries,
    required GetPopularTvSeries getPopularTvSeries,
    required GetTopRatedTvSeries getTopRatedTvSeries,
  }) : _getOnTheAirTvSeries = getOnTheAirTvSeries,
       _getPopularTvSeries = getPopularTvSeries,
       _getTopRatedTvSeries = getTopRatedTvSeries,
       super(HomeTvSeriesState()) {
    on<_FetchOnTheAirTvSeries>(_fetchOnTheAirTvSeries);
    on<_FetchPopularTvSeries>(_fetchPopularTvSeries);
    on<_FetchTopRatedTvSeries>(_fetchTopRatedTvSeries);
  }

  void _fetchOnTheAirTvSeries(_FetchOnTheAirTvSeries event, emit) async {
    emit(state.copyWith(onTheAirState: RequestState.Loading));

    final result = await _getOnTheAirTvSeries.execute();

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            onTheAirState: RequestState.Error,
            message: failure.message,
          ),
        );
      },
      (tvSeriesData) {
        emit(
          state.copyWith(
            onTheAirState: RequestState.Loaded,
            onTheAirTvSeries: tvSeriesData,
          ),
        );
      },
    );
  }

  void _fetchPopularTvSeries(_FetchPopularTvSeries event, emit) async {
    emit(state.copyWith(popularState: RequestState.Loading));

    final result = await _getPopularTvSeries.execute();

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            popularState: RequestState.Error,
            message: failure.message,
          ),
        );
      },
      (tvSeriesData) {
        emit(
          state.copyWith(
            popularState: RequestState.Loaded,
            popularTvSeries: tvSeriesData,
          ),
        );
      },
    );
  }

  void _fetchTopRatedTvSeries(_FetchTopRatedTvSeries event, emit) async {
    emit(state.copyWith(topRatedState: RequestState.Loading));

    final result = await _getTopRatedTvSeries.execute();

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            topRatedState: RequestState.Error,
            message: failure.message,
          ),
        );
      },
      (tvSeriesData) {
        emit(
          state.copyWith(
            topRatedState: RequestState.Loaded,
            topRatedTvSeries: tvSeriesData,
          ),
        );
      },
    );
  }
}
