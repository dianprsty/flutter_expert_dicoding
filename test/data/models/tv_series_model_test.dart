import 'package:ditonton/data/models/tv_series_model.dart';
import 'package:ditonton/domain/entities/tv_series.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final tTvSeriesModel = TvSeriesModel(
    adult: false,
    backdropPath: 'backdropPath',
    genreIds: [1, 2, 3],
    id: 1,
    originCountry: ['US'],
    originalLanguage: 'en',
    originalName: 'originalName',
    overview: 'overview',
    popularity: 1,
    posterPath: 'posterPath',
    firstAirDate: '2022-01-01',
    name: 'name',
    voteAverage: 1,
    voteCount: 1,
  );

  final tTvSeries = TvSeries(
    adult: false,
    backdropPath: 'backdropPath',
    genreIds: [1, 2, 3],
    id: 1,
    originCountry: ['US'],
    originalLanguage: 'en',
    originalName: 'originalName',
    overview: 'overview',
    popularity: 1,
    posterPath: 'posterPath',
    firstAirDate: '2022-01-01',
    name: 'name',
    voteAverage: 1,
    voteCount: 1,
  );

  test('should be a subclass of TvSeries entity', () async {
    final result = tTvSeriesModel.toEntity();
    expect(result, tTvSeries);
  });

  test('should create TvSeriesModel from JSON', () async {
    // arrange
    final Map<String, dynamic> jsonMap = {
      'adult': false,
      'backdrop_path': 'backdropPath',
      'genre_ids': [1, 2, 3],
      'id': 1,
      'origin_country': ['US'],
      'original_language': 'en',
      'original_name': 'originalName',
      'overview': 'overview',
      'popularity': 1.0,
      'poster_path': 'posterPath',
      'first_air_date': '2022-01-01',
      'name': 'name',
      'vote_average': 1.0,
      'vote_count': 1
    };
    
    // act
    final result = TvSeriesModel.fromJson(jsonMap);
    
    // assert
    expect(result, tTvSeriesModel);
  });

  test('should convert to JSON map', () async {
    // arrange
    final expectedJsonMap = {
      'adult': false,
      'backdrop_path': 'backdropPath',
      'genre_ids': [1, 2, 3],
      'id': 1,
      'origin_country': ['US'],
      'original_language': 'en',
      'original_name': 'originalName',
      'overview': 'overview',
      'popularity': 1.0,
      'poster_path': 'posterPath',
      'first_air_date': '2022-01-01',
      'name': 'name',
      'vote_average': 1.0,
      'vote_count': 1
    };
    
    // act
    final result = tTvSeriesModel.toJson();
    
    // assert
    expect(result, expectedJsonMap);
  });
}