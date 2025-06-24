import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/entities/tv_series.dart';
import 'package:ditonton/presentation/bloc/tv_series/on_the_air/on_the_air_tv_series_bloc.dart';
import 'package:ditonton/presentation/pages/on_the_air_tv_series_page.dart';
import 'package:ditonton/presentation/widgets/tv_series_card_list.dart';

import 'on_the_air_tv_series_page_test.mocks.dart';

@GenerateMocks([OnTheAirTvSeriesBloc])
void main() {
  late MockOnTheAirTvSeriesBloc mockmockBloc;

  setUp(() {
    mockmockBloc = MockOnTheAirTvSeriesBloc();
    when(mockmockBloc.state).thenReturn(OnTheAirTvSeriesState());
    when(mockmockBloc.stream).thenAnswer((_) => Stream.value(OnTheAirTvSeriesState()));
  });

  Widget _makeTestableWidget(Widget body) {
    return BlocProvider<OnTheAirTvSeriesBloc>.value(
      value: mockmockBloc,
      child: MaterialApp(home: body),
    );
  }

  testWidgets('Page should display center progress bar when loading', (
    WidgetTester tester,
  ) async {
    when(mockmockBloc.state).thenReturn(OnTheAirTvSeriesState(
      requestState: RequestState.Loading,
      tvSeries: [],
      message: '',
    ));

    final progressBarFinder = find.byType(CircularProgressIndicator);
    final centerFinder = find.byType(Center);

    await tester.pumpWidget(_makeTestableWidget(OnTheAirTvSeriesPage()));

    expect(centerFinder, findsOneWidget);
    expect(progressBarFinder, findsOneWidget);
  });

  testWidgets('Page should display ListView when data is loaded', (
    WidgetTester tester,
  ) async {
    final testTvSeries = TvSeries(
      adult: false,
      backdropPath: 'backdropPath',
      genreIds: [1, 2, 3],
      id: 1,
      originCountry: ['US'],
      originalLanguage: 'en',
      originalName: 'originalName',
      overview: 'overview',
      popularity: 1,
      posterPath: 'posterPath',
      firstAirDate: '2023-01-01',
      name: 'name',
      voteAverage: 1,
      voteCount: 1,
    );

    when(mockmockBloc.state).thenReturn(OnTheAirTvSeriesState(
      requestState: RequestState.Loaded,
      tvSeries: <TvSeries>[testTvSeries],
      message: '',
    ));

    final listViewFinder = find.byType(ListView);

    await tester.pumpWidget(_makeTestableWidget(OnTheAirTvSeriesPage()));

    expect(listViewFinder, findsOneWidget);
    expect(find.byType(TvSeriesCard), findsOneWidget);
  });

  testWidgets('Page should display text with message when Error', (
    WidgetTester tester,
  ) async {
    const errorMessage = 'Error message';
    when(mockmockBloc.state).thenReturn(OnTheAirTvSeriesState(
      requestState: RequestState.Error,
      tvSeries: [],
      message: errorMessage,
    ));

    final textFinder = find.byKey(Key('error_message'));

    await tester.pumpWidget(_makeTestableWidget(OnTheAirTvSeriesPage()));

    expect(textFinder, findsOneWidget);
    expect(find.text(errorMessage), findsOneWidget); 
  });

  testWidgets('Page should call fetchOnTheAirTvSeries when initialized', (
    WidgetTester tester,
  ) async {
    when(mockmockBloc.state).thenReturn(OnTheAirTvSeriesState(
      requestState: RequestState.Loading,
      tvSeries: [],
      message: '',
    ));

    await tester.pumpWidget(_makeTestableWidget(OnTheAirTvSeriesPage()));

    verify(mockmockBloc.add(OnTheAirTvSeriesEvent.fetchOnTheAirTvSeries()));
  });

  testWidgets('Page should display correct app bar title', (
    WidgetTester tester,
  ) async {
    when(mockmockBloc.state).thenReturn(OnTheAirTvSeriesState(
      requestState: RequestState.Loading,
      tvSeries: [],
      message: '',
    ));

    await tester.pumpWidget(_makeTestableWidget(OnTheAirTvSeriesPage()));

    expect(find.text('On Going Tv Series'), findsOneWidget);
  });
}
