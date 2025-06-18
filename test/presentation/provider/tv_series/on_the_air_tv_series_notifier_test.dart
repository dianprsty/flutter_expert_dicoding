import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/entities/tv_series.dart';
import 'package:ditonton/domain/usecases/tv_series/get_on_the_air_tv_series.dart';
import 'package:ditonton/presentation/provider/tv_series/on_the_air_tv_series_notifier.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../dummy_data/dummy_objects.dart';
import 'on_the_air_tv_series_notifier_test.mocks.dart';

@GenerateMocks([GetOnTheAirTvSeries])
void main() {
  late MockGetOnTheAirTvSeries mockGetOnTheAirTvSeries;
  late OnTheAirTvSeriesNotifier notifier;
  late int listenerCallCount;

  setUp(() {
    listenerCallCount = 0;
    mockGetOnTheAirTvSeries = MockGetOnTheAirTvSeries();
    notifier = OnTheAirTvSeriesNotifier(getOnTheAirTvSeries: mockGetOnTheAirTvSeries)
      ..addListener(() {
        listenerCallCount += 1;
      });
  });

  test('should change state to loading when usecase is called', () async {
    // arrange
    when(mockGetOnTheAirTvSeries.execute())
        .thenAnswer((_) async => Right(testTvSeriesList));
    // act
    notifier.fetchOnTheAirTvSeries();
    // assert
    expect(notifier.state, RequestState.Loading);
  });

  test('should change tv series data when data is gotten successfully',
      () async {
    // arrange
    when(mockGetOnTheAirTvSeries.execute())
        .thenAnswer((_) async => Right(testTvSeriesList));
    // act
    await notifier.fetchOnTheAirTvSeries();
    // assert
    expect(notifier.state, RequestState.Loaded);
    expect(notifier.tvSeries, testTvSeriesList);
    expect(listenerCallCount, 2);
  });

  test('should return error when data is unsuccessful', () async {
    // arrange
    when(mockGetOnTheAirTvSeries.execute())
        .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
    // act
    await notifier.fetchOnTheAirTvSeries();
    // assert
    expect(notifier.state, RequestState.Error);
    expect(notifier.message, 'Server Failure');
    expect(listenerCallCount, 2);
  });
}