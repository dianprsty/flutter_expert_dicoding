import 'package:bloc/bloc.dart';
import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/entities/tv_series.dart';
import 'package:ditonton/domain/entities/tv_series_detail.dart';
import 'package:ditonton/domain/usecases/tv_series/get_tv_series_detail.dart';
import 'package:ditonton/domain/usecases/tv_series/get_tv_series_recommendations.dart';
import 'package:ditonton/domain/usecases/tv_series/get_watchlist_tv_status.dart';
import 'package:ditonton/domain/usecases/tv_series/remove_watchlist_tv.dart';
import 'package:ditonton/domain/usecases/tv_series/save_watchlist_tv.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tv_series_detail_event.dart';
part 'tv_series_detail_state.dart';
part 'tv_series_detail_bloc.freezed.dart';

class TvSeriesDetailBloc
    extends Bloc<TvSeriesDetailEvent, TvSeriesDetailState> {
  final GetTvSeriesDetail _getTvSeriesDetail;
  final GetTvSeriesRecommendations _getTvSeriesRecommendations;
  final GetWatchlistTvStatus _getWatchListStatus;
  final SaveWatchlistTv _saveWatchlist;
  final RemoveWatchlistTv _removeWatchlist;

  TvSeriesDetailBloc({
    required GetTvSeriesDetail getTvSeriesDetail,
    required GetTvSeriesRecommendations getTvSeriesRecommendations,
    required GetWatchlistTvStatus getWatchListStatus,
    required SaveWatchlistTv saveWatchlist,
    required RemoveWatchlistTv removeWatchlist,
  })
      : _getTvSeriesDetail = getTvSeriesDetail,
        _getTvSeriesRecommendations = getTvSeriesRecommendations,
        _getWatchListStatus = getWatchListStatus,
        _saveWatchlist = saveWatchlist,
        _removeWatchlist = removeWatchlist,
        super(TvSeriesDetailState()) {
    on<_FetchTvSeriesDetail>(_fetchTvSeriesDetail);
    on<_AddWatchlist>(_addWatchlist);
    on<_RemoveFromWatchlist>(_removeFromWatchlist);
    on<_LoadWatchlistStatus>(_loadWatchlistStatus);
  }

  void _fetchTvSeriesDetail(_FetchTvSeriesDetail event, emit) async {
    final id = event.id;

    emit(state.copyWith(tvSeriesState: RequestState.Loading));

    final detailResult = await _getTvSeriesDetail.execute(id);
    final recommendationResult = await _getTvSeriesRecommendations.execute(id);

    detailResult.fold(
      (failure) {
        emit(state.copyWith(
          tvSeriesState: RequestState.Error,
          message: failure.message,
        ));
      },
      (tvSeries) {
        recommendationResult.fold(
          (failure) {
            emit(state.copyWith(
              tvSeriesState: RequestState.Loaded,
              tvSeriesDetail: tvSeries,
              recommendationState: RequestState.Error,
              message: failure.message,
            ));
          },
          (recommendations) {
            emit(state.copyWith(
              tvSeriesState: RequestState.Loaded,
              tvSeriesDetail: tvSeries,
              recommendationState: RequestState.Loaded,
              tvSeriesRecommendations: recommendations,
            ));
          },
        );
      },
    );
  }

  void _addWatchlist(_AddWatchlist event, emit) async {
    final result = await _saveWatchlist.execute(event.tvSeries);

    result.fold(
      (failure) {
        emit(state.copyWith(watchlistMessage: failure.message));
      },
      (successMessage) {
        emit(state.copyWith(
          watchlistMessage: successMessage,
          isAddedToWatchlist: true,
        ));
      },
    );
  }

  void _removeFromWatchlist(_RemoveFromWatchlist event, emit) async {
    final result = await _removeWatchlist.execute(event.tvSeries);

    result.fold(
      (failure) {
        emit(state.copyWith(watchlistMessage: failure.message));
      },
      (successMessage) {
        emit(state.copyWith(
          watchlistMessage: successMessage,
          isAddedToWatchlist: false,
        ));
      },
    );
  }

  void _loadWatchlistStatus(_LoadWatchlistStatus event, emit) async {
    final result = await _getWatchListStatus.execute(event.id);
    emit(state.copyWith(isAddedToWatchlist: result));
  }
}