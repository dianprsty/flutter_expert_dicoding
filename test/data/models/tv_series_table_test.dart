import 'package:ditonton/data/models/tv_series_table.dart';
import 'package:ditonton/domain/entities/tv_series.dart';
import 'package:ditonton/domain/entities/tv_series_detail.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../dummy_data/dummy_objects.dart';

void main() {
  final tTvSeriesTable = TvSeriesTable(
    id: 1,
    name: 'name',
    posterPath: 'posterPath',
    overview: 'overview',
  );

  final tvSeriesDetail = TvSeriesDetail(
    adult: false,
    backdropPath: 'backdropPath',
    id: 1,
    overview: 'overview',
    popularity: 1,
    posterPath: 'posterPath',
    firstAirDate: 'firstAirDate',
    name: 'name',
    voteAverage: 1,
    voteCount: 1,
    seasons: [testSeason],
    numberOfSeasons: 1,
    numberOfEpisodes: 10,
    status: 'Ended',
    tagline: 'Tagline',
    type: 'Scripted',
    homepage: 'https://example.com',
    inProduction: false,
    lastAirDate: '2022-12-31',
    episodeRunTime: [],
    genres: [],
    languages: [],
  );

  test('should be a subclass of TvSeriesTable entity', () {
    final result = tTvSeriesTable.toEntity();
    expect(result, isA<TvSeries>());
  });

  test('should create a valid TvSeriesTable from entity', () {
    final result = TvSeriesTable.fromEntity(tvSeriesDetail);
    expect(result, tTvSeriesTable);
  });

  test('should create a valid TvSeriesTable from detail entity', () {
    final result = TvSeriesTable.fromEntity(testTvSeriesDetail);
    expect(result.id, testTvSeriesDetail.id);
    expect(result.name, testTvSeriesDetail.name);
    expect(result.posterPath, testTvSeriesDetail.posterPath);
    expect(result.overview, testTvSeriesDetail.overview);
  });

  test('should create a valid TvSeriesTable from map', () {
    final map = {
      'id': 1,
      'name': 'name',
      'posterPath': 'posterPath',
      'overview': 'overview',
    };
    final result = TvSeriesTable.fromMap(map);
    expect(result, tTvSeriesTable);
  });

  test('should create a valid map from TvSeriesTable', () {
    final result = tTvSeriesTable.toJson();
    final expectedMap = {
      'id': 1,
      'name': 'name',
      'posterPath': 'posterPath',
      'overview': 'overview',
    };
    expect(result, expectedMap);
  });

  test('should create a valid TvSeriesTable with copyWith', () {
    final result = tTvSeriesTable.copyWith(id: 2, name: 'new name');
    expect(result.id, 2);
    expect(result.name, 'new name');
    expect(result.posterPath, 'posterPath');
    expect(result.overview, 'overview');
  });

  test('should create a valid TvSeriesTable with copyWith '
      'when no parameters are provided', () {
    final result = tTvSeriesTable.copyWith();
    expect(result.id, 1);
    expect(result.name, 'name');
    expect(result.posterPath, 'posterPath');
    expect(result.overview, 'overview');
  });
}
