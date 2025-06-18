import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/entities/tv_series.dart';
import 'package:ditonton/presentation/pages/search_tv_series_page.dart';
import 'package:ditonton/presentation/provider/tv_series/tv_series_search_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';

import 'search_tv_series_page_test.mocks.dart';

@GenerateMocks([TvSeriesSearchNotifier])
void main() {
  late MockTvSeriesSearchNotifier mockNotifier;

  setUp(() {
    mockNotifier = MockTvSeriesSearchNotifier();
  });

  Widget _makeTestableWidget(Widget body) {
    return ChangeNotifierProvider<TvSeriesSearchNotifier>.value(
      value: mockNotifier,
      child: MaterialApp(home: body),
    );
  }

  testWidgets('Page should display TextField and search button',
      (WidgetTester tester) async {
    when(mockNotifier.state).thenReturn(RequestState.Empty);
    when(mockNotifier.searchResult).thenReturn(<TvSeries>[]);

    await tester.pumpWidget(_makeTestableWidget(SearchTvSeriesPage()));

    final textFieldFinder = find.byType(TextField);
    final searchIconFinder = find.byIcon(Icons.search);

    expect(textFieldFinder, findsOneWidget);
    expect(searchIconFinder, findsOneWidget);
  });

  testWidgets('Page should display progress bar when loading',
      (WidgetTester tester) async {
    when(mockNotifier.state).thenReturn(RequestState.Loading);
    when(mockNotifier.searchResult).thenReturn(<TvSeries>[]);

    await tester.pumpWidget(_makeTestableWidget(SearchTvSeriesPage()));

    final progressBarFinder = find.byType(CircularProgressIndicator);
    expect(progressBarFinder, findsOneWidget);
  });

  testWidgets('Page should display ListView when data is loaded',
      (WidgetTester tester) async {
    when(mockNotifier.state).thenReturn(RequestState.Loaded);
    when(mockNotifier.searchResult).thenReturn(<TvSeries>[]);

    await tester.pumpWidget(_makeTestableWidget(SearchTvSeriesPage()));

    final listViewFinder = find.byType(ListView);
    expect(listViewFinder, findsOneWidget);
  });

  testWidgets('TextField should trigger search when submitted',
      (WidgetTester tester) async {
    when(mockNotifier.state).thenReturn(RequestState.Loaded);
    when(mockNotifier.searchResult).thenReturn(<TvSeries>[]);

    await tester.pumpWidget(_makeTestableWidget(SearchTvSeriesPage()));

    await tester.enterText(find.byType(TextField), 'frieren');
    await tester.testTextInput.receiveAction(TextInputAction.search);
    
    verify(mockNotifier.fetchTvSeriesSearch('frieren'));
  });
}