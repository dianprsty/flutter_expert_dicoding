import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../common/state_enum.dart';
import '../../../../domain/entities/tv_series.dart';
import '../../../../domain/usecases/tv_series/search_tv_series.dart';

part 'search_tv_series_event.dart';
part 'search_tv_series_state.dart';
part 'search_tv_series_bloc.freezed.dart';

class SearchTvSeriesBloc
    extends Bloc<SearchTvSeriesEvent, SearchTvSeriesState> {
  final SearchTvSeries _searchTvSeries;

  SearchTvSeriesBloc({required SearchTvSeries searchTvSeries})
    : _searchTvSeries = searchTvSeries,
      super(SearchTvSeriesState()) {
    on<_OnQueryChanged>(_onQueryChanged);
  }

  void _onQueryChanged(_OnQueryChanged event, emit) async {
    final query = event.query;

    emit(state.copyWith(state: RequestState.Loading));

    final result = await _searchTvSeries.execute(query);

    result.fold(
      (failure) {
        emit(
          state.copyWith(state: RequestState.Error, message: failure.message),
        );
      },
      (data) {
        emit(state.copyWith(state: RequestState.Loaded, searchResult: data));
      },
    );
  }
}
