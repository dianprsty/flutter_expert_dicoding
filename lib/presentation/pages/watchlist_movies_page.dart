import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/common/utils.dart';
import 'package:ditonton/presentation/provider/movie/watchlist_movie_notifier.dart';
import 'package:ditonton/presentation/provider/tv_series/watchlist_tv_series_notifier.dart';
import 'package:ditonton/presentation/widgets/movie_card_list.dart';
import 'package:ditonton/presentation/widgets/tv_series_card_list.dart';

class WatchlistMoviesPage extends StatefulWidget {
  static const ROUTE_NAME = '/watchlist-movie';

  @override
  _WatchlistMoviesPageState createState() => _WatchlistMoviesPageState();
}

class _WatchlistMoviesPageState extends State<WatchlistMoviesPage>
    with RouteAware {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => Provider.of<WatchlistMovieNotifier>(
        context,
        listen: false,
      ).fetchWatchlistMovies(),
    );
    Future.microtask(
      () => Provider.of<WatchlistTvSeriesNotifier>(
        context,
        listen: false,
      ).fetchWatchlistTvSeries(),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

  void didPopNext() {
    Provider.of<WatchlistMovieNotifier>(
      context,
      listen: false,
    ).fetchWatchlistMovies();
    Provider.of<WatchlistTvSeriesNotifier>(
      context,
      listen: false,
    ).fetchWatchlistTvSeries();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Watchlist'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Tv Series'),
              Tab(text: 'Movies'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Consumer<WatchlistTvSeriesNotifier>(
                builder: (context, data, child) {
                  if (data.watchlistState == RequestState.Loading) {
                    return Center(child: CircularProgressIndicator());
                  } else if (data.watchlistState == RequestState.Loaded) {
                    return data.watchlistTvSeries.length > 0
                        ? ListView.builder(
                            itemBuilder: (context, index) {
                              final tvSeries = data.watchlistTvSeries[index];
                              return TvSeriesCard(tvSeries);
                            },
                            itemCount: data.watchlistTvSeries.length,
                          )
                        : Center(child: Text('No Watchlist Tv Series'));
                  } else {
                    return Center(
                      key: Key('error_message'),
                      child: Text(data.message),
                    );
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Consumer<WatchlistMovieNotifier>(
                builder: (context, data, child) {
                  if (data.watchlistState == RequestState.Loading) {
                    return Center(child: CircularProgressIndicator());
                  } else if (data.watchlistState == RequestState.Loaded) {
                    return data.watchlistMovies.length > 0
                        ? ListView.builder(
                            itemBuilder: (context, index) {
                              final movie = data.watchlistMovies[index];
                              return MovieCard(movie);
                            },
                            itemCount: data.watchlistMovies.length,
                          )
                        : Center(child: Text('No Watchlist Movies'));
                  } else {
                    return Center(
                      key: Key('error_message'),
                      child: Text(data.message),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }
}
