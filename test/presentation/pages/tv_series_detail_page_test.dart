import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/entities/tv_series.dart';
import 'package:ditonton/presentation/bloc/tv_series/detail/tv_series_detail_bloc.dart';
import 'package:ditonton/presentation/pages/tv_series_detail_page.dart';
import 'package:ditonton/presentation/widgets/season_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_objects.dart';
import 'tv_series_detail_page_test.mocks.dart';

@GenerateNiceMocks([MockSpec<TvSeriesDetailBloc>()])
void main() {
  late MockTvSeriesDetailBloc mockBloc;

  setUp(() {
    mockBloc = MockTvSeriesDetailBloc();
    when(mockBloc.state).thenReturn(TvSeriesDetailState());
    when(
      mockBloc.stream,
    ).thenAnswer((_) => Stream.value(TvSeriesDetailState()));
  });

  Widget makeTestableWidget(Widget body) {
    return BlocProvider<TvSeriesDetailBloc>.value(
      value: mockBloc,
      child: MaterialApp(home: body),
    );
  }

  testWidgets('Should display progress bar when movie detail is loading', (
    WidgetTester tester,
  ) async {
    when(
      mockBloc.state,
    ).thenReturn(TvSeriesDetailState(tvSeriesState: RequestState.Loading));

    final progressFinder = find.byType(CircularProgressIndicator);

    await tester.pumpWidget(makeTestableWidget(TvSeriesDetailPage(id: 1)));

    expect(progressFinder, findsOneWidget);
  });

  testWidgets(
    'Should display error message when get tv series detail is error',
    (WidgetTester tester) async {
      when(mockBloc.state).thenReturn(
        TvSeriesDetailState(
          tvSeriesState: RequestState.Error,
          message: 'Error message',
        ),
      );

      final textFinder = find.text('Error message');

      await tester.pumpWidget(makeTestableWidget(TvSeriesDetailPage(id: 1)));

      expect(textFinder, findsOneWidget);
    },
  );

  testWidgets('Should display tv series detail when data is loaded', (
    WidgetTester tester,
  ) async {
    when(mockBloc.state).thenReturn(
      TvSeriesDetailState(
        tvSeriesState: RequestState.Loaded,
        tvSeriesDetail: testTvSeriesDetail,
        recommendationState: RequestState.Loaded,
        tvSeriesRecommendations: <TvSeries>[],
        isAddedToWatchlist: false,
      ),
    );

    final detailFinder = find.byType(DetailContent);

    await tester.pumpWidget(makeTestableWidget(TvSeriesDetailPage(id: 1)));

    expect(detailFinder, findsOneWidget);
  });

  testWidgets(
    'Should display watchlist button when tv series is not in watchlist',
    (WidgetTester tester) async {
      when(mockBloc.state).thenReturn(
        TvSeriesDetailState(
          tvSeriesState: RequestState.Loaded,
          tvSeriesDetail: testTvSeriesDetail,
          recommendationState: RequestState.Loaded,
          tvSeriesRecommendations: <TvSeries>[],
          isAddedToWatchlist: false,
        ),
      );

      final watchlistButtonFinder = find.byType(FilledButton);

      await tester.pumpWidget(makeTestableWidget(TvSeriesDetailPage(id: 1)));

      expect(watchlistButtonFinder, findsOneWidget);
    },
  );

  testWidgets('Should display watchlist button with check icon when '
      'tv series is in watchlist', (WidgetTester tester) async {
    when(mockBloc.state).thenReturn(
      TvSeriesDetailState(
        tvSeriesState: RequestState.Loaded,
        tvSeriesDetail: testTvSeriesDetail,
        recommendationState: RequestState.Loaded,
        tvSeriesRecommendations: <TvSeries>[],
        isAddedToWatchlist: true,
      ),
    );

    final watchlistButtonIcon = find.byIcon(Icons.check);

    await tester.pumpWidget(makeTestableWidget(TvSeriesDetailPage(id: 1)));

    expect(watchlistButtonIcon, findsOneWidget);
  });

  testWidgets('Should display snackbar when added to watchlist', (
    WidgetTester tester,
  ) async {
    when(mockBloc.state).thenReturn(
      TvSeriesDetailState(
        tvSeriesState: RequestState.Loaded,
        tvSeriesDetail: testTvSeriesDetail,
        recommendationState: RequestState.Loaded,
        tvSeriesRecommendations: <TvSeries>[],
        isAddedToWatchlist: false,
        watchlistMessage: 'Added to Watchlist',
      ),
    );

    final watchlistButton = find.byType(FilledButton);

    await tester.pumpWidget(makeTestableWidget(TvSeriesDetailPage(id: 1)));

    expect(find.byIcon(Icons.add), findsOneWidget);

    when(mockBloc.state).thenReturn(
      TvSeriesDetailState(
        tvSeriesState: RequestState.Loaded,
        tvSeriesDetail: testTvSeriesDetail,
        recommendationState: RequestState.Loaded,
        tvSeriesRecommendations: <TvSeries>[],
        isAddedToWatchlist: true,
        watchlistMessage: 'Added to Watchlist',
      ),
    );

    await tester.tap(watchlistButton);
    await tester.pump();

    expect(find.byType(SnackBar), findsOneWidget);
    expect(find.text('Added to Watchlist'), findsOneWidget);
  });

  testWidgets('Should display AlertDialog when add to watchlist failed', (
    WidgetTester tester,
  ) async {
    when(mockBloc.state).thenReturn(
      TvSeriesDetailState(
        tvSeriesState: RequestState.Loaded,
        tvSeriesDetail: testTvSeriesDetail,
        recommendationState: RequestState.Loaded,
        tvSeriesRecommendations: <TvSeries>[],
        isAddedToWatchlist: false,
      ),
    );

    final watchlistButton = find.byType(FilledButton);

    await tester.pumpWidget(makeTestableWidget(TvSeriesDetailPage(id: 1)));

    expect(find.byIcon(Icons.add), findsOneWidget);

    when(mockBloc.state).thenReturn(
      TvSeriesDetailState(
        tvSeriesState: RequestState.Loaded,
        tvSeriesDetail: testTvSeriesDetail,
        recommendationState: RequestState.Loaded,
        tvSeriesRecommendations: <TvSeries>[],
        isAddedToWatchlist: false,
        watchlistMessage: 'Failed',
      ),
    );

    await tester.tap(watchlistButton);
    await tester.pump();

    expect(find.byType(AlertDialog), findsOneWidget);
    expect(find.text('Failed'), findsOneWidget);
  });

  testWidgets('Should display text with season information', (
    WidgetTester tester,
  ) async {
    when(mockBloc.state).thenReturn(
      TvSeriesDetailState(
        tvSeriesState: RequestState.Loaded,
        tvSeriesDetail: testTvSeriesDetail,
        recommendationState: RequestState.Loaded,
        tvSeriesRecommendations: <TvSeries>[],
        isAddedToWatchlist: false,
      ),
    );

    final seasonInfoFinder = find.text(
      '${testTvSeriesDetail.numberOfSeasons} Seasons',
    );

    await tester.pumpWidget(makeTestableWidget(TvSeriesDetailPage(id: 1)));

    expect(seasonInfoFinder, findsOneWidget);
  });

  testWidgets(
    'Should display recommendation error when recommendation state is error',
    (WidgetTester tester) async {
      when(mockBloc.state).thenReturn(
        TvSeriesDetailState(
          tvSeriesState: RequestState.Loaded,
          tvSeriesDetail: testTvSeriesDetail,
          recommendationState: RequestState.Error,
          message: 'Recommendation Error',
          isAddedToWatchlist: false,
          tvSeriesRecommendations: <TvSeries>[],
        ),
      );

      final textFinder = find.text('Recommendation Error');

      await tester.pumpWidget(makeTestableWidget(TvSeriesDetailPage(id: 1)));

      expect(textFinder, findsOneWidget);
    },
  );

  testWidgets('Should display season cards when TV series has seasons', (
    WidgetTester tester,
  ) async {
    when(mockBloc.state).thenReturn(
      TvSeriesDetailState(
        tvSeriesState: RequestState.Loaded,
        tvSeriesDetail: testTvSeriesDetail,
        recommendationState: RequestState.Loaded,
        tvSeriesRecommendations: <TvSeries>[],
        isAddedToWatchlist: false,
      ),
    );

    await tester.pumpWidget(makeTestableWidget(TvSeriesDetailPage(id: 1)));

    expect(find.byType(SeasonCard), findsWidgets);
  });
}
