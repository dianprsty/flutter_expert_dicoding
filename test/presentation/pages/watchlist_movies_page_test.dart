import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/entities/movie.dart';
import 'package:ditonton/domain/entities/tv_series.dart';
import 'package:ditonton/presentation/pages/watchlist_movies_page.dart';
import 'package:ditonton/presentation/provider/movie/watchlist_movie_notifier.dart';
import 'package:ditonton/presentation/provider/tv_series/watchlist_tv_series_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';

import '../../dummy_data/dummy_objects.dart';
import 'watchlist_movies_page_test.mocks.dart';

class MockRouteObserver extends Mock implements RouteObserver<ModalRoute<dynamic>> {}

@GenerateMocks([WatchlistMovieNotifier, WatchlistTvSeriesNotifier])
void main() {
  late MockWatchlistMovieNotifier mockWatchlistMovieNotifier;
  late MockWatchlistTvSeriesNotifier mockWatchlistTvSeriesNotifier;
  late MockRouteObserver mockRouteObserver;

  setUp(() {
    mockWatchlistMovieNotifier = MockWatchlistMovieNotifier();
    mockWatchlistTvSeriesNotifier = MockWatchlistTvSeriesNotifier();
    mockRouteObserver = MockRouteObserver();
  });

  Widget _makeTestableWidget(Widget body) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<WatchlistMovieNotifier>.value(
          value: mockWatchlistMovieNotifier,
        ),
        ChangeNotifierProvider<WatchlistTvSeriesNotifier>.value(
          value: mockWatchlistTvSeriesNotifier,
        ),
      ],
      child: MaterialApp(
        home: body,
        navigatorObservers: [mockRouteObserver],
      ),
    );
  }

  group('Watchlist Movies Page', () {
    testWidgets('Page should display center progress bar when loading',
        (WidgetTester tester) async {
      when(mockWatchlistMovieNotifier.watchlistState).thenReturn(RequestState.Loading);
      when(mockWatchlistTvSeriesNotifier.watchlistState).thenReturn(RequestState.Loading);

      final progressBarFinder = find.byType(CircularProgressIndicator);

      await tester.pumpWidget(_makeTestableWidget(WatchlistMoviesPage()));
      await tester.pump();

      expect(find.byType(TabBar), findsOneWidget);
      expect(find.byType(Tab), findsNWidgets(2));
      expect(find.text('Tv Series'), findsOneWidget);
      expect(find.text('Movies'), findsOneWidget);

      expect(progressBarFinder, findsOneWidget);
    });

    testWidgets('Page should display ListView when TV Series data is loaded',
        (WidgetTester tester) async {
      when(mockWatchlistTvSeriesNotifier.watchlistState).thenReturn(RequestState.Loaded);
      when(mockWatchlistTvSeriesNotifier.watchlistTvSeries).thenReturn([testWatchlistTvSeries]);
      when(mockWatchlistMovieNotifier.watchlistState).thenReturn(RequestState.Loading);

      await tester.pumpWidget(_makeTestableWidget(WatchlistMoviesPage()));
      await tester.pump();

      expect(find.byType(ListView), findsOneWidget);
    });

    testWidgets('Page should display text with message when TV Series Error',
        (WidgetTester tester) async {
      when(mockWatchlistTvSeriesNotifier.watchlistState).thenReturn(RequestState.Error);
      when(mockWatchlistTvSeriesNotifier.message).thenReturn('Error message');
      when(mockWatchlistMovieNotifier.watchlistState).thenReturn(RequestState.Loading);

      final textFinder = find.byKey(Key('error_message'));

      await tester.pumpWidget(_makeTestableWidget(WatchlistMoviesPage()));
      await tester.pump();

      expect(textFinder, findsOneWidget);
    });

    testWidgets('Page should display ListView when Movies data is loaded',
        (WidgetTester tester) async {
      when(mockWatchlistTvSeriesNotifier.watchlistState).thenReturn(RequestState.Loading);
      when(mockWatchlistMovieNotifier.watchlistState).thenReturn(RequestState.Loaded);
      when(mockWatchlistMovieNotifier.watchlistMovies).thenReturn([testWatchlistMovie]);

      await tester.pumpWidget(_makeTestableWidget(WatchlistMoviesPage()));
    
      await tester.tap(find.text('Movies'));
      
      await tester.pump();
      await tester.pump(const Duration(seconds: 1));

      expect(find.byType(ListView), findsOneWidget);
    });

    testWidgets('Page should display text with message when Movies Error',
        (WidgetTester tester) async {
      when(mockWatchlistTvSeriesNotifier.watchlistState).thenReturn(RequestState.Loading);
      when(mockWatchlistMovieNotifier.watchlistState).thenReturn(RequestState.Error);
      when(mockWatchlistMovieNotifier.message).thenReturn('Error message');

      await tester.pumpWidget(_makeTestableWidget(WatchlistMoviesPage()));
      
      await tester.tap(find.text('Movies'));
      
      await tester.pump();
      await tester.pump(const Duration(seconds: 1));

      expect(find.byKey(Key('error_message')), findsOneWidget);
    });

    testWidgets('Page should display empty message when no watchlist TV Series',
        (WidgetTester tester) async {
      when(mockWatchlistTvSeriesNotifier.watchlistState).thenReturn(RequestState.Loaded);
      when(mockWatchlistTvSeriesNotifier.watchlistTvSeries).thenReturn([]);
      when(mockWatchlistMovieNotifier.watchlistState).thenReturn(RequestState.Loading);

      await tester.pumpWidget(_makeTestableWidget(WatchlistMoviesPage()));
      await tester.pump();

      expect(find.text('No Watchlist Tv Series'), findsOneWidget);
    });

    testWidgets('Page should display empty message when no watchlist Movies',
        (WidgetTester tester) async {
      when(mockWatchlistTvSeriesNotifier.watchlistState).thenReturn(RequestState.Loading);
      when(mockWatchlistMovieNotifier.watchlistState).thenReturn(RequestState.Loaded);
      when(mockWatchlistMovieNotifier.watchlistMovies).thenReturn([]);

      await tester.pumpWidget(_makeTestableWidget(WatchlistMoviesPage()));
      
      await tester.tap(find.text('Movies'));
      
      await tester.pump();
      await tester.pump(const Duration(seconds: 1));

      expect(find.text('No Watchlist Movies'), findsOneWidget);
    });
  });
}