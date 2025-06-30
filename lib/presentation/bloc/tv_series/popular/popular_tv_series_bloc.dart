import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../common/state_enum.dart';
import '../../../../domain/entities/tv_series.dart';
import '../../../../domain/usecases/tv_series/get_popular_tv_series.dart';

part 'popular_tv_series_event.dart';
part 'popular_tv_series_state.dart';
part 'popular_tv_series_bloc.freezed.dart';

class PopularTvSeriesBloc
    extends Bloc<PopularTvSeriesEvent, PopularTvSeriesState> {
  final GetPopularTvSeries _getPopularTvSeries;
  PopularTvSeriesBloc({required GetPopularTvSeries getPopularTvSeries})
    : _getPopularTvSeries = getPopularTvSeries,
      super(PopularTvSeriesState()) {
    on<_FetchPopularTvSeries>(_fetchPopularTvSeries);
  }

  void _fetchPopularTvSeries(_FetchPopularTvSeries event, emit) async {
    emit(state.copyWith(requestState: RequestState.Loading));

    final result = await _getPopularTvSeries.execute();

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
