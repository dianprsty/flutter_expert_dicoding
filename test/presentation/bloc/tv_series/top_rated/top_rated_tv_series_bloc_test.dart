import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/entities/tv_series.dart';
import 'package:ditonton/domain/usecases/tv_series/get_top_rated_tv_series.dart';
import 'package:ditonton/presentation/bloc/tv_series/top_rated/top_rated_tv_series_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'top_rated_tv_series_bloc_test.mocks.dart';

@GenerateMocks([GetTopRatedTvSeries])
void main() {
  late MockGetTopRatedTvSeries mockGetTopRatedTvSeries;
  late TopRatedTvSeriesBloc topRatedTvSeriesBloc;

  setUp(() {
    mockGetTopRatedTvSeries = MockGetTopRatedTvSeries();
    topRatedTvSeriesBloc = TopRatedTvSeriesBloc(
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
    expect(topRatedTvSeriesBloc.state, TopRatedTvSeriesState());
  });

  blocTest<TopRatedTvSeriesBloc, TopRatedTvSeriesState>(
    'Should emit [Loading, Loaded] when data is gotten successfully',
    build: () {
      when(mockGetTopRatedTvSeries.execute())
          .thenAnswer((_) async => Right(tTvSeriesList));
      return topRatedTvSeriesBloc;
    },
    act: (bloc) => bloc.add(const TopRatedTvSeriesEvent.fetchTopRatedTvSeries()),
    expect: () => [
      TopRatedTvSeriesState(requestState: RequestState.Loading),
      TopRatedTvSeriesState(
        requestState: RequestState.Loaded,
        tvSeries: tTvSeriesList,
      ),
    ],
    verify: (bloc) {
      verify(mockGetTopRatedTvSeries.execute());
    },
  );

  blocTest<TopRatedTvSeriesBloc, TopRatedTvSeriesState>(
    'Should emit [Loading, Error] when get data is unsuccessful',
    build: () {
      when(mockGetTopRatedTvSeries.execute())
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      return topRatedTvSeriesBloc;
    },
    act: (bloc) => bloc.add(const TopRatedTvSeriesEvent.fetchTopRatedTvSeries()),
    expect: () => [
      TopRatedTvSeriesState(requestState: RequestState.Loading),
      TopRatedTvSeriesState(
        requestState: RequestState.Error,
        message: 'Server Failure',
      ),
    ],
    verify: (bloc) {
      verify(mockGetTopRatedTvSeries.execute());
    },
  );
}