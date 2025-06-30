import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/entities/tv_series.dart';
import 'package:ditonton/presentation/bloc/tv_series/home/home_tv_series_bloc.dart';
import 'package:ditonton/presentation/pages/home_tv_series_page.dart';
import 'package:ditonton/presentation/pages/tv_series_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'home_tv_series_page_test.mocks.dart';

@GenerateMocks([HomeTvSeriesBloc])
void main() {
  late MockHomeTvSeriesBloc mockBloc;

  setUp(() {
    mockBloc = MockHomeTvSeriesBloc();
    when(mockBloc.stream).thenAnswer((_) => Stream.value(HomeTvSeriesState()));
  });

  Widget makeTestableWidget(Widget body) {
    return BlocProvider<HomeTvSeriesBloc>.value(
      value: mockBloc,
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
    when(mockBloc.state).thenReturn(HomeTvSeriesState(
      onTheAirState: RequestState.Loading,
      popularState: RequestState.Loading,
      topRatedState: RequestState.Loading,
    ));

    final progressBarFinder = find.byType(CircularProgressIndicator);

    await tester.pumpWidget(makeTestableWidget(HomeTvSeriesPage()));

    expect(progressBarFinder, findsWidgets);
  });

  testWidgets('Page should display ListView when data is loaded', (
    WidgetTester tester,
  ) async {
    when(mockBloc.state).thenReturn(HomeTvSeriesState(
      onTheAirState: RequestState.Loaded,
      popularState: RequestState.Loaded,
      topRatedState: RequestState.Loaded,
      onTheAirTvSeries: <TvSeries>[],
      popularTvSeries: <TvSeries>[],
      topRatedTvSeries: <TvSeries>[],
    ));

    final listViewFinder = find.byType(ListView);

    await tester.pumpWidget(makeTestableWidget(HomeTvSeriesPage()));

    expect(listViewFinder, findsWidgets);
  });

  testWidgets('Page should display text with message when Error', (
    WidgetTester tester,
  ) async {
    when(mockBloc.state).thenReturn(HomeTvSeriesState(
      onTheAirState: RequestState.Error,
      popularState: RequestState.Error,
      topRatedState: RequestState.Error,
      message: 'Error message',
    ));

    final textFinder = find.text('Failed: Error message');

    await tester.pumpWidget(makeTestableWidget(HomeTvSeriesPage()));

    expect(textFinder, findsWidgets);
  });

}
