import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:ditonton/common/exception.dart';
import 'package:ditonton/data/datasources/tv_series_local_data_source.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late TvSeriesLocalDataSourceImpl dataSource;
  late MockDatabaseHelper mockDatabaseHelper;

  setUp(() {
    mockDatabaseHelper = MockDatabaseHelper();
    dataSource = TvSeriesLocalDataSourceImpl(
      databaseHelper: mockDatabaseHelper,
    );
  });

  group('save watchlist tv series', () {
    test(
      'should return success message when insert to database is success',
      () async {
        // arrange
        when(
          mockDatabaseHelper.insertWatchlistTv(testTvSeriesTable),
        ).thenAnswer((_) async => 1);
        // act
        final result = await dataSource.insertWatchlistTv(testTvSeriesTable);
        // assert
        expect(result, 'Added to Watchlist');
      },
    );

    test(
      'should throw DatabaseException when insert to database is failed',
      () async {
        // arrange
        when(
          mockDatabaseHelper.insertWatchlistTv(testTvSeriesTable),
        ).thenThrow(Exception());
        // act
        final call = dataSource.insertWatchlistTv(testTvSeriesTable);
        // assert
        expect(() => call, throwsA(isA<DatabaseException>()));
      },
    );
  });

  group('remove watchlist tv series', () {
    test(
      'should return success message when remove from database is success',
      () async {
        // arrange
        when(
          mockDatabaseHelper.removeWatchlistTv(testTvSeriesTable),
        ).thenAnswer((_) async => 1);
        // act
        final result = await dataSource.removeWatchlistTv(testTvSeriesTable);
        // assert
        expect(result, 'Removed from Watchlist');
      },
    );

    test(
      'should throw DatabaseException when remove from database is failed',
      () async {
        // arrange
        when(
          mockDatabaseHelper.removeWatchlistTv(testTvSeriesTable),
        ).thenThrow(Exception());
        // act
        final call = dataSource.removeWatchlistTv(testTvSeriesTable);
        // assert
        expect(() => call, throwsA(isA<DatabaseException>()));
      },
    );
  });

  group('Get TV Series Detail By Id', () {
    final tId = 1;

    test('should return TV Series Detail Table when data is found', () async {
      // arrange
      when(
        mockDatabaseHelper.getTvSeriesById(tId),
      ).thenAnswer((_) async => testTvSeriesMap);
      // act
      final result = await dataSource.getTvSeriesById(tId);
      // assert
      expect(result, testTvSeriesTable);
    });

    test('should return null when data is not found', () async {
      // arrange
      when(
        mockDatabaseHelper.getTvSeriesById(tId),
      ).thenAnswer((_) async => null);
      // act
      final result = await dataSource.getTvSeriesById(tId);
      // assert
      expect(result, null);
    });
  });

  group('get watchlist tv series', () {
    test('should return list of TvSeriesTable from database', () async {
      // arrange
      when(
        mockDatabaseHelper.getWatchlistTvSeries(),
      ).thenAnswer((_) async => [testTvSeriesMap]);
      // act
      final result = await dataSource.getWatchlistTvSeriess();
      // assert
      expect(result, [testTvSeriesTable]);
    });
  });
}
