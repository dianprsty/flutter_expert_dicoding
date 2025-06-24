import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/entities/tv_series.dart';
import 'package:ditonton/domain/usecases/tv_series/get_tv_series_detail.dart';
import 'package:ditonton/domain/usecases/tv_series/get_tv_series_recommendations.dart';
import 'package:ditonton/domain/usecases/tv_series/get_watchlist_tv_status.dart';
import 'package:ditonton/domain/usecases/tv_series/remove_watchlist_tv.dart';
import 'package:ditonton/domain/usecases/tv_series/save_watchlist_tv.dart';
import 'package:ditonton/presentation/bloc/tv_series/detail/tv_series_detail_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../dummy_data/dummy_objects.dart';
import 'tv_series_detail_bloc_test.mocks.dart';

@GenerateMocks([
  GetTvSeriesDetail,
  GetTvSeriesRecommendations,
  GetWatchlistTvStatus,
  SaveWatchlistTv,
  RemoveWatchlistTv,
])
void main() {
  late MockGetTvSeriesDetail mockGetTvSeriesDetail;
  late MockGetTvSeriesRecommendations mockGetTvSeriesRecommendations;
  late MockGetWatchlistTvStatus mockGetWatchListStatusTvSeries;
  late MockSaveWatchlistTv mockSaveWatchlistTvSeries;
  late MockRemoveWatchlistTv mockRemoveWatchlistTvSeries;
  late TvSeriesDetailBloc tvSeriesDetailBloc;

  setUp(() {
    mockGetTvSeriesDetail = MockGetTvSeriesDetail();
    mockGetTvSeriesRecommendations = MockGetTvSeriesRecommendations();
    mockGetWatchListStatusTvSeries = MockGetWatchlistTvStatus();
    mockSaveWatchlistTvSeries = MockSaveWatchlistTv();
    mockRemoveWatchlistTvSeries = MockRemoveWatchlistTv();
    tvSeriesDetailBloc = TvSeriesDetailBloc(
      getTvSeriesDetail: mockGetTvSeriesDetail,
      getTvSeriesRecommendations: mockGetTvSeriesRecommendations,
      getWatchListStatus: mockGetWatchListStatusTvSeries,
      saveWatchlist: mockSaveWatchlistTvSeries,
      removeWatchlist: mockRemoveWatchlistTvSeries,
    );
  });

  const tId = 1;
  final tTvSeries = TvSeries(
    adult: false,
    backdropPath: '/muth4OYamXf41G2evdrLEg8d3om.jpg',
    genreIds: [14, 28],
    id: 1,
    originCountry: ['US'],
    originalLanguage: 'en',
    originalName: 'Game of Thrones',
    overview: 'Seven noble families fight for control of the mythical land of Westeros.',
    popularity: 60.441,
    posterPath: '/rweIrveL43TaxUN0akQEaAXL6x0.jpg',
    firstAirDate: '2011-04-17',
    name: 'Game of Thrones',
    voteAverage: 8.3,
    voteCount: 11504,
  );

  final tTvSeriesList = [tTvSeries];

  void arrangeUsecase() {
    when(mockGetTvSeriesDetail.execute(tId))
        .thenAnswer((_) async => Right(testTvSeriesDetail));
    when(mockGetTvSeriesRecommendations.execute(tId))
        .thenAnswer((_) async => Right(tTvSeriesList));
  }

  test('initial state should be empty', () {
    expect(tvSeriesDetailBloc.state, TvSeriesDetailState());
  });

  blocTest<TvSeriesDetailBloc, TvSeriesDetailState>(
    'Should emit [Loading, Loaded] when data is gotten successfully',
    build: () {
      arrangeUsecase();
      return tvSeriesDetailBloc;
    },
    act: (bloc) => bloc.add(const TvSeriesDetailEvent.fetchTvSeriesDetail(tId)),
    expect: () => [
      TvSeriesDetailState(tvSeriesState: RequestState.Loading),
      TvSeriesDetailState(
        tvSeriesState: RequestState.Loaded,
        tvSeriesDetail: testTvSeriesDetail,
        recommendationState: RequestState.Loaded,
        tvSeriesRecommendations: tTvSeriesList,
      ),
    ],
    verify: (bloc) {
      verify(mockGetTvSeriesDetail.execute(tId));
      verify(mockGetTvSeriesRecommendations.execute(tId));
    },
  );

  blocTest<TvSeriesDetailBloc, TvSeriesDetailState>(
    'Should emit [Loading, Error] when get detail data is unsuccessful',
    build: () {
      when(mockGetTvSeriesDetail.execute(tId))
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      when(mockGetTvSeriesRecommendations.execute(tId))
          .thenAnswer((_) async => Right(tTvSeriesList));
      return tvSeriesDetailBloc;
    },
    act: (bloc) => bloc.add(const TvSeriesDetailEvent.fetchTvSeriesDetail(tId)),
    expect: () => [
      TvSeriesDetailState(tvSeriesState: RequestState.Loading),
      TvSeriesDetailState(
        tvSeriesState: RequestState.Error,
        message: 'Server Failure',
      ),
    ],
    verify: (bloc) {
      verify(mockGetTvSeriesDetail.execute(tId));
    },
  );

  blocTest<TvSeriesDetailBloc, TvSeriesDetailState>(
    'Should emit [Loading, Loaded, Error] when get recommendation data is unsuccessful',
    build: () {
      when(mockGetTvSeriesDetail.execute(tId))
          .thenAnswer((_) async => Right(testTvSeriesDetail));
      when(mockGetTvSeriesRecommendations.execute(tId))
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      return tvSeriesDetailBloc;
    },
    act: (bloc) => bloc.add(const TvSeriesDetailEvent.fetchTvSeriesDetail(tId)),
    expect: () => [
      TvSeriesDetailState(tvSeriesState: RequestState.Loading),
      TvSeriesDetailState(
        tvSeriesState: RequestState.Loaded,
        tvSeriesDetail: testTvSeriesDetail,
        recommendationState: RequestState.Error,
        message: 'Server Failure',
      ),
    ],
    verify: (bloc) {
      verify(mockGetTvSeriesDetail.execute(tId));
      verify(mockGetTvSeriesRecommendations.execute(tId));
    },
  );

  blocTest<TvSeriesDetailBloc, TvSeriesDetailState>(
    'Should emit [Watchlist Added] when add to watchlist is successful',
    build: () {
      when(mockSaveWatchlistTvSeries.execute(testTvSeriesDetail))
          .thenAnswer((_) async => const Right('Added to Watchlist'));
      return tvSeriesDetailBloc;
    },
    act: (bloc) => bloc.add(TvSeriesDetailEvent.addWatchlist(testTvSeriesDetail)),
    expect: () => [
      TvSeriesDetailState(
        watchlistMessage: 'Added to Watchlist',
        isAddedToWatchlist: true,
      ),
    ],
    verify: (bloc) {
      verify(mockSaveWatchlistTvSeries.execute(testTvSeriesDetail));
    },
  );

  blocTest<TvSeriesDetailBloc, TvSeriesDetailState>(
    'Should emit [Watchlist Error] when add to watchlist is unsuccessful',
    build: () {
      when(mockSaveWatchlistTvSeries.execute(testTvSeriesDetail))
          .thenAnswer((_) async => Left(DatabaseFailure('Database Failure')));
      return tvSeriesDetailBloc;
    },
    act: (bloc) => bloc.add(TvSeriesDetailEvent.addWatchlist(testTvSeriesDetail)),
    expect: () => [
      TvSeriesDetailState(
        watchlistMessage: 'Database Failure',
      ),
    ],
    verify: (bloc) {
      verify(mockSaveWatchlistTvSeries.execute(testTvSeriesDetail));
    },
  );

  blocTest<TvSeriesDetailBloc, TvSeriesDetailState>(
    'Should emit [Watchlist Removed] when remove from watchlist is successful',
    build: () {
      when(mockRemoveWatchlistTvSeries.execute(testTvSeriesDetail))
          .thenAnswer((_) async => const Right('Removed from Watchlist'));
      return tvSeriesDetailBloc;
    },
    act: (bloc) => bloc.add(TvSeriesDetailEvent.removeFromWatchlist(testTvSeriesDetail)),
    expect: () => [
      TvSeriesDetailState(
        watchlistMessage: 'Removed from Watchlist',
        isAddedToWatchlist: false,
      ),
    ],
    verify: (bloc) {
      verify(mockRemoveWatchlistTvSeries.execute(testTvSeriesDetail));
    },
  );

  blocTest<TvSeriesDetailBloc, TvSeriesDetailState>(
    'Should emit [Watchlist Error] when remove from watchlist is unsuccessful',
    build: () {
      when(mockRemoveWatchlistTvSeries.execute(testTvSeriesDetail))
          .thenAnswer((_) async => Left(DatabaseFailure('Database Failure')));
      return tvSeriesDetailBloc;
    },
    act: (bloc) => bloc.add(TvSeriesDetailEvent.removeFromWatchlist(testTvSeriesDetail)),
    expect: () => [
      TvSeriesDetailState(
        watchlistMessage: 'Database Failure',
      ),
    ],
    verify: (bloc) {
      verify(mockRemoveWatchlistTvSeries.execute(testTvSeriesDetail));
    },
  );

  blocTest<TvSeriesDetailBloc, TvSeriesDetailState>(
    'Should emit [Watchlist Status] when get watchlist status',
    build: () {
      when(mockGetWatchListStatusTvSeries.execute(tId))
          .thenAnswer((_) async => true);
      return tvSeriesDetailBloc;
    },
    act: (bloc) => bloc.add(const TvSeriesDetailEvent.loadWatchlistStatus(tId)),
    expect: () => [
      TvSeriesDetailState(
        isAddedToWatchlist: true,
      ),
    ],
    verify: (bloc) {
      verify(mockGetWatchListStatusTvSeries.execute(tId));
    },
  );
}