import 'package:bloc/bloc.dart';
import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/entities/tv_series.dart';
import 'package:ditonton/domain/usecases/tv_series/get_top_rated_tv_series.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'top_rated_tv_series_event.dart';
part 'top_rated_tv_series_state.dart';
part 'top_rated_tv_series_bloc.freezed.dart';

class TopRatedTvSeriesBloc
    extends Bloc<TopRatedTvSeriesEvent, TopRatedTvSeriesState> {
  final GetTopRatedTvSeries _getTopRatedTvSeries;

  TopRatedTvSeriesBloc({required GetTopRatedTvSeries getTopRatedTvSeries})
      : _getTopRatedTvSeries = getTopRatedTvSeries,
        super(TopRatedTvSeriesState()) {
    on<_FetchTopRatedTvSeries>(_fetchTopRatedTvSeries);
  }

  void _fetchTopRatedTvSeries(_FetchTopRatedTvSeries event, emit) async {
    emit(state.copyWith(requestState: RequestState.Loading));

    final result = await _getTopRatedTvSeries.execute();

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