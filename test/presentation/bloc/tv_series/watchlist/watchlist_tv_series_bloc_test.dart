import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/entities/tv_series.dart';
import 'package:ditonton/domain/usecases/tv_series/get_watchlist_tv_series.dart';
import 'package:ditonton/presentation/bloc/tv_series/watchlist/watchlist_tv_series_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'watchlist_tv_series_bloc_test.mocks.dart';

@GenerateMocks([GetWatchlistTvSeries])
void main() {
  late WatchlistTvSeriesBloc watchlistTvSeriesBloc;
  late MockGetWatchlistTvSeries mockGetWatchlistTvSeries;

  setUp(() {
    mockGetWatchlistTvSeries = MockGetWatchlistTvSeries();
    watchlistTvSeriesBloc = WatchlistTvSeriesBloc(
      getWatchlistTvSeries: mockGetWatchlistTvSeries,
    );
  });

  final tTvSeries = TvSeries(
    backdropPath: 'backdropPath',
    genreIds: [1, 2, 3],
    id: 1,
    originalName: 'originalName',
    overview: 'overview',
    popularity: 1,
    posterPath: 'posterPath',
    firstAirDate: 'firstAirDate',
    name: 'name',
    voteAverage: 1,
    voteCount: 1,
    adult: false,
    originCountry: [],
    originalLanguage: '',
  );

  final tTvSeriesList = <TvSeries>[tTvSeries];

  group('Watchlist TV Series', () {
    test('initial state should be empty', () {
      expect(watchlistTvSeriesBloc.state, WatchlistTvSeriesState.initial());
    });

    blocTest<WatchlistTvSeriesBloc, WatchlistTvSeriesState>(
      'Should emit [Loading, Loaded] when data is gotten successfully',
      build: () {
        when(
          mockGetWatchlistTvSeries.execute(),
        ).thenAnswer((_) async => Right(tTvSeriesList));
        return watchlistTvSeriesBloc;
      },
      act: (bloc) => bloc.add(WatchlistTvSeriesEvent.fetchWatchlistTvSeries()),
      expect: () => [
        WatchlistTvSeriesState(
          requestState: RequestState.Loading,
          watchlistTvSeries: [],
          message: '',
        ),
        WatchlistTvSeriesState(
          requestState: RequestState.Loaded,
          watchlistTvSeries: tTvSeriesList,
          message: '',
        ),
      ],
      verify: (bloc) {
        verify(mockGetWatchlistTvSeries.execute());
      },
    );

    blocTest<WatchlistTvSeriesBloc, WatchlistTvSeriesState>(
      'Should emit [Loading, Error] when get watchlist is unsuccessful',
      build: () {
        when(
          mockGetWatchlistTvSeries.execute(),
        ).thenAnswer((_) async => Left(ServerFailure('Server Failure')));
        return watchlistTvSeriesBloc;
      },
      act: (bloc) => bloc.add(WatchlistTvSeriesEvent.fetchWatchlistTvSeries()),
      expect: () => [
        WatchlistTvSeriesState(
          requestState: RequestState.Loading,
          watchlistTvSeries: [],
          message: '',
        ),
        WatchlistTvSeriesState(
          requestState: RequestState.Error,
          watchlistTvSeries: [],
          message: 'Server Failure',
        ),
      ],
      verify: (bloc) {
        verify(mockGetWatchlistTvSeries.execute());
      },
    );
  });
}
