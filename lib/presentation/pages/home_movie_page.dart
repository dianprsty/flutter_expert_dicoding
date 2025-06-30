import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/constants.dart';
import '../../common/state_enum.dart';
import '../../common/utils.dart';
import '../../domain/entities/movie.dart';
import '../bloc/movie/home/home_movie_bloc.dart';
import '../widgets/app_drawer.dart';

import 'movie_detail_page.dart';
import 'popular_movies_page.dart';
import 'search_page.dart';
import 'top_rated_movies_page.dart';

class HomeMoviePage extends StatefulWidget {
  static const ROUTE_NAME = '/home-movie';

  const HomeMoviePage({super.key});
  @override
  State<HomeMoviePage> createState() => _HomeMoviePageState();
}

class _HomeMoviePageState extends State<HomeMoviePage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<HomeMovieBloc>().add(
        const HomeMovieEvent.fetchNowPlayingMovies(),
      );
      context.read<HomeMovieBloc>().add(
        const HomeMovieEvent.fetchPopularMovies(),
      );
      context.read<HomeMovieBloc>().add(
        const HomeMovieEvent.fetchTopRatedMovies(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text('Movie'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, SearchPage.ROUTE_NAME);
            },
            icon: Icon(Icons.search),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Now Playing', style: kHeading6),
              BlocBuilder<HomeMovieBloc, HomeMovieState>(
                builder: (context, state) {
                  final nowPlayingState = state.nowPlayingState;
                  if (nowPlayingState == RequestState.Loading) {
                    return Center(child: CircularProgressIndicator());
                  } else if (nowPlayingState == RequestState.Loaded) {
                    return MovieList(state.nowPlayingMovies);
                  } else {
                    return Text('Failed');
                  }
                },
              ),
              SubHeading(
                title: 'Popular',
                onTap: () {
                  Navigator.pushNamed(context, PopularMoviesPage.ROUTE_NAME);
                },
              ),
              BlocBuilder<HomeMovieBloc, HomeMovieState>(
                builder: (context, state) {
                  final popularState = state.popularState;
                  if (popularState == RequestState.Loading) {
                    return Center(child: CircularProgressIndicator());
                  } else if (popularState == RequestState.Loaded) {
                    return MovieList(state.popularMovies);
                  } else {
                    return Text('Failed');
                  }
                },
              ),
              SubHeading(
                title: 'Top Rated',
                onTap: () =>
                    Navigator.pushNamed(context, TopRatedMoviesPage.ROUTE_NAME),
              ),
              BlocBuilder<HomeMovieBloc, HomeMovieState>(
                builder: (context, state) {
                  final topRatedState = state.topRatedState;
                  if (topRatedState == RequestState.Loading) {
                    return Center(child: CircularProgressIndicator());
                  } else if (topRatedState == RequestState.Loaded) {
                    return MovieList(state.topRatedMovies);
                  } else {
                    return Text('Failed');
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SubHeading extends StatelessWidget {
  const SubHeading({super.key, required this.title, required this.onTap});

  final String title;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: kHeading6),
        InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [Text('See More'), Icon(Icons.arrow_forward_ios)],
            ),
          ),
        ),
      ],
    );
  }
}

class MovieList extends StatelessWidget {
  final List<Movie> movies;

  const MovieList(this.movies, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final movie = movies[index];
          return Container(
            padding: const EdgeInsets.all(8),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  MovieDetailPage.ROUTE_NAME,
                  arguments: movie.id,
                );
              },
              child: FutureBuilder(
                future: getNetworkImage(
                  path: movie.posterPath ?? '',
                  width: 120,
                  height: 160,
                ),
                builder: (context, asyncSnapshot) {
                  return ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    child:
                        asyncSnapshot.data ??
                        SizedBox(
                          width: 120,
                          height: 160,
                          child: Center(child: CircularProgressIndicator()),
                        ),
                  );
                },
              ),
            ),
          );
        },
        itemCount: movies.length,
      ),
    );
  }
}
