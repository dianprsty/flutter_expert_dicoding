import 'package:ditonton/domain/entities/season.dart';
import 'package:ditonton/presentation/widgets/season_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final testSeason = Season(
    airDate: '2011-04-17',
    episodeCount: 10,
    id: 1,
    name: 'Season 1',
    overview: 'First season of Game of Thrones.',
    posterPath: '/rweIrveL43TaxUN0akQEaAXL6x0.jpg',
    seasonNumber: 1,
    voteAverage: 8.0,
  );

  Widget makeTestableWidget(Widget body) {
    return MaterialApp(home: Scaffold(body: body));
  }

  testWidgets('SeasonCard should display season information correctly', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      makeTestableWidget(SeasonCard(season: testSeason)),
    );

    await tester.pumpAndSettle(Duration(seconds: 1));

    expect(find.text('Season 1'), findsOneWidget);
    expect(find.text('Air Date: 2011-04-17'), findsOneWidget);
    expect(find.text('Episodes: 10'), findsOneWidget);
    expect(find.text('8.0/10'), findsOneWidget);
  });

  testWidgets('SeasonCard should display placeholder when posterPath is null', (
    WidgetTester tester,
  ) async {
    final seasonWithNullPoster = Season(
      airDate: '2011-04-17',
      episodeCount: 10,
      id: 1,
      name: 'Season 1',
      overview: 'First season of Game of Thrones.',
      posterPath: null,
      seasonNumber: 1,
      voteAverage: 8.0,
    );

    await tester.pumpWidget(
      makeTestableWidget(SeasonCard(season: seasonWithNullPoster)),
    );

    expect(find.byIcon(Icons.image_not_supported), findsOneWidget);
  });

  testWidgets('SeasonCard should display unknown when airDate is null', (
    WidgetTester tester,
  ) async {
    final seasonWithNullAirDate = Season(
      airDate: null,
      episodeCount: 10,
      id: 1,
      name: 'Season 1',
      overview: 'First season of Game of Thrones.',
      posterPath: '/rweIrveL43TaxUN0akQEaAXL6x0.jpg',
      seasonNumber: 1,
      voteAverage: 8.0,
    );

    await tester.pumpWidget(
      makeTestableWidget(SeasonCard(season: seasonWithNullAirDate)),
    );

    expect(find.text('Air Date: Unknown'), findsOneWidget);
  });

  testWidgets('SeasonCard should display dash when voteAverage is 0.0', (
    WidgetTester tester,
  ) async {
    final seasonWithZeroVote = Season(
      airDate: '2011-04-17',
      episodeCount: 10,
      id: 1,
      name: 'Season 1',
      overview: 'First season of Game of Thrones.',
      posterPath: '/rweIrveL43TaxUN0akQEaAXL6x0.jpg',
      seasonNumber: 1,
      voteAverage: 0.0,
    );

    await tester.pumpWidget(
      makeTestableWidget(SeasonCard(season: seasonWithZeroVote)),
    );

    expect(find.text('-'), findsOneWidget);
  });
}
