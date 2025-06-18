import 'package:cached_network_image/cached_network_image.dart';
import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/entities/movie.dart';
import 'package:ditonton/presentation/pages/home_movie_page.dart';
import 'package:ditonton/presentation/pages/movie_detail_page.dart';
import 'package:ditonton/presentation/provider/movie/movie_detail_notifier.dart';
import 'package:ditonton/presentation/provider/movie/movie_list_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';

import 'home_movie_page_test.mocks.dart';

@GenerateMocks([MovieListNotifier, MovieDetailNotifier])
void main() {
  late MockMovieListNotifier mockNotifier;
  late MockMovieDetailNotifier mockDetailNotifier;

  setUp(() {
    mockNotifier = MockMovieListNotifier();
    mockDetailNotifier = MockMovieDetailNotifier();
  });

  Widget _makeTestableWidget(Widget body) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MovieListNotifier>.value(
          value: mockNotifier,
        ),
        ChangeNotifierProvider<MovieDetailNotifier>.value(
          value: mockDetailNotifier,
        ),
      ],
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
    when(mockNotifier.nowPlayingState).thenReturn(RequestState.Loading);
    when(mockNotifier.popularMoviesState).thenReturn(RequestState.Loading);
    when(mockNotifier.topRatedMoviesState).thenReturn(RequestState.Loading);

    final progressBarFinder = find.byType(CircularProgressIndicator);

    await tester.pumpWidget(_makeTestableWidget(HomeMoviePage()));

    expect(progressBarFinder, findsWidgets);
  });

  testWidgets('Page should display ListView when data is loaded', (
    WidgetTester tester,
  ) async {
    when(mockNotifier.nowPlayingState).thenReturn(RequestState.Loaded);
    when(mockNotifier.popularMoviesState).thenReturn(RequestState.Loaded);
    when(mockNotifier.topRatedMoviesState).thenReturn(RequestState.Loaded);
    when(mockNotifier.nowPlayingMovies).thenReturn(<Movie>[]);
    when(mockNotifier.popularMovies).thenReturn(<Movie>[]);
    when(mockNotifier.topRatedMovies).thenReturn(<Movie>[]);

    final listViewFinder = find.byType(ListView);

    await tester.pumpWidget(_makeTestableWidget(HomeMoviePage()));

    expect(listViewFinder, findsWidgets);
  });

  testWidgets('Page should display text with message when Error', (
    WidgetTester tester,
  ) async {
    when(mockNotifier.nowPlayingState).thenReturn(RequestState.Error);
    when(mockNotifier.popularMoviesState).thenReturn(RequestState.Error);
    when(mockNotifier.topRatedMoviesState).thenReturn(RequestState.Error);
    when(mockNotifier.message).thenReturn('Error message');

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

    when(mockNotifier.nowPlayingState).thenReturn(RequestState.Loaded);
    when(mockNotifier.popularMoviesState).thenReturn(RequestState.Loaded);
    when(mockNotifier.topRatedMoviesState).thenReturn(RequestState.Loaded);
    when(mockNotifier.nowPlayingMovies).thenReturn([testMovie]);
    when(mockNotifier.popularMovies).thenReturn(<Movie>[]);
    when(mockNotifier.topRatedMovies).thenReturn(<Movie>[]);

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
