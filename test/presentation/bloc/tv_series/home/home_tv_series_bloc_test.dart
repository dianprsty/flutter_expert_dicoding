import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/entities/tv_series.dart';
import 'package:ditonton/domain/usecases/tv_series/get_on_the_air_tv_series.dart';
import 'package:ditonton/domain/usecases/tv_series/get_popular_tv_series.dart';
import 'package:ditonton/domain/usecases/tv_series/get_top_rated_tv_series.dart';
import 'package:ditonton/presentation/bloc/tv_series/home/home_tv_series_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'home_tv_series_bloc_test.mocks.dart';

@GenerateMocks([GetOnTheAirTvSeries, GetPopularTvSeries, GetTopRatedTvSeries])
void main() {
  late MockGetOnTheAirTvSeries mockGetOnTheAirTvSeries;
  late MockGetPopularTvSeries mockGetPopularTvSeries;
  late MockGetTopRatedTvSeries mockGetTopRatedTvSeries;
  late HomeTvSeriesBloc homeTvSeriesBloc;

  setUp(() {
    mockGetOnTheAirTvSeries = MockGetOnTheAirTvSeries();
    mockGetPopularTvSeries = MockGetPopularTvSeries();
    mockGetTopRatedTvSeries = MockGetTopRatedTvSeries();
    homeTvSeriesBloc = HomeTvSeriesBloc(
      getOnTheAirTvSeries: mockGetOnTheAirTvSeries,
      getPopularTvSeries: mockGetPopularTvSeries,
      getTopRatedTvSeries: mockGetTopRatedTvSeries,
    );
  });

  final tTvSeries = TvSeries(
    adult: false,
    backdropPath: '/muth4OYamXf41G2evdrLEg8d3om.jpg',
    genreIds: [14, 28],
    id: 1,
    originCountry: ['US'],
    originalLanguage: 'en',
    originalName: 'Game of Thrones',
    overview:
        'Seven noble families fight for control '
        'of the mythical land of Westeros.',
    popularity: 60.441,
    posterPath: '/rweIrveL43TaxUN0akQEaAXL6x0.jpg',
    firstAirDate: '2011-04-17',
    name: 'Game of Thrones',
    voteAverage: 8.3,
    voteCount: 11504,
  );

  final tTvSeriesList = [tTvSeries];

  group('On The Air TV Series', () {
    test('initial state should be empty', () {
      expect(homeTvSeriesBloc.state, HomeTvSeriesState());
    });

    blocTest<HomeTvSeriesBloc, HomeTvSeriesState>(
      'Should emit [Loading, Loaded] when data is gotten successfully',
      build: () {
        when(
          mockGetOnTheAirTvSeries.execute(),
        ).thenAnswer((_) async => Right(tTvSeriesList));
        return homeTvSeriesBloc;
      },
      act: (bloc) => bloc.add(const HomeTvSeriesEvent.fetchOnTheAirTvSeries()),
      expect: () => [
        HomeTvSeriesState(onTheAirState: RequestState.Loading),
        HomeTvSeriesState(
          onTheAirState: RequestState.Loaded,
          onTheAirTvSeries: tTvSeriesList,
        ),
      ],
      verify: (bloc) {
        verify(mockGetOnTheAirTvSeries.execute());
      },
    );

    blocTest<HomeTvSeriesBloc, HomeTvSeriesState>(
      'Should emit [Loading, Error] when get data is unsuccessful',
      build: () {
        when(
          mockGetOnTheAirTvSeries.execute(),
        ).thenAnswer((_) async => Left(ServerFailure('Server Failure')));
        return homeTvSeriesBloc;
      },
      act: (bloc) => bloc.add(const HomeTvSeriesEvent.fetchOnTheAirTvSeries()),
      expect: () => [
        HomeTvSeriesState(onTheAirState: RequestState.Loading),
        HomeTvSeriesState(
          onTheAirState: RequestState.Error,
          message: 'Server Failure',
        ),
      ],
      verify: (bloc) {
        verify(mockGetOnTheAirTvSeries.execute());
      },
    );
  });

  group('Popular TV Series', () {
    blocTest<HomeTvSeriesBloc, HomeTvSeriesState>(
      'Should emit [Loading, Loaded] when data is gotten successfully',
      build: () {
        when(
          mockGetPopularTvSeries.execute(),
        ).thenAnswer((_) async => Right(tTvSeriesList));
        return homeTvSeriesBloc;
      },
      act: (bloc) => bloc.add(const HomeTvSeriesEvent.fetchPopularTvSeries()),
      expect: () => [
        HomeTvSeriesState(popularState: RequestState.Loading),
        HomeTvSeriesState(
          popularState: RequestState.Loaded,
          popularTvSeries: tTvSeriesList,
        ),
      ],
      verify: (bloc) {
        verify(mockGetPopularTvSeries.execute());
      },
    );

    blocTest<HomeTvSeriesBloc, HomeTvSeriesState>(
      'Should emit [Loading, Error] when get data is unsuccessful',
      build: () {
        when(
          mockGetPopularTvSeries.execute(),
        ).thenAnswer((_) async => Left(ServerFailure('Server Failure')));
        return homeTvSeriesBloc;
      },
      act: (bloc) => bloc.add(const HomeTvSeriesEvent.fetchPopularTvSeries()),
      expect: () => [
        HomeTvSeriesState(popularState: RequestState.Loading),
        HomeTvSeriesState(
          popularState: RequestState.Error,
          message: 'Server Failure',
        ),
      ],
      verify: (bloc) {
        verify(mockGetPopularTvSeries.execute());
      },
    );
  });

  group('Top Rated TV Series', () {
    blocTest<HomeTvSeriesBloc, HomeTvSeriesState>(
      'Should emit [Loading, Loaded] when data is gotten successfully',
      build: () {
        when(
          mockGetTopRatedTvSeries.execute(),
        ).thenAnswer((_) async => Right(tTvSeriesList));
        return homeTvSeriesBloc;
      },
      act: (bloc) => bloc.add(const HomeTvSeriesEvent.fetchTopRatedTvSeries()),
      expect: () => [
        HomeTvSeriesState(topRatedState: RequestState.Loading),
        HomeTvSeriesState(
          topRatedState: RequestState.Loaded,
          topRatedTvSeries: tTvSeriesList,
        ),
      ],
      verify: (bloc) {
        verify(mockGetTopRatedTvSeries.execute());
      },
    );

    blocTest<HomeTvSeriesBloc, HomeTvSeriesState>(
      'Should emit [Loading, Error] when get data is unsuccessful',
      build: () {
        when(
          mockGetTopRatedTvSeries.execute(),
        ).thenAnswer((_) async => Left(ServerFailure('Server Failure')));
        return homeTvSeriesBloc;
      },
      act: (bloc) => bloc.add(const HomeTvSeriesEvent.fetchTopRatedTvSeries()),
      expect: () => [
        HomeTvSeriesState(topRatedState: RequestState.Loading),
        HomeTvSeriesState(
          topRatedState: RequestState.Error,
          message: 'Server Failure',
        ),
      ],
      verify: (bloc) {
        verify(mockGetTopRatedTvSeries.execute());
      },
    );
  });
}
