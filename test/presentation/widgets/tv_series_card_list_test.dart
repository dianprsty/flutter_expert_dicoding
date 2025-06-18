import 'package:cached_network_image/cached_network_image.dart';
import 'package:ditonton/domain/entities/tv_series.dart';
import 'package:ditonton/presentation/pages/tv_series_detail_page.dart';
import 'package:ditonton/presentation/widgets/tv_series_card_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final testTvSeries = TvSeries(
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

  Widget _makeTestableWidget(Widget body) {
    return MaterialApp(
      home: Scaffold(
        body: body,
      ),
      routes: {
        TvSeriesDetailPage.ROUTE_NAME: (_) => Container(),
      },
    );
  }

  testWidgets('TvSeriesCard should display TV series information correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(_makeTestableWidget(TvSeriesCard(testTvSeries)));

    expect(find.text('Game of Thrones'), findsOneWidget);
    expect(find.text('Seven noble families fight for control of the mythical land of Westeros.'), findsOneWidget);
    expect(find.byType(CachedNetworkImage), findsOneWidget);
  });

  testWidgets('TvSeriesCard should navigate to detail page when tapped',
      (WidgetTester tester) async {
    await tester.pumpWidget(_makeTestableWidget(TvSeriesCard(testTvSeries)));

    await tester.tap(find.byType(InkWell));
    await tester.pumpAndSettle();

    expect(find.byType(Container), findsOneWidget);
  });

  testWidgets('TvSeriesCard should display placeholder when name is null',
      (WidgetTester tester) async {
    final tvSeriesWithNullName = TvSeries(
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
      name: null,
      voteAverage: 8.3,
      voteCount: 11504,
    );

    await tester.pumpWidget(_makeTestableWidget(TvSeriesCard(tvSeriesWithNullName)));

    expect(find.text('-'), findsOneWidget);
  });
}