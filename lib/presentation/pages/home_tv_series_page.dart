import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/constants.dart';
import '../../common/state_enum.dart';
import '../../common/utils.dart';
import '../../domain/entities/tv_series.dart';
import '../bloc/tv_series/home/home_tv_series_bloc.dart';
import '../widgets/app_drawer.dart';

import 'on_the_air_tv_series_page.dart';
import 'popular_tv_series_page.dart';
import 'search_tv_series_page.dart';
import 'top_rated_tv_series_page.dart';
import 'tv_series_detail_page.dart';

class HomeTvSeriesPage extends StatefulWidget {
  static const ROUTE_NAME = '/tv-series';

  const HomeTvSeriesPage({super.key});
  @override
  State<HomeTvSeriesPage> createState() => _HomeTvSeriesPageState();
}

class _HomeTvSeriesPageState extends State<HomeTvSeriesPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<HomeTvSeriesBloc>().add(
        const HomeTvSeriesEvent.fetchOnTheAirTvSeries(),
      );
      context.read<HomeTvSeriesBloc>().add(
        const HomeTvSeriesEvent.fetchPopularTvSeries(),
      );
      context.read<HomeTvSeriesBloc>().add(
        const HomeTvSeriesEvent.fetchTopRatedTvSeries(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text('TV Series'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, SearchTvSeriesPage.ROUTE_NAME);
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
              SubHeading(
                title: 'On Going',
                onTap: () => Navigator.pushNamed(
                  context,
                  OnTheAirTvSeriesPage.ROUTE_NAME,
                ),
              ),
              BlocBuilder<HomeTvSeriesBloc, HomeTvSeriesState>(
                builder: (context, state) {
                  final onTheAirState = state.onTheAirState;
                  if (onTheAirState == RequestState.Loading) {
                    return Center(child: CircularProgressIndicator());
                  } else if (onTheAirState == RequestState.Loaded) {
                    return TvSeriesList(state.onTheAirTvSeries);
                  } else {
                    return Text('Failed: ${state.message}');
                  }
                },
              ),

              SubHeading(
                title: 'Popular',
                onTap: () => Navigator.pushNamed(
                  context,
                  PopularTvSeriesPage.ROUTE_NAME,
                ),
              ),
              BlocBuilder<HomeTvSeriesBloc, HomeTvSeriesState>(
                builder: (context, state) {
                  final popularState = state.popularState;
                  if (popularState == RequestState.Loading) {
                    return Center(child: CircularProgressIndicator());
                  } else if (popularState == RequestState.Loaded) {
                    return TvSeriesList(state.popularTvSeries);
                  } else {
                    return Text('Failed: ${state.message}');
                  }
                },
              ),
              SubHeading(
                title: 'Top Rated',
                onTap: () {
                  Navigator.pushNamed(context, TopRatedTvSeriesPage.ROUTE_NAME);
                },
              ),
              BlocBuilder<HomeTvSeriesBloc, HomeTvSeriesState>(
                builder: (context, state) {
                  final topRatedState = state.topRatedState;
                  if (topRatedState == RequestState.Loading) {
                    return Center(child: CircularProgressIndicator());
                  } else if (topRatedState == RequestState.Loaded) {
                    return TvSeriesList(state.topRatedTvSeries);
                  } else {
                    return Text('Failed: ${state.message}');
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

class TvSeriesList extends StatelessWidget {
  final List<TvSeries> tvSeriesList;

  const TvSeriesList(this.tvSeriesList, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final tvSeries = tvSeriesList[index];
          return Container(
            padding: const EdgeInsets.all(8),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  TvSeriesDetailPage.ROUTE_NAME,
                  arguments: tvSeries.id,
                );
              },
              child: FutureBuilder(
                future: getNetworkImage(
                  path: tvSeries.posterPath ?? '',
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
        itemCount: tvSeriesList.length,
      ),
    );
  }
}
