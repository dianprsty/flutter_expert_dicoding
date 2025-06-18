import 'package:cached_network_image/cached_network_image.dart';
import 'package:ditonton/domain/entities/movie.dart';
import 'package:ditonton/presentation/pages/movie_detail_page.dart';
import 'package:ditonton/presentation/widgets/movie_card_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final testMovie = Movie(
    adult: false,
    backdropPath: '/muth4OYamXf41G2evdrLEg8d3om.jpg',
    genreIds: [14, 28],
    id: 557,
    originalTitle: 'Spider-Man',
    overview: 'After being bitten by a genetically altered spider, nerdy high school student Peter Parker is endowed with amazing powers.',
    popularity: 60.441,
    posterPath: '/rweIrveL43TaxUN0akQEaAXL6x0.jpg',
    releaseDate: '2002-05-01',
    title: 'Spider-Man',
    video: false,
    voteAverage: 7.2,
    voteCount: 13507,
  );

  Widget _makeTestableWidget(Widget body) {
    return MaterialApp(
      home: Scaffold(
        body: body,
      ),
      routes: {
        MovieDetailPage.ROUTE_NAME: (_) => Container(),
      },
    );
  }

  testWidgets('MovieCard should display movie information correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(_makeTestableWidget(MovieCard(testMovie)));

    expect(find.text('Spider-Man'), findsOneWidget);
    expect(find.text('After being bitten by a genetically altered spider, nerdy high school student Peter Parker is endowed with amazing powers.'), findsOneWidget);
    expect(find.byType(CachedNetworkImage), findsOneWidget);
  });

  testWidgets('MovieCard should navigate to detail page when tapped',
      (WidgetTester tester) async {
    await tester.pumpWidget(_makeTestableWidget(MovieCard(testMovie)));

    await tester.tap(find.byType(InkWell));
    await tester.pumpAndSettle();

    expect(find.byType(Container), findsOneWidget);
  });

  testWidgets('MovieCard should display placeholder when title is null',
      (WidgetTester tester) async {
    final movieWithNullTitle = Movie(
      adult: false,
      backdropPath: '/muth4OYamXf41G2evdrLEg8d3om.jpg',
      genreIds: [14, 28],
      id: 557,
      originalTitle: 'Spider-Man',
      overview: 'After being bitten by a genetically altered spider.',
      popularity: 60.441,
      posterPath: '/rweIrveL43TaxUN0akQEaAXL6x0.jpg',
      releaseDate: '2002-05-01',
      title: null,
      video: false,
      voteAverage: 7.2,
      voteCount: 13507,
    );

    await tester.pumpWidget(_makeTestableWidget(MovieCard(movieWithNullTitle)));

    expect(find.text('-'), findsOneWidget);
  });
}