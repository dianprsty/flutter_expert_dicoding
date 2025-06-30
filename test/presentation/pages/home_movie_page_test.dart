import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';

import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/entities/movie.dart';
import 'package:ditonton/presentation/bloc/movie/home/home_movie_bloc.dart';
import 'package:ditonton/presentation/pages/home_movie_page.dart';
import 'package:ditonton/presentation/pages/movie_detail_page.dart';
import 'package:mockito/mockito.dart';

import 'home_movie_page_test.mocks.dart';

@GenerateMocks([HomeMovieBloc])
void main() {
  late MockHomeMovieBloc mockHomeMovieBloc;

  setUp(() {
    mockHomeMovieBloc = MockHomeMovieBloc();
    when(
      mockHomeMovieBloc.stream,
    ).thenAnswer((_) => Stream.value(HomeMovieState()));
  });

  Widget makeTestableWidget(Widget body) {
    return BlocProvider<HomeMovieBloc>.value(
      value: mockHomeMovieBloc,
      child: MaterialApp(
        home: body,
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            case MovieDetailPage.ROUTE_NAME:
              final id = settings.arguments as int;
              return MaterialPageRoute(
                builder: (_) => MovieDetailPage(id: id),
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
        },
      ),
    );
  }

  testWidgets('Page should display center progress bar when loading', (
    WidgetTester tester,
  ) async {
    when(mockHomeMovieBloc.state).thenReturn(
      HomeMovieState(
        nowPlayingState: RequestState.Loading,
        popularState: RequestState.Loading,
        topRatedState: RequestState.Loading,
      ),
    );

    final progressBarFinder = find.byType(CircularProgressIndicator);

    await tester.pumpWidget(makeTestableWidget(HomeMoviePage()));

    expect(progressBarFinder, findsWidgets);
  });

  testWidgets('Page should display ListView when data is loaded', (
    WidgetTester tester,
  ) async {
    when(mockHomeMovieBloc.state).thenReturn(
      HomeMovieState(
        nowPlayingState: RequestState.Loaded,
        popularState: RequestState.Loaded,
        topRatedState: RequestState.Loaded,
        nowPlayingMovies: <Movie>[],
        popularMovies: <Movie>[],
        topRatedMovies: <Movie>[],
      ),
    );

    final listViewFinder = find.byType(ListView);

    await tester.pumpWidget(makeTestableWidget(HomeMoviePage()));

    expect(listViewFinder, findsWidgets);
  });

  testWidgets('Page should display text with message when Error', (
    WidgetTester tester,
  ) async {
    when(mockHomeMovieBloc.state).thenReturn(
      HomeMovieState(
        nowPlayingState: RequestState.Error,
        popularState: RequestState.Error,
        topRatedState: RequestState.Error,
        message: 'Error message',
      ),
    );

    final textFinder = find.text('Failed');

    await tester.pumpWidget(makeTestableWidget(HomeMoviePage()));

    expect(textFinder, findsWidgets);
  });
}
