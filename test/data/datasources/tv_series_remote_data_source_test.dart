import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

import 'package:ditonton/common/exception.dart';
import 'package:ditonton/data/datasources/tv_series_remote_data_source.dart';
import 'package:ditonton/data/models/tv_series_detail_model.dart';
import 'package:ditonton/data/models/tv_series_response.dart';

import '../../helpers/test_helper.mocks.dart';
import '../../json_reader.dart';

void main() {
  const apiKey = 'api_key=2174d146bb9c0eab47529b2e77d6b526';
  const baseUrl = 'https://api.themoviedb.org/3';

  late TvSeriesRemoteDataSourceImpl dataSource;
  late MockHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockHttpClient();
    dataSource = TvSeriesRemoteDataSourceImpl(client: mockHttpClient);
  });

  group('get On The Air TV Series', () {
    final tTvSeriesList = TvSeriesResponse.fromJson(
      json.decode(readJson('dummy_data/on_the_air_tv_series.json')),
    ).tvSeriesList;

    test(
      'should return list of TV Series Model when the response code is 200',
      () async {
        // arrange
        when(
          mockHttpClient.get(Uri.parse('$baseUrl/tv/on_the_air?$apiKey')),
        ).thenAnswer(
          (_) async => http.Response(
            readJson('dummy_data/on_the_air_tv_series.json'),
            200,
          ),
        );
        // act
        final result = await dataSource.getOnTheAirTvSeries();
        // assert
        expect(result, equals(tTvSeriesList));
      },
    );

    test(
      'should throw a ServerException when the response code is 404 or other',
      () async {
        // arrange
        when(
          mockHttpClient.get(Uri.parse('$baseUrl/tv/on_the_air?$apiKey')),
        ).thenAnswer((_) async => http.Response('Not Found', 404));
        // act
        final call = dataSource.getOnTheAirTvSeries();
        // assert
        expect(() => call, throwsA(isA<ServerException>()));
      },
    );
  });

  group('get Popular TV Series', () {
    test(
      'should return list of TV Series when response is success (200)',
      () async {
        // arrange
        when(
          mockHttpClient.get(Uri.parse('$baseUrl/tv/popular?$apiKey')),
        ).thenAnswer(
          (_) async =>
              http.Response(readJson('dummy_data/popular_tv_series.json'), 200),
        );
        // act
        final result = await dataSource.getPopularTvSeries();
        // assert
        expect(result.isNotEmpty, true);
      },
    );

    test(
      'should throw a ServerException when the response code is 404 or other',
      () async {
        // arrange
        when(
          mockHttpClient.get(Uri.parse('$baseUrl/tv/popular?$apiKey')),
        ).thenAnswer((_) async => http.Response('Not Found', 404));
        // act
        final call = dataSource.getPopularTvSeries();
        // assert
        expect(() => call, throwsA(isA<ServerException>()));
      },
    );
  });

  group('get Top Rated TV Series', () {
    test(
      'should return list of TV Series when response is success (200)',
      () async {
        // arrange
        when(
          mockHttpClient.get(Uri.parse('$baseUrl/tv/top_rated?$apiKey')),
        ).thenAnswer(
          (_) async => http.Response(
            readJson('dummy_data/top_rated_tv_series.json'),
            200,
          ),
        );
        // act
        final result = await dataSource.getTopRatedTvSeries();
        // assert
        expect(result.isNotEmpty, true);
      },
    );

    test(
      'should throw a ServerException when the response code is 404 or other',
      () async {
        // arrange
        when(
          mockHttpClient.get(Uri.parse('$baseUrl/tv/top_rated?$apiKey')),
        ).thenAnswer((_) async => http.Response('Not Found', 404));
        // act
        final call = dataSource.getTopRatedTvSeries();
        // assert
        expect(() => call, throwsA(isA<ServerException>()));
      },
    );
  });

  group('get Tv Series Detail', () {
    final tId = 1;
    final tTvSeriesDetail = TvSeriesDetailResponse.fromJson(
      json.decode(readJson('dummy_data/tv_series_detail.json')),
    );

    test(
      'should return TV Series detail when the response code is 200',
      () async {
        // arrange
        when(
          mockHttpClient.get(Uri.parse('$baseUrl/tv/$tId?$apiKey')),
        ).thenAnswer(
          (_) async =>
              http.Response(readJson('dummy_data/tv_series_detail.json'), 200),
        );
        // act
        final result = await dataSource.getTvSeriesDetail(tId);
        // assert
        expect(result, equals(tTvSeriesDetail));
      },
    );

    test(
      'should throw a ServerException when the response code is 404 or other',
      () async {
        // arrange
        when(
          mockHttpClient.get(Uri.parse('$baseUrl/tv/$tId?$apiKey')),
        ).thenAnswer((_) async => http.Response('Not Found', 404));
        // act
        final call = dataSource.getTvSeriesDetail(tId);
        // assert
        expect(() => call, throwsA(isA<ServerException>()));
      },
    );
  });

  group('get Tv Series Recommendations', () {
    final tTvSeriesList = TvSeriesResponse.fromJson(
      json.decode(readJson('dummy_data/tv_series_recommendations.json')),
    ).tvSeriesList;
    final tId = 1;

    test(
      'should return list of TV Series Model when the response code is 200',
      () async {
        // arrange
        when(
          mockHttpClient.get(
            Uri.parse('$baseUrl/tv/$tId/recommendations?$apiKey'),
          ),
        ).thenAnswer(
          (_) async => http.Response(
            readJson('dummy_data/tv_series_recommendations.json'),
            200,
          ),
        );
        // act
        final result = await dataSource.getTvSeriesRecommendations(tId);
        // assert
        expect(result, equals(tTvSeriesList));
      },
    );

    test(
      'should throw ServerException when the response code is 404 or other',
      () async {
        // arrange
        when(
          mockHttpClient.get(
            Uri.parse('$baseUrl/tv/$tId/recommendations?$apiKey'),
          ),
        ).thenAnswer((_) async => http.Response('Not Found', 404));
        // act
        final call = dataSource.getTvSeriesRecommendations(tId);
        // assert
        expect(() => call, throwsA(isA<ServerException>()));
      },
    );
  });

  group('search tv series', () {
    final tSearchResult = TvSeriesResponse.fromJson(
      json.decode(readJson('dummy_data/search_frieren_tv_series.json')),
    ).tvSeriesList;
    final tQuery = 'frieren';

    test('should return list of tv series when response code is 200', () async {
      // arrange
      when(
        mockHttpClient.get(
          Uri.parse('$baseUrl/search/tv?$apiKey&query=$tQuery'),
        ),
      ).thenAnswer(
        (_) async => http.Response(
          readJson('dummy_data/search_frieren_tv_series.json'),
          200,
        ),
      );
      // act
      final result = await dataSource.searchTvSeries(tQuery);
      // assert
      expect(result, tSearchResult);
    });

    test(
      'should throw ServerException when response code is 404 or other',
      () async {
        // arrange
        when(
          mockHttpClient.get(
            Uri.parse('$baseUrl/search/tv?$apiKey&query=$tQuery'),
          ),
        ).thenAnswer((_) async => http.Response('Not Found', 404));
        // act
        final call = dataSource.searchTvSeries(tQuery);
        // assert
        expect(() => call, throwsA(isA<ServerException>()));
      },
    );
  });
}
