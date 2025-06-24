import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/entities/tv_series.dart';
import 'package:ditonton/domain/usecases/tv_series/get_on_the_air_tv_series.dart';
import 'package:ditonton/presentation/bloc/tv_series/on_the_air/on_the_air_tv_series_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'on_the_air_tv_series_bloc_test.mocks.dart';

@GenerateMocks([GetOnTheAirTvSeries])
void main() {
  late MockGetOnTheAirTvSeries mockGetOnTheAirTvSeries;
  late OnTheAirTvSeriesBloc onTheAirTvSeriesBloc;

  setUp(() {
    mockGetOnTheAirTvSeries = MockGetOnTheAirTvSeries();
    onTheAirTvSeriesBloc = OnTheAirTvSeriesBloc(
      getOnTheAirTvSeries: mockGetOnTheAirTvSeries,
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
    overview: 'Seven noble families fight for control of the mythical land of Westeros.',
    popularity: 60.441,
    posterPath: '/rweIrveL43TaxUN0akQEaAXL6x0.jpg',
    firstAirDate: '2011-04-17',
    name: 'Game of Thrones',
    voteAverage: 8.3,
    voteCount: 11504,
  );

  final tTvSeriesList = [tTvSeries];

  test('initial state should be empty', () {
    expect(onTheAirTvSeriesBloc.state, OnTheAirTvSeriesState());
  });

  blocTest<OnTheAirTvSeriesBloc, OnTheAirTvSeriesState>(
    'Should emit [Loading, Loaded] when data is gotten successfully',
    build: () {
      when(mockGetOnTheAirTvSeries.execute())
          .thenAnswer((_) async => Right(tTvSeriesList));
      return onTheAirTvSeriesBloc;
    },
    act: (bloc) => bloc.add(const OnTheAirTvSeriesEvent.fetchOnTheAirTvSeries()),
    expect: () => [
      OnTheAirTvSeriesState(requestState: RequestState.Loading),
      OnTheAirTvSeriesState(
        requestState: RequestState.Loaded,
        tvSeries: tTvSeriesList,
      ),
    ],
    verify: (bloc) {
      verify(mockGetOnTheAirTvSeries.execute());
    },
  );

  blocTest<OnTheAirTvSeriesBloc, OnTheAirTvSeriesState>(
    'Should emit [Loading, Error] when get data is unsuccessful',
    build: () {
      when(mockGetOnTheAirTvSeries.execute())
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      return onTheAirTvSeriesBloc;
    },
    act: (bloc) => bloc.add(const OnTheAirTvSeriesEvent.fetchOnTheAirTvSeries()),
    expect: () => [
      OnTheAirTvSeriesState(requestState: RequestState.Loading),
      OnTheAirTvSeriesState(
        requestState: RequestState.Error,
        message: 'Server Failure',
      ),
    ],
    verify: (bloc) {
      verify(mockGetOnTheAirTvSeries.execute());
    },
  );
}