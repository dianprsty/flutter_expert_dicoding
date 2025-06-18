import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/entities/tv_series.dart';
import 'package:ditonton/presentation/pages/home_tv_series_page.dart';
import 'package:ditonton/presentation/pages/tv_series_detail_page.dart';
import 'package:ditonton/presentation/provider/tv_series/tv_series_detail_notifier.dart';
import 'package:ditonton/presentation/provider/tv_series/tv_series_list_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';

import '../../dummy_data/dummy_objects.dart';
import 'home_tv_series_page_test.mocks.dart';

@GenerateMocks([TvSeriesListNotifier, TvSeriesDetailNotifier])
void main() {
  late MockTvSeriesListNotifier mockNotifier;
  late MockTvSeriesDetailNotifier mockDetailNotifier;

  setUp(() {
    mockNotifier = MockTvSeriesListNotifier();
    mockDetailNotifier = MockTvSeriesDetailNotifier();
  });

  Widget _makeTestableWidget(Widget body) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<TvSeriesListNotifier>.value(
          value: mockNotifier,
        ),
        ChangeNotifierProvider<TvSeriesDetailNotifier>.value(
          value: mockDetailNotifier,
        ),
      ],
      child: MaterialApp(
        home: body,
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            case TvSeriesDetailPage.ROUTE_NAME:
              final id = settings.arguments as int;
              return MaterialPageRoute(
                builder: (_) => TvSeriesDetailPage(id: id),
                settings: settings,
              );
            default:
              return MaterialPageRoute(
                builder: (_) {
                  return Scaffold(
                    body: Center(child: Text('Page not found :(')),
                  );
                },
              );
          }
        }
      ),
    );
  }

  testWidgets('Page should display center progress bar when loading', (
    WidgetTester tester,
  ) async {
    when(mockNotifier.nowPlayingState).thenReturn(RequestState.Loading);
    when(mockNotifier.popularTvSeriesState).thenReturn(RequestState.Loading);
    when(mockNotifier.topRatedTvSeriesState).thenReturn(RequestState.Loading);

    final progressBarFinder = find.byType(CircularProgressIndicator);

    await tester.pumpWidget(_makeTestableWidget(HomeTvSeriesPage()));

    expect(progressBarFinder, findsWidgets);
  });

  testWidgets('Page should display ListView when data is loaded', (
    WidgetTester tester,
  ) async {
    when(mockNotifier.nowPlayingState).thenReturn(RequestState.Loaded);
    when(mockNotifier.popularTvSeriesState).thenReturn(RequestState.Loaded);
    when(mockNotifier.topRatedTvSeriesState).thenReturn(RequestState.Loaded);
    when(mockNotifier.nowPlayingTvSeries).thenReturn(<TvSeries>[]);
    when(mockNotifier.popularTvSeries).thenReturn(<TvSeries>[]);
    when(mockNotifier.topRatedTvSeries).thenReturn(<TvSeries>[]);

    final listViewFinder = find.byType(ListView);

    await tester.pumpWidget(_makeTestableWidget(HomeTvSeriesPage()));

    expect(listViewFinder, findsWidgets);
  });

  testWidgets('Page should display text with message when Error', (
    WidgetTester tester,
  ) async {
    when(mockNotifier.nowPlayingState).thenReturn(RequestState.Error);
    when(mockNotifier.popularTvSeriesState).thenReturn(RequestState.Error);
    when(mockNotifier.topRatedTvSeriesState).thenReturn(RequestState.Error);
    when(mockNotifier.message).thenReturn('Error message');

    final textFinder = find.text('Failed');

    await tester.pumpWidget(_makeTestableWidget(HomeTvSeriesPage()));

    expect(textFinder, findsWidgets);
  });

}
