import 'package:bloc_test/bloc_test.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/entities/movie.dart';
import 'package:ditonton/presentation/bloc/movie/home/home_movie_bloc.dart';
import 'package:ditonton/presentation/pages/home_movie_page.dart';
import 'package:ditonton/presentation/pages/movie_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockHomeMovieBloc extends MockBloc<HomeMovieEvent, HomeMovieState> implements HomeMovieBloc {}

void main() {
  late MockHomeMovieBloc mockHomeMovieBloc;

  setUp(() {
    mockHomeMovieBloc = MockHomeMovieBloc();
  });

  Widget _makeTestableWidget(Widget body) {
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
        }
      ),
    );
  }

  testWidgets('Page should display center progress bar when loading', (
    WidgetTester tester,
  ) async {
    when(() => mockHomeMovieBloc.state).thenReturn(HomeMovieState(
      nowPlayingState: RequestState.Loading,
      popularState: RequestState.Loading,
      topRatedState: RequestState.Loading,
    ));

    final progressBarFinder = find.byType(CircularProgressIndicator);

    await tester.pumpWidget(_makeTestableWidget(HomeMoviePage()));

    expect(progressBarFinder, findsWidgets);
  });

  testWidgets('Page should display ListView when data is loaded', (
    WidgetTester tester,
  ) async {
    when(() => mockHomeMovieBloc.state).thenReturn(HomeMovieState(
      nowPlayingState: RequestState.Loaded,
      popularState: RequestState.Loaded,
      topRatedState: RequestState.Loaded,
      nowPlayingMovies: <Movie>[],
      popularMovies: <Movie>[],
      topRatedMovies: <Movie>[],
    ));

    final listViewFinder = find.byType(ListView);

    await tester.pumpWidget(_makeTestableWidget(HomeMoviePage()));

    expect(listViewFinder, findsWidgets);
  });

  testWidgets('Page should display text with message when Error', (
    WidgetTester tester,
  ) async {
    when(() => mockHomeMovieBloc.state).thenReturn(HomeMovieState(
      nowPlayingState: RequestState.Error,
      popularState: RequestState.Error,
      topRatedState: RequestState.Error,
      message: 'Error message',
    ));

    final textFinder = find.text('Failed');

    await tester.pumpWidget(_makeTestableWidget(HomeMoviePage()));

    expect(textFinder, findsWidgets);
  });

  testWidgets('Should display error icon when movie poster fails to load', (
    WidgetTester tester,
  ) async {
    final testMovie = Movie(
      adult: false,
      backdropPath: 'backdropPath',
      genreIds: [1, 2, 3],
      id: 1,
      originalTitle: 'originalTitle',
      overview: 'overview',
      popularity: 1,
      posterPath: 'posterPath',
      releaseDate: 'releaseDate',
      title: 'title',
      video: false,
      voteAverage: 1,
      voteCount: 1,
    );

    when(() => mockHomeMovieBloc.state).thenReturn(HomeMovieState(
      nowPlayingState: RequestState.Loaded,
      popularState: RequestState.Loaded,
      topRatedState: RequestState.Loaded,
      nowPlayingMovies: [testMovie],
      popularMovies: <Movie>[],
      topRatedMovies: <Movie>[],
    ));

    await tester.pumpWidget(_makeTestableWidget(HomeMoviePage()));

    final CachedNetworkImage cachedImage = tester.widget(
      find.byType(CachedNetworkImage).first,
    );
    final errorWidget = cachedImage.errorWidget!(
      tester.element(find.byType(CachedNetworkImage).first),  // Use tester.element instead of undefined context
      'url',
      Exception('Failed to load image'),
    );

    expect(errorWidget.runtimeType, Icon);
    final icon = errorWidget as Icon;
    expect(icon.icon, Icons.error);
  });

 }
