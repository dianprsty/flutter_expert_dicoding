import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ditonton/common/constants.dart';
import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/entities/tv_series.dart';
import 'package:ditonton/presentation/bloc/tv_series/home/home_tv_series_bloc.dart';
import 'package:ditonton/presentation/pages/on_the_air_tv_series_page.dart';
import 'package:ditonton/presentation/pages/popular_tv_series_page.dart';
import 'package:ditonton/presentation/pages/search_tv_series_page.dart';
import 'package:ditonton/presentation/pages/top_rated_tv_series_page.dart';
import 'package:ditonton/presentation/pages/tv_series_detail_page.dart';
import 'package:ditonton/presentation/widgets/app_drawer.dart';

class HomeTvSeriesPage extends StatefulWidget {
  static const ROUTE_NAME = '/tv-series';
  @override
  _HomeTvSeriesPageState createState() => _HomeTvSeriesPageState();
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
              _buildSubHeading(
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

              _buildSubHeading(
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
              _buildSubHeading(
                title: 'Top Rated',
                onTap: () => Navigator.pushNamed(
                  context,
                  TopRatedTvSeriesPage.ROUTE_NAME,
                ),
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

  Row _buildSubHeading({required String title, required Function() onTap}) {
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

  TvSeriesList(this.tvSeriesList);

  @override
  Widget build(BuildContext context) {
    return Container(
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
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                child: CachedNetworkImage(
                  imageUrl: '$BASE_IMAGE_URL${tvSeries.posterPath}',
                  placeholder: (context, url) =>
                      Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
            ),
          );
        },
        itemCount: tvSeriesList.length,
      ),
    );
  }
}
