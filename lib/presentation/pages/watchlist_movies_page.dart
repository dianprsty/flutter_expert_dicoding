import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/common/utils.dart';
import 'package:ditonton/presentation/bloc/movie/watchlist/watchlist_movie_bloc.dart';
import 'package:ditonton/presentation/bloc/tv_series/watchlist/watchlist_tv_series_bloc.dart';
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
    Future.microtask(() {
      context.read<WatchlistMovieBloc>().add(
        WatchlistMovieEvent.fetchWatchlistMovies(),
      );
      context.read<WatchlistTvSeriesBloc>().add(
        WatchlistTvSeriesEvent.fetchWatchlistTvSeries(),
      );
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

  void didPopNext() {
    context.read<WatchlistMovieBloc>().add(
      WatchlistMovieEvent.fetchWatchlistMovies(),
    );
    context.read<WatchlistTvSeriesBloc>().add(
      WatchlistTvSeriesEvent.fetchWatchlistTvSeries(),
    );
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
              child: BlocBuilder<WatchlistTvSeriesBloc, WatchlistTvSeriesState>(
                builder: (context, state) {
                  if (state.requestState == RequestState.Loading) {
                    return Center(key: Key('tv_series_loading'), child: CircularProgressIndicator());
                  } else if (state.requestState == RequestState.Loaded) {
                    return state.watchlistTvSeries.isNotEmpty
                        ? ListView.builder(
                            key: Key('tv_series_list'),
                            itemBuilder: (context, index) {
                              final tvSeries = state.watchlistTvSeries[index];
                              return TvSeriesCard(tvSeries);
                            },
                            itemCount: state.watchlistTvSeries.length,
                          )
                        : Center(key: Key('empty_tv_series_message'), child: Text('No Watchlist Tv Series'));
                  } else {
                    return Center(
                      key: Key('error_message'),
                      child: Text(state.message),
                    );
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: BlocBuilder<WatchlistMovieBloc, WatchlistMovieState>(
                builder: (context, state) {
                  if (state.requestState == RequestState.Loading) {
                    return Center(key: Key('movie_loading'), child: CircularProgressIndicator());
                  } else if (state.requestState == RequestState.Loaded) {
                    return state.watchlistMovies.isNotEmpty
                        ? ListView.builder(
                            key: Key('movie_list'),
                            itemBuilder: (context, index) {
                              final movie = state.watchlistMovies[index];
                              return MovieCard(movie);
                            },
                            itemCount: state.watchlistMovies.length,
                          )
                        : Center(key: Key('empty_movie_message'), child: Text('No Watchlist Movies'));
                  } else {
                    return Center(
                      key: Key('error_message'),
                      child: Text(state.message),
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
