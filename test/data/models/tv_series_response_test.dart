import 'dart:convert';

import 'package:ditonton/data/models/tv_series_model.dart';
import 'package:ditonton/data/models/tv_series_response.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../json_reader.dart';

void main() {
  final tTvSeriesModel = TvSeriesModel(
    adult: false,
    backdropPath: '/96RT2A47UdzWlUfvIERFyBsLhL2.jpg',
    genreIds: [16, 10759, 18, 10765],
    id: 209867,
    originCountry: ['JP'],
    originalLanguage: 'ja',
    originalName: 'Frieren',
    overview:
        'Decades after her party defeated the Demon King, '
        'an old friend\'s funeral launches the elf wizard Frieren '
        'on a journey of self-discovery.',
    popularity: 45.4982,
    posterPath: '/dqZENchTd7lp5zht7BdlqM7RBhD.jpg',
    firstAirDate: '2023-09-29',
    name: "Frieren: Beyond Journey's End",
    voteAverage: 8.8,
    voteCount: 451,
  );

  final tTvSeriesResponseModel = TvSeriesResponse(
    tvSeriesList: <TvSeriesModel>[tTvSeriesModel],
  );

  group('fromJson', () {
    test('should return a valid model from JSON', () async {
      // arrange
      final Map<String, dynamic> jsonMap = json.decode(
        readJson('dummy_data/search_frieren_tv_series.json'),
      );

      // act
      final result = TvSeriesResponse.fromJson(jsonMap);

      // assert
      expect(result, tTvSeriesResponseModel);
    });
  });

  group('toJson', () {
    test('should return a JSON map containing proper data', () async {
      // act
      final result = tTvSeriesResponseModel.toJson();

      // assert
      final expectedJsonMap = {
        'results': [
          {
            'adult': false,
            'backdrop_path': '/96RT2A47UdzWlUfvIERFyBsLhL2.jpg',
            'genre_ids': [16, 10759, 18, 10765],
            'id': 209867,
            'origin_country': ['JP'],
            'original_language': 'ja',
            'original_name': 'Frieren',
            'overview':
                'Decades after her party defeated the Demon King, '
                'an old friend\'s funeral launches the elf wizard '
                'Frieren on a journey of self-discovery.',
            'popularity': 45.4982,
            'poster_path': '/dqZENchTd7lp5zht7BdlqM7RBhD.jpg',
            'first_air_date': '2023-09-29',
            'name': "Frieren: Beyond Journey's End",
            'vote_average': 8.8,
            'vote_count': 451,
          },
        ],
      };
      expect(result, expectedJsonMap);
    });
  });
}
