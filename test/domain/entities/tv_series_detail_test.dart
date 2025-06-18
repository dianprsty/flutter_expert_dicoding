import 'package:ditonton/domain/entities/genre.dart';
import 'package:ditonton/domain/entities/season.dart';
import 'package:ditonton/domain/entities/tv_series_detail.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final testGenre = Genre(id: 1, name: 'Action');
  final testSeason = Season(
    airDate: '2022-01-01',
    episodeCount: 10,
    id: 1,
    name: 'Season 1',
    overview: 'Overview',
    posterPath: '/path.jpg',
    seasonNumber: 1,
    voteAverage: 8.0,
  );

  final testTvSeriesDetail = TvSeriesDetail(
    adult: false,
    backdropPath: 'backdropPath',
    genres: [testGenre],
    id: 1,
    overview: 'Overview',
    posterPath: 'posterPath',
    firstAirDate: '2022-01-01',
    name: 'Name',
    voteAverage: 8.0,
    voteCount: 100,
    seasons: [testSeason],
    numberOfSeasons: 1,
    numberOfEpisodes: 10,
    popularity: 100.0,
    status: 'Ended',
    tagline: 'Tagline',
    type: 'Scripted',
    homepage: 'https://example.com',
    inProduction: false,
    lastAirDate: '2022-12-31', episodeRunTime: [], languages: [],
  );

  test('should have correct property values', () {
    expect(testTvSeriesDetail.adult, false);
    expect(testTvSeriesDetail.backdropPath, 'backdropPath');
    expect(testTvSeriesDetail.genres, [testGenre]);
    expect(testTvSeriesDetail.id, 1);
    expect(testTvSeriesDetail.overview, 'Overview');
    expect(testTvSeriesDetail.posterPath, 'posterPath');
    expect(testTvSeriesDetail.firstAirDate, '2022-01-01');
    expect(testTvSeriesDetail.name, 'Name');
    expect(testTvSeriesDetail.voteAverage, 8.0);
    expect(testTvSeriesDetail.voteCount, 100);
    expect(testTvSeriesDetail.seasons, [testSeason]);
    expect(testTvSeriesDetail.numberOfSeasons, 1);
    expect(testTvSeriesDetail.numberOfEpisodes, 10);
    expect(testTvSeriesDetail.status, 'Ended');
    expect(testTvSeriesDetail.tagline, 'Tagline');
    expect(testTvSeriesDetail.homepage, 'https://example.com');
    expect(testTvSeriesDetail.inProduction, false);
    expect(testTvSeriesDetail.lastAirDate, '2022-12-31');
  });

  test('props should contain all properties', () {
    final props = testTvSeriesDetail.props;
    
    expect(props, [
      testTvSeriesDetail.adult,
      testTvSeriesDetail.backdropPath,
      testTvSeriesDetail.genres,
      testTvSeriesDetail.id,
      testTvSeriesDetail.overview,
      testTvSeriesDetail.posterPath,
      testTvSeriesDetail.firstAirDate,
      testTvSeriesDetail.name,
      testTvSeriesDetail.voteAverage,
      testTvSeriesDetail.voteCount,
      testTvSeriesDetail.seasons,
      testTvSeriesDetail.numberOfSeasons,
      testTvSeriesDetail.numberOfEpisodes,
      testTvSeriesDetail.languages,
      testTvSeriesDetail.status,
      testTvSeriesDetail.tagline,
      testTvSeriesDetail.homepage,
      testTvSeriesDetail.inProduction,
      testTvSeriesDetail.lastAirDate,
      testTvSeriesDetail.episodeRunTime,
    ]);
  });

  test('equality comparison should work correctly', () {
    final sameTvSeriesDetail = TvSeriesDetail(
      adult: false,
      backdropPath: 'backdropPath',
      genres: [testGenre],
      id: 1,
      overview: 'Overview',
      posterPath: 'posterPath',
      firstAirDate: '2022-01-01',
      name: 'Name',
      voteAverage: 8.0,
      voteCount: 100,
      seasons: [testSeason],
      numberOfSeasons: 1,
      numberOfEpisodes: 10,
      popularity: 100.0,
      status: 'Ended',
      tagline: 'Tagline',
      type: 'Scripted',
      homepage: 'https://example.com',
      inProduction: false,
      lastAirDate: '2022-12-31', episodeRunTime: [], languages: [],
    );

    final differentTvSeriesDetail = TvSeriesDetail(
      adult: false,
      backdropPath: 'differentPath',
      genres: [testGenre],
      id: 2,
      overview: 'Different Overview',
      posterPath: 'posterPath',
      firstAirDate: '2022-01-01',
      name: 'Name',
      voteAverage: 8.0,
      voteCount: 100,
      seasons: [testSeason],
      numberOfSeasons: 1,
      numberOfEpisodes: 10,
      popularity: 100.0,
      status: 'Ended',
      tagline: 'Tagline',
      type: 'Scripted',
      homepage: 'https://example.com',
      inProduction: false,
      lastAirDate: '2022-12-31', episodeRunTime: [], languages: [],
    );

    expect(testTvSeriesDetail == sameTvSeriesDetail, true);
    expect(testTvSeriesDetail == differentTvSeriesDetail, false);
  });
}