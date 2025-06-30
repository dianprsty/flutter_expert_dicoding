import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'common/constants.dart';
import 'common/utils.dart';
import 'firebase_options.dart';
import 'injection.dart' as di;
import 'presentation/bloc/movie/detail/movie_detail_bloc.dart';
import 'presentation/bloc/movie/home/home_movie_bloc.dart';
import 'presentation/bloc/movie/popular/popular_movie_bloc.dart';
import 'presentation/bloc/movie/search/search_movie_bloc.dart';
import 'presentation/bloc/movie/top_rated/top_rated_movie_bloc.dart';
import 'presentation/bloc/movie/watchlist/watchlist_movie_bloc.dart';
import 'presentation/bloc/tv_series/detail/tv_series_detail_bloc.dart';
import 'presentation/bloc/tv_series/home/home_tv_series_bloc.dart';
import 'presentation/bloc/tv_series/on_the_air/on_the_air_tv_series_bloc.dart';
import 'presentation/bloc/tv_series/popular/popular_tv_series_bloc.dart';
import 'presentation/bloc/tv_series/search/search_tv_series_bloc.dart';
import 'presentation/bloc/tv_series/top_rated/top_rated_tv_series_bloc.dart';
import 'presentation/bloc/tv_series/watchlist/watchlist_tv_series_bloc.dart';
import 'presentation/pages/about_page.dart';
import 'presentation/pages/home_movie_page.dart';
import 'presentation/pages/home_tv_series_page.dart';
import 'presentation/pages/movie_detail_page.dart';
import 'presentation/pages/on_the_air_tv_series_page.dart';
import 'presentation/pages/popular_movies_page.dart';
import 'presentation/pages/popular_tv_series_page.dart';
import 'presentation/pages/search_page.dart';
import 'presentation/pages/search_tv_series_page.dart';
import 'presentation/pages/top_rated_movies_page.dart';
import 'presentation/pages/top_rated_tv_series_page.dart';
import 'presentation/pages/tv_series_detail_page.dart';
import 'presentation/pages/watchlist_movies_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => di.locator<HomeMovieBloc>()),
        BlocProvider(create: (context) => di.locator<PopularMovieBloc>()),
        BlocProvider(create: (context) => di.locator<TopRatedMovieBloc>()),
        BlocProvider(create: (context) => di.locator<MovieDetailBloc>()),
        BlocProvider(create: (context) => di.locator<SearchMovieBloc>()),
        BlocProvider(create: (context) => di.locator<HomeTvSeriesBloc>()),
        BlocProvider(create: (context) => di.locator<SearchTvSeriesBloc>()),
        BlocProvider(create: (context) => di.locator<OnTheAirTvSeriesBloc>()),
        BlocProvider(create: (context) => di.locator<PopularTvSeriesBloc>()),
        BlocProvider(create: (context) => di.locator<TopRatedTvSeriesBloc>()),
        BlocProvider(create: (context) => di.locator<TvSeriesDetailBloc>()),
        BlocProvider(create: (context) => di.locator<WatchlistTvSeriesBloc>()),
        BlocProvider(create: (context) => di.locator<WatchlistMovieBloc>()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData.dark().copyWith(
          colorScheme: kColorScheme,
          primaryColor: kRichBlack,
          scaffoldBackgroundColor: kRichBlack,
          textTheme: kTextTheme,
          drawerTheme: kDrawerTheme,
        ),
        home: HomeTvSeriesPage(),
        navigatorObservers: [routeObserver],
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            case HomeMoviePage.ROUTE_NAME:
              return MaterialPageRoute(builder: (_) => HomeMoviePage());
            case PopularMoviesPage.ROUTE_NAME:
              return CupertinoPageRoute(builder: (_) => PopularMoviesPage());
            case TopRatedMoviesPage.ROUTE_NAME:
              return CupertinoPageRoute(builder: (_) => TopRatedMoviesPage());
            case MovieDetailPage.ROUTE_NAME:
              final id = settings.arguments as int;
              return MaterialPageRoute(
                builder: (_) => MovieDetailPage(id: id),
                settings: settings,
              );
            case SearchPage.ROUTE_NAME:
              return CupertinoPageRoute(builder: (_) => SearchPage());
            case WatchlistMoviesPage.ROUTE_NAME:
              return MaterialPageRoute(builder: (_) => WatchlistMoviesPage());
            case AboutPage.ROUTE_NAME:
              return MaterialPageRoute(builder: (_) => AboutPage());
            case HomeTvSeriesPage.ROUTE_NAME:
              return MaterialPageRoute(builder: (_) => HomeTvSeriesPage());
            case PopularTvSeriesPage.ROUTE_NAME:
              return CupertinoPageRoute(builder: (_) => PopularTvSeriesPage());
            case TopRatedTvSeriesPage.ROUTE_NAME:
              return CupertinoPageRoute(builder: (_) => TopRatedTvSeriesPage());
            case OnTheAirTvSeriesPage.ROUTE_NAME:
              return CupertinoPageRoute(builder: (_) => OnTheAirTvSeriesPage());
            case TvSeriesDetailPage.ROUTE_NAME:
              final id = settings.arguments as int;
              return MaterialPageRoute(
                builder: (_) => TvSeriesDetailPage(id: id),
                settings: settings,
              );
            case SearchTvSeriesPage.ROUTE_NAME:
              return CupertinoPageRoute(builder: (_) => SearchTvSeriesPage());
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
}
