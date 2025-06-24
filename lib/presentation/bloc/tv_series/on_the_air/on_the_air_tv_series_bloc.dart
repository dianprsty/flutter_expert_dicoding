import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/entities/tv_series.dart';
import 'package:ditonton/domain/usecases/tv_series/get_on_the_air_tv_series.dart';

part 'on_the_air_tv_series_event.dart';
part 'on_the_air_tv_series_state.dart';
part 'on_the_air_tv_series_bloc.freezed.dart';

class OnTheAirTvSeriesBloc
    extends Bloc<OnTheAirTvSeriesEvent, OnTheAirTvSeriesState> {
  final GetOnTheAirTvSeries _getOnTheAirTvSeries;
  OnTheAirTvSeriesBloc({required GetOnTheAirTvSeries getOnTheAirTvSeries})
    : _getOnTheAirTvSeries = getOnTheAirTvSeries,
      super(OnTheAirTvSeriesState()) {
    on<_FetchOnTheAirTvSeries>(_fetchOnTheAirTvSeries);
  }

  void _fetchOnTheAirTvSeries(_FetchOnTheAirTvSeries event, emit) async {
    emit(state.copyWith(requestState: RequestState.Loading));

    final result = await _getOnTheAirTvSeries.execute();

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            requestState: RequestState.Error,
            message: failure.message,
          ),
        );
      },
      (tvSeriesData) {
        emit(
          state.copyWith(
            requestState: RequestState.Loaded,
            tvSeries: tvSeriesData,
          ),
        );
      },
    );

  }
}
