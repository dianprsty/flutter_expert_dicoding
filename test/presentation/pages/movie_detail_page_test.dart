import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/entities/movie.dart';
import 'package:ditonton/presentation/bloc/movie/detail/movie_detail_bloc.dart';
import 'package:ditonton/presentation/pages/movie_detail_page.dart';

import '../../dummy_data/dummy_objects.dart';

import 'movie_detail_page_test.mocks.dart';

@GenerateMocks([MovieDetailBloc])
void main() {
  late MockMovieDetailBloc mockMovieDetailBloc;

  setUp(() {
    mockMovieDetailBloc = MockMovieDetailBloc();

    when(mockMovieDetailBloc.state).thenReturn(MovieDetailState());
    when(
      mockMovieDetailBloc.stream,
    ).thenAnswer((_) => Stream.value(MovieDetailState()));
  });

  Widget makeTestableWidget(Widget body) {
    return BlocProvider<MovieDetailBloc>.value(
      value: mockMovieDetailBloc,
      child: MaterialApp(home: body),
    );
  }

  testWidgets('Watchlist button should display add icon when '
      'movie not added to watchlist', (WidgetTester tester) async {
    when(mockMovieDetailBloc.state).thenReturn(
      MovieDetailState(
        movieState: RequestState.Loaded,
        movieDetail: testMovieDetail,
        recommendationState: RequestState.Loaded,
        movieRecommendations: <Movie>[],
        isAddedToWatchlist: false,
      ),
    );

    final watchlistButtonIcon = find.byIcon(Icons.add);

    await tester.pumpWidget(makeTestableWidget(MovieDetailPage(id: 1)));

    expect(watchlistButtonIcon, findsOneWidget);
  });

  testWidgets('Watchlist button should dispay check icon when '
      'movie is added to wathclist', (WidgetTester tester) async {
    when(mockMovieDetailBloc.state).thenReturn(
      MovieDetailState(
        movieState: RequestState.Loaded,
        movieDetail: testMovieDetail,
        recommendationState: RequestState.Loaded,
        movieRecommendations: <Movie>[],
        isAddedToWatchlist: true,
      ),
    );

    final watchlistButtonIcon = find.byIcon(Icons.check);

    await tester.pumpWidget(makeTestableWidget(MovieDetailPage(id: 1)));

    expect(watchlistButtonIcon, findsOneWidget);
  });

  testWidgets(
    'Watchlist button should display Snackbar when added to watchlist',
    (WidgetTester tester) async {
      when(mockMovieDetailBloc.state).thenReturn(
        MovieDetailState(
          movieState: RequestState.Loaded,
          movieDetail: testMovieDetail,
          recommendationState: RequestState.Loaded,
          movieRecommendations: <Movie>[],
          isAddedToWatchlist: false,
          watchlistMessage: 'Added to Watchlist',
        ),
      );

      final watchlistButton = find.byType(FilledButton);

      await tester.pumpWidget(makeTestableWidget(MovieDetailPage(id: 1)));

      expect(find.byIcon(Icons.add), findsOneWidget);

      await tester.tap(watchlistButton);
      await tester.pump();

      expect(find.byType(SnackBar), findsOneWidget);
      expect(find.text('Added to Watchlist'), findsOneWidget);
    },
  );

  testWidgets(
    'Watchlist button should display AlertDialog when add to watchlist failed',
    (WidgetTester tester) async {
      when(mockMovieDetailBloc.state).thenReturn(
        MovieDetailState(
          movieState: RequestState.Loaded,
          movieDetail: testMovieDetail,
          recommendationState: RequestState.Loaded,
          movieRecommendations: <Movie>[],
          isAddedToWatchlist: false,
          watchlistMessage: 'Failed',
        ),
      );

      final watchlistButton = find.byType(FilledButton);

      await tester.pumpWidget(makeTestableWidget(MovieDetailPage(id: 1)));

      expect(find.byIcon(Icons.add), findsOneWidget);

      await tester.tap(watchlistButton);
      await tester.pump();

      expect(find.byType(AlertDialog), findsOneWidget);
      expect(find.text('Failed'), findsOneWidget);
    },
  );

  testWidgets(
    'Should display loading indicator when recommendations are loading',
    (WidgetTester tester) async {
      when(mockMovieDetailBloc.state).thenReturn(
        MovieDetailState(
          movieState: RequestState.Loaded,
          movieDetail: testMovieDetail,
          recommendationState: RequestState.Loading,
          movieRecommendations: <Movie>[],
          isAddedToWatchlist: false,
        ),
      );

      await tester.pumpWidget(makeTestableWidget(MovieDetailPage(id: 1)));

      expect(find.byType(CircularProgressIndicator), findsWidgets);
    },
  );

  testWidgets('Should display error text when recommendations failed to load', (
    WidgetTester tester,
  ) async {
    when(mockMovieDetailBloc.state).thenReturn(
      MovieDetailState(
        movieState: RequestState.Loaded,
        movieDetail: testMovieDetail,
        recommendationState: RequestState.Error,
        movieRecommendations: <Movie>[],
        message: 'Failed to load recommendations',
        isAddedToWatchlist: false,
      ),
    );

    await tester.pumpWidget(makeTestableWidget(MovieDetailPage(id: 1)));

    expect(find.text('Failed to load recommendations'), findsOneWidget);
  });

  testWidgets('Should pop when back button is pressed', (
    WidgetTester tester,
  ) async {
    when(mockMovieDetailBloc.state).thenReturn(
      MovieDetailState(
        movieState: RequestState.Loaded,
        movieDetail: testMovieDetail,
        recommendationState: RequestState.Loaded,
        movieRecommendations: <Movie>[],
        isAddedToWatchlist: false,
      ),
    );

    await tester.pumpWidget(makeTestableWidget(MovieDetailPage(id: 1)));

    await tester.tap(find.byIcon(Icons.arrow_back));
    await tester.pumpAndSettle();

    expect(find.byType(MovieDetailPage), findsNothing);
  });

  testWidgets('Should display snackbar when removed from watchlist', (
    WidgetTester tester,
  ) async {
    when(mockMovieDetailBloc.state).thenReturn(
      MovieDetailState(
        movieState: RequestState.Loaded,
        movieDetail: testMovieDetail,
        recommendationState: RequestState.Loaded,
        movieRecommendations: <Movie>[],
        isAddedToWatchlist: true,
        watchlistMessage: 'Removed from Watchlist',
      ),
    );

    final watchlistButton = find.byType(FilledButton);

    await tester.pumpWidget(makeTestableWidget(MovieDetailPage(id: 1)));

    expect(find.byIcon(Icons.check), findsOneWidget);

    await tester.tap(watchlistButton);
    await tester.pump();

    expect(find.byType(SnackBar), findsOneWidget);
    expect(find.text('Removed from Watchlist'), findsOneWidget);
  });
}
