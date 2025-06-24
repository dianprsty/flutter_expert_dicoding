import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/common/utils.dart';
import 'package:ditonton/presentation/bloc/movie/watchlist/watchlist_movie_bloc.dart';
import 'package:ditonton/presentation/bloc/tv_series/watchlist/watchlist_tv_series_bloc.dart';
import 'package:ditonton/presentation/pages/watchlist_movies_page.dart';

import '../../dummy_data/dummy_objects.dart';

import 'watchlist_movies_page_test.mocks.dart';

@GenerateMocks([WatchlistMovieBloc, WatchlistTvSeriesBloc])
void main() {
  late MockWatchlistMovieBloc mockWatchlistMovieBloc;
  late MockWatchlistTvSeriesBloc mockWatchlistTvSeriesBloc;

  setUp(() {
    mockWatchlistMovieBloc = MockWatchlistMovieBloc();
    mockWatchlistTvSeriesBloc = MockWatchlistTvSeriesBloc();
    when(mockWatchlistTvSeriesBloc.state).thenReturn(WatchlistTvSeriesState());
    when(
      mockWatchlistTvSeriesBloc.stream,
    ).thenAnswer((_) => Stream.value(WatchlistTvSeriesState()));
    when(mockWatchlistMovieBloc.state).thenReturn(WatchlistMovieState());
    when(
      mockWatchlistMovieBloc.stream,
    ).thenAnswer((_) => Stream.value(WatchlistMovieState()));
  });

  tearDown(() {
    mockWatchlistMovieBloc.close();
    mockWatchlistTvSeriesBloc.close();
  });

  Widget _makeTestableWidget(Widget body) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<WatchlistMovieBloc>.value(value: mockWatchlistMovieBloc),
        BlocProvider<WatchlistTvSeriesBloc>.value(
          value: mockWatchlistTvSeriesBloc,
        ),
      ],
      child: MaterialApp(home: body, navigatorObservers: [routeObserver]),
    );
  }

  group('Watchlist Movies Page', () {
    testWidgets('Page should display center progress bar when loading', (
      WidgetTester tester,
    ) async {
      reset(mockWatchlistTvSeriesBloc);
      reset(mockWatchlistMovieBloc);

      when(mockWatchlistTvSeriesBloc.state).thenReturn(
        WatchlistTvSeriesState(
          requestState: RequestState.Loading,
          watchlistTvSeries: [],
          message: '',
        ),
      );
      when(mockWatchlistTvSeriesBloc.stream).thenAnswer(
        (_) => Stream.value(
          WatchlistTvSeriesState(
            requestState: RequestState.Loading,
            watchlistTvSeries: [],
            message: '',
          ),
        ),
      );

      when(mockWatchlistMovieBloc.state).thenReturn(
        WatchlistMovieState(
          requestState: RequestState.Loading,
          watchlistMovies: [],
          message: '',
        ),
      );
      when(mockWatchlistMovieBloc.stream).thenAnswer(
        (_) => Stream.value(
          WatchlistMovieState(
            requestState: RequestState.Loading,
            watchlistMovies: [],
            message: '',
          ),
        ),
      );

      await tester.pumpWidget(_makeTestableWidget(WatchlistMoviesPage()));

      await tester.pump();
      await tester.pump(const Duration(milliseconds: 500));

      expect(find.text('Tv Series'), findsOneWidget);
      expect(find.byKey(const Key('tv_series_loading')), findsOneWidget);
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('Page should display ListView when TV Series data is loaded', (
      WidgetTester tester,
    ) async {
      reset(mockWatchlistTvSeriesBloc);
      reset(mockWatchlistMovieBloc);

      when(mockWatchlistTvSeriesBloc.state).thenReturn(
        WatchlistTvSeriesState(
          requestState: RequestState.Loaded,
          watchlistTvSeries: [testWatchlistTvSeries],
          message: '',
        ),
      );
      when(mockWatchlistTvSeriesBloc.stream).thenAnswer(
        (_) => Stream.value(
          WatchlistTvSeriesState(
            requestState: RequestState.Loaded,
            watchlistTvSeries: [testWatchlistTvSeries],
            message: '',
          ),
        ),
      );

      when(mockWatchlistMovieBloc.state).thenReturn(
        WatchlistMovieState(
          requestState: RequestState.Loading,
          watchlistMovies: [],
          message: '',
        ),
      );
      when(mockWatchlistMovieBloc.stream).thenAnswer(
        (_) => Stream.value(
          WatchlistMovieState(
            requestState: RequestState.Loading,
            watchlistMovies: [],
            message: '',
          ),
        ),
      );

      await tester.pumpWidget(_makeTestableWidget(WatchlistMoviesPage()));

      await tester.pump();
      await tester.pump(const Duration(milliseconds: 500));

      expect(find.text('Tv Series'), findsOneWidget);

      expect(find.byKey(const Key('tv_series_list')), findsOneWidget);
      expect(find.byType(ListView), findsOneWidget);
    });

    testWidgets('Page should display text with message when TV Series Error', (
      WidgetTester tester,
    ) async {
      reset(mockWatchlistTvSeriesBloc);
      reset(mockWatchlistMovieBloc);

      when(mockWatchlistTvSeriesBloc.state).thenReturn(
        WatchlistTvSeriesState(
          requestState: RequestState.Error,
          watchlistTvSeries: [],
          message: 'Error message',
        ),
      );
      when(mockWatchlistTvSeriesBloc.stream).thenAnswer(
        (_) => Stream.value(
          WatchlistTvSeriesState(
            requestState: RequestState.Error,
            watchlistTvSeries: [],
            message: 'Error message',
          ),
        ),
      );

      when(mockWatchlistMovieBloc.state).thenReturn(
        WatchlistMovieState(
          requestState: RequestState.Loading,
          watchlistMovies: [],
          message: '',
        ),
      );
      when(mockWatchlistMovieBloc.stream).thenAnswer(
        (_) => Stream.value(
          WatchlistMovieState(
            requestState: RequestState.Loading,
            watchlistMovies: [],
            message: '',
          ),
        ),
      );

      await tester.pumpWidget(_makeTestableWidget(WatchlistMoviesPage()));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 500));

      expect(find.text('Tv Series'), findsOneWidget);
      expect(find.byKey(const Key('error_message')), findsOneWidget);
      expect(find.text('Error message'), findsOneWidget);
    });

    testWidgets('Page should display ListView when Movies data is loaded', (
      WidgetTester tester,
    ) async {
      reset(mockWatchlistTvSeriesBloc);
      reset(mockWatchlistMovieBloc);

      when(mockWatchlistTvSeriesBloc.state).thenReturn(
        WatchlistTvSeriesState(
          requestState: RequestState.Loading,
          watchlistTvSeries: [],
          message: '',
        ),
      );
      when(mockWatchlistTvSeriesBloc.stream).thenAnswer(
        (_) => Stream.value(
          WatchlistTvSeriesState(
            requestState: RequestState.Loading,
            watchlistTvSeries: [],
            message: '',
          ),
        ),
      );

      when(mockWatchlistMovieBloc.state).thenReturn(
        WatchlistMovieState(
          requestState: RequestState.Loaded,
          watchlistMovies: [testWatchlistMovie],
          message: '',
        ),
      );
      when(mockWatchlistMovieBloc.stream).thenAnswer(
        (_) => Stream.value(
          WatchlistMovieState(
            requestState: RequestState.Loaded,
            watchlistMovies: [testWatchlistMovie],
            message: '',
          ),
        ),
      );

      await tester.pumpWidget(_makeTestableWidget(WatchlistMoviesPage()));

      await tester.tap(find.text('Movies'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 500));

      expect(find.text('Movies'), findsOneWidget);

      expect(find.byKey(const Key('movie_list')), findsOneWidget);
      expect(find.byType(ListView), findsOneWidget);
    });

    testWidgets('Page should display text with message when Movies Error', (
      WidgetTester tester,
    ) async {
      reset(mockWatchlistTvSeriesBloc);
      reset(mockWatchlistMovieBloc);

      when(mockWatchlistTvSeriesBloc.state).thenReturn(
        WatchlistTvSeriesState(
          requestState: RequestState.Loading,
          watchlistTvSeries: [],
          message: '',
        ),
      );
      when(mockWatchlistTvSeriesBloc.stream).thenAnswer(
        (_) => Stream.value(
          WatchlistTvSeriesState(
            requestState: RequestState.Loading,
            watchlistTvSeries: [],
            message: '',
          ),
        ),
      );

      when(mockWatchlistMovieBloc.state).thenReturn(
        WatchlistMovieState(
          requestState: RequestState.Error,
          watchlistMovies: [],
          message: 'Error message',
        ),
      );
      when(mockWatchlistMovieBloc.stream).thenAnswer(
        (_) => Stream.value(
          WatchlistMovieState(
            requestState: RequestState.Error,
            watchlistMovies: [],
            message: 'Error message',
          ),
        ),
      );

      await tester.pumpWidget(_makeTestableWidget(WatchlistMoviesPage()));

      await tester.tap(find.text('Movies'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 500));

      expect(find.text('Movies'), findsOneWidget);
      expect(find.byKey(const Key('error_message')), findsOneWidget);
      expect(find.text('Error message'), findsOneWidget);
    });

    testWidgets(
      'Page should display empty message when no watchlist TV Series',
      (WidgetTester tester) async {
        reset(mockWatchlistTvSeriesBloc);
        reset(mockWatchlistMovieBloc);

        when(mockWatchlistTvSeriesBloc.state).thenReturn(
          WatchlistTvSeriesState(
            requestState: RequestState.Loaded,
            watchlistTvSeries: [],
            message: '',
          ),
        );
        when(mockWatchlistTvSeriesBloc.stream).thenAnswer(
          (_) => Stream.value(
            WatchlistTvSeriesState(
              requestState: RequestState.Loaded,
              watchlistTvSeries: [],
              message: '',
            ),
          ),
        );

        when(mockWatchlistMovieBloc.state).thenReturn(
          WatchlistMovieState(
            requestState: RequestState.Loading,
            watchlistMovies: [],
            message: '',
          ),
        );
        when(mockWatchlistMovieBloc.stream).thenAnswer(
          (_) => Stream.value(
            WatchlistMovieState(
              requestState: RequestState.Loading,
              watchlistMovies: [],
              message: '',
            ),
          ),
        );

        await tester.pumpWidget(_makeTestableWidget(WatchlistMoviesPage()));

        await tester.pump();
        await tester.pump(const Duration(milliseconds: 500));

        expect(find.text('Tv Series'), findsOneWidget);

        expect(
          find.byKey(const Key('empty_tv_series_message')),
          findsOneWidget,
        );
        expect(find.text('No Watchlist Tv Series'), findsOneWidget);
      },
    );

    testWidgets('Page should display empty message when no watchlist Movies', (
      WidgetTester tester,
    ) async {
      reset(mockWatchlistTvSeriesBloc);
      reset(mockWatchlistMovieBloc);

      when(mockWatchlistTvSeriesBloc.state).thenReturn(
        WatchlistTvSeriesState(
          requestState: RequestState.Loading,
          watchlistTvSeries: [],
          message: '',
        ),
      );
      when(mockWatchlistTvSeriesBloc.stream).thenAnswer(
        (_) => Stream.value(
          WatchlistTvSeriesState(
            requestState: RequestState.Loading,
            watchlistTvSeries: [],
            message: '',
          ),
        ),
      );

      when(mockWatchlistMovieBloc.state).thenReturn(
        WatchlistMovieState(
          requestState: RequestState.Loaded,
          watchlistMovies: [],
          message: '',
        ),
      );
      when(mockWatchlistMovieBloc.stream).thenAnswer(
        (_) => Stream.value(
          WatchlistMovieState(
            requestState: RequestState.Loaded,
            watchlistMovies: [],
            message: '',
          ),
        ),
      );

      await tester.pumpWidget(_makeTestableWidget(WatchlistMoviesPage()));

      await tester.tap(find.text('Movies'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 500));

      expect(find.text('Movies'), findsOneWidget);
      expect(find.byKey(const Key('empty_movie_message')), findsOneWidget);
      expect(find.text('No Watchlist Movies'), findsOneWidget);
    });
  });
}
