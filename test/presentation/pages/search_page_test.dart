import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/entities/movie.dart';
import 'package:ditonton/presentation/pages/search_page.dart';
import 'package:ditonton/presentation/provider/movie/movie_search_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';

import 'search_page_test.mocks.dart';

@GenerateMocks([MovieSearchNotifier])
void main() {
  late MockMovieSearchNotifier mockNotifier;

  setUp(() {
    mockNotifier = MockMovieSearchNotifier();
  });

  Widget _makeTestableWidget(Widget body) {
    return ChangeNotifierProvider<MovieSearchNotifier>.value(
      value: mockNotifier,
      child: MaterialApp(home: body),
    );
  }

  testWidgets('Page should display TextField and search button',
      (WidgetTester tester) async {
    when(mockNotifier.state).thenReturn(RequestState.Empty);
    when(mockNotifier.searchResult).thenReturn(<Movie>[]);

    await tester.pumpWidget(_makeTestableWidget(SearchPage()));

    final textFieldFinder = find.byType(TextField);
    final searchIconFinder = find.byIcon(Icons.search);

    expect(textFieldFinder, findsOneWidget);
    expect(searchIconFinder, findsOneWidget);
  });

  testWidgets('Page should display progress bar when loading',
      (WidgetTester tester) async {
    when(mockNotifier.state).thenReturn(RequestState.Loading);
    when(mockNotifier.searchResult).thenReturn(<Movie>[]);

    await tester.pumpWidget(_makeTestableWidget(SearchPage()));

    final progressBarFinder = find.byType(CircularProgressIndicator);
    expect(progressBarFinder, findsOneWidget);
  });

  testWidgets('Page should display ListView when data is loaded',
      (WidgetTester tester) async {
    when(mockNotifier.state).thenReturn(RequestState.Loaded);
    when(mockNotifier.searchResult).thenReturn(<Movie>[]);

    await tester.pumpWidget(_makeTestableWidget(SearchPage()));

    final listViewFinder = find.byType(ListView);
    expect(listViewFinder, findsOneWidget);
  });

  testWidgets('TextField should trigger search when submitted',
      (WidgetTester tester) async {
    when(mockNotifier.state).thenReturn(RequestState.Loaded);
    when(mockNotifier.searchResult).thenReturn(<Movie>[]);

    await tester.pumpWidget(_makeTestableWidget(SearchPage()));

    await tester.enterText(find.byType(TextField), 'spiderman');
    await tester.testTextInput.receiveAction(TextInputAction.search);
    
    verify(mockNotifier.fetchMovieSearch('spiderman'));
  });
}