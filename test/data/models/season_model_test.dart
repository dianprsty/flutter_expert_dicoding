import 'package:ditonton/data/models/season_model.dart';
import 'package:ditonton/domain/entities/season.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final tSeasonModel = SeasonModel(
    airDate: '2022-01-01',
    episodeCount: 10,
    id: 1,
    name: 'Season 1',
    overview: 'Overview',
    posterPath: '/path.jpg',
    seasonNumber: 1,
    voteAverage: 8.5,
  );

  final tSeason = Season(
    airDate: '2022-01-01',
    episodeCount: 10,
    id: 1,
    name: 'Season 1',
    overview: 'Overview',
    posterPath: '/path.jpg',
    seasonNumber: 1,
    voteAverage: 8.5,
  );

  test('should be a subclass of Season entity', () async {
    final result = tSeasonModel.toEntity();
    expect(result, tSeason);
  });

  test('should create SeasonModel from JSON', () async {
    // arrange
    final Map<String, dynamic> jsonMap = {
      'air_date': '2022-01-01',
      'episode_count': 10,
      'id': 1,
      'name': 'Season 1',
      'overview': 'Overview',
      'poster_path': '/path.jpg',
      'season_number': 1,
      'vote_average': 8.5
    };
    
    // act
    final result = SeasonModel.fromJson(jsonMap);
    
    // assert
    expect(result, tSeasonModel);
  });

  test('should convert to JSON map', () async {
    // arrange
    final expectedJsonMap = {
      'air_date': '2022-01-01',
      'episode_count': 10,
      'id': 1,
      'name': 'Season 1',
      'overview': 'Overview',
      'poster_path': '/path.jpg',
      'season_number': 1,
      'vote_average': 8.5
    };
    
    // act
    final result = tSeasonModel.toJson();
    
    // assert
    expect(result, expectedJsonMap);
  });
}