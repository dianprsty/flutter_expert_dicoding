import 'package:ditonton/presentation/pages/about_page.dart';
import 'package:ditonton/presentation/pages/home_movie_page.dart';
import 'package:ditonton/presentation/pages/home_tv_series_page.dart';
import 'package:ditonton/presentation/pages/watchlist_movies_page.dart';
import 'package:ditonton/presentation/widgets/app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Widget _makeTestableWidget(Widget body) {
    return MaterialApp(
      home: Scaffold(
        body: body,
      ),
    );
  }

  testWidgets('Drawer should display app info', (WidgetTester tester) async {
    await tester.pumpWidget(_makeTestableWidget(AppDrawer()));

    expect(find.text('Ditonton'), findsOneWidget);
    expect(find.text('ditonton@dicoding.com'), findsOneWidget);
  });

  testWidgets('Drawer should navigate to TV Series page when TV Series menu is tapped',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Scaffold(drawer: AppDrawer(), body: Container()),
        HomeTvSeriesPage.ROUTE_NAME: (context) => Container(),
      },
    ));

    await tester.dragFrom(Offset(0, 100), Offset(300, 100));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Tv Series'));
    await tester.pumpAndSettle();

    expect(find.byType(Container), findsOneWidget);
  });

  testWidgets('Drawer should navigate to Movies page when Movies menu is tapped',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Scaffold(drawer: AppDrawer(), body: Container()),
        HomeMoviePage.ROUTE_NAME: (context) => Container(),
      },
    ));

    await tester.dragFrom(Offset(0, 100), Offset(300, 100));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Movies'));
    await tester.pumpAndSettle();

    expect(find.byType(Container), findsOneWidget);
  });

  testWidgets('Drawer should navigate to Watchlist page when Watchlist menu is tapped',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Scaffold(drawer: AppDrawer(), body: Container()),
        WatchlistMoviesPage.ROUTE_NAME: (context) => Container(),
      },
    ));

    await tester.dragFrom(Offset(0, 100), Offset(300, 100));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Watchlist'));
    await tester.pumpAndSettle();

    expect(find.byType(Container), findsOneWidget);
  });

  testWidgets('Drawer should navigate to About page when About menu is tapped',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Scaffold(drawer: AppDrawer(), body: Container()),
        AboutPage.ROUTE_NAME: (context) => Container(),
      },
    ));

    await tester.dragFrom(Offset(0, 100), Offset(300, 100));
    await tester.pumpAndSettle();

    await tester.tap(find.byIcon(Icons.info_outline));
    await tester.pumpAndSettle();

    expect(find.byType(Container), findsOneWidget);
  });
}