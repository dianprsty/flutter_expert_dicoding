import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/entities/tv_series.dart';
import 'package:ditonton/presentation/bloc/tv_series/search/search_tv_series_bloc.dart';
import 'package:ditonton/presentation/pages/search_tv_series_page.dart';
import 'package:ditonton/presentation/widgets/tv_series_card_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'search_tv_series_page_test.mocks.dart';

@GenerateMocks([SearchTvSeriesBloc])
void main() {
  late MockSearchTvSeriesBloc mockBloc;

  setUp(() {
    mockBloc = MockSearchTvSeriesBloc();
    when(mockBloc.state).thenReturn(SearchTvSeriesState());
    when(mockBloc.stream).thenAnswer((_) => Stream.value(SearchTvSeriesState()));
  });

  Widget _makeTestableWidget(Widget body) {
    return BlocProvider<SearchTvSeriesBloc>.value(
      value: mockBloc,
      child: MaterialApp(home: body),
    );
  }

  testWidgets('Page should display TextField and search button',
      (WidgetTester tester) async {
    await tester.pumpWidget(_makeTestableWidget(SearchTvSeriesPage()));

    final textFieldFinder = find.byType(TextField);
    final searchIconFinder = find.byIcon(Icons.search);

    expect(textFieldFinder, findsOneWidget);
    expect(searchIconFinder, findsOneWidget);
  });

  testWidgets('Page should display CircularProgressIndicator when loading',
      (WidgetTester tester) async {
    when(mockBloc.state).thenReturn(SearchTvSeriesState(
      state: RequestState.Loading,
    ));

    await tester.pumpWidget(_makeTestableWidget(SearchTvSeriesPage()));

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('Page should display ListView when data is loaded',
      (WidgetTester tester) async {
    final tTvSeries = TvSeries(
      adult: false,
      backdropPath: 'backdropPath',
      genreIds: [1, 2, 3],
      id: 1,
      originCountry: ['US'],
      originalLanguage: 'en',
      originalName: 'originalName',
      overview: 'overview',
      popularity: 1.0,
      posterPath: 'posterPath',
      firstAirDate: 'firstAirDate',
      name: 'name',
      voteAverage: 1.0,
      voteCount: 1,
    );
    final tTvSeriesList = <TvSeries>[tTvSeries];

    when(mockBloc.state).thenReturn(SearchTvSeriesState(
      state: RequestState.Loaded,
      searchResult: tTvSeriesList,
    ));

    await tester.pumpWidget(_makeTestableWidget(SearchTvSeriesPage()));

    expect(find.byType(ListView), findsOneWidget);
    expect(find.byType(TvSeriesCard), findsOneWidget);
  });

  testWidgets('Page should display text with message when Error',
      (WidgetTester tester) async {
    when(mockBloc.state).thenReturn(SearchTvSeriesState(
      state: RequestState.Error,
      message: 'Error message',
    ));

    await tester.pumpWidget(_makeTestableWidget(SearchTvSeriesPage()));

    expect(find.text('Error message'), findsOneWidget);
  });

  testWidgets('TextField should trigger search when text is entered',
      (WidgetTester tester) async {
    await tester.pumpWidget(_makeTestableWidget(SearchTvSeriesPage()));

    await tester.enterText(find.byType(TextField), 'test query');
    await tester.pump();

    verify(mockBloc.add(SearchTvSeriesEvent.onQueryChanged('test query')));
  });
}