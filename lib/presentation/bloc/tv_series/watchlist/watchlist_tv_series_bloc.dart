import 'package:bloc/bloc.dart';
import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/entities/tv_series.dart';
import 'package:ditonton/domain/usecases/tv_series/get_watchlist_tv_series.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'watchlist_tv_series_event.dart';
part 'watchlist_tv_series_state.dart';
part 'watchlist_tv_series_bloc.freezed.dart';

class WatchlistTvSeriesBloc
    extends Bloc<WatchlistTvSeriesEvent, WatchlistTvSeriesState> {
  final GetWatchlistTvSeries _getWatchlistTvSeries;

  WatchlistTvSeriesBloc({required GetWatchlistTvSeries getWatchlistTvSeries})
      : _getWatchlistTvSeries = getWatchlistTvSeries,
        super(WatchlistTvSeriesState()) {
    on<_FetchWatchlistTvSeries>(_fetchWatchlistTvSeries);
  }

  void _fetchWatchlistTvSeries(_FetchWatchlistTvSeries event, emit) async {
    emit(state.copyWith(requestState: RequestState.Loading));

    final result = await _getWatchlistTvSeries.execute();

    result.fold(
      (failure) {
        emit(state.copyWith(
          requestState: RequestState.Error,
          message: failure.message,
        ));
      },
      (tvSeriesData) {
        emit(state.copyWith(
          requestState: RequestState.Loaded,
          watchlistTvSeries: tvSeriesData,
        ));
      },
    );
  }
}