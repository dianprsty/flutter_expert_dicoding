import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/entities/movie.dart';
import 'package:ditonton/presentation/bloc/movie/search/search_movie_bloc.dart';
import 'package:ditonton/presentation/pages/search_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'search_page_test.mocks.dart';

@GenerateMocks([SearchMovieBloc])
void main() {
  late MockSearchMovieBloc mockSearchMovieBloc;

  setUp(() {
    mockSearchMovieBloc = MockSearchMovieBloc();
    when(mockSearchMovieBloc.state).thenReturn(SearchMovieState());
    when(mockSearchMovieBloc.stream).thenAnswer((_) => Stream.value(SearchMovieState()));
  });

  Widget _makeTestableWidget(Widget body) {
    return BlocProvider<SearchMovieBloc>.value(
      value: mockSearchMovieBloc,
      child: MaterialApp(home: body),
    );
  }

  testWidgets('Page should display TextField and search button', (
    WidgetTester tester,
  ) async {
    when(mockSearchMovieBloc.state).thenReturn(
      SearchMovieState(
        state: RequestState.Empty,
        searchResult: [],
        message: '',
      ),
    );

    await tester.pumpWidget(_makeTestableWidget(SearchPage()));

    final textFieldFinder = find.byType(TextField);
    final searchIconFinder = find.byIcon(Icons.search);

    expect(textFieldFinder, findsOneWidget);
    expect(searchIconFinder, findsOneWidget);
  });

  testWidgets('Page should display progress bar when loading', (
    WidgetTester tester,
  ) async {
    when(mockSearchMovieBloc.state).thenReturn(
      SearchMovieState(
        state: RequestState.Loading,
        searchResult: [],
        message: '',
      ),
    );

    await tester.pumpWidget(_makeTestableWidget(SearchPage()));

    final progressBarFinder = find.byType(CircularProgressIndicator);
    expect(progressBarFinder, findsOneWidget);
  });

  testWidgets('Page should display ListView when data is loaded', (
    WidgetTester tester,
  ) async {
    when(mockSearchMovieBloc.state).thenReturn(
      SearchMovieState(
        state: RequestState.Loaded,
        searchResult: <Movie>[],
        message: '',
      ),
    );

    await tester.pumpWidget(_makeTestableWidget(SearchPage()));

    final listViewFinder = find.byType(ListView);
    expect(listViewFinder, findsOneWidget);
  });

  testWidgets('TextField should trigger search when submitted', (
    WidgetTester tester,
  ) async {
    when(mockSearchMovieBloc.state).thenReturn(
      SearchMovieState(
        state: RequestState.Loaded,
        searchResult: <Movie>[],
        message: '',
      ),
    );

    await tester.pumpWidget(_makeTestableWidget(SearchPage()));

    await tester.enterText(find.byType(TextField), 'spiderman');
    await tester.testTextInput.receiveAction(TextInputAction.search);
    
    verify(mockSearchMovieBloc.add(SearchMovieEvent.onQueryChanged('spiderman')));
  });
}
