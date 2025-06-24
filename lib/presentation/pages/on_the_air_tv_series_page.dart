import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/presentation/bloc/tv_series/on_the_air/on_the_air_tv_series_bloc.dart';
import 'package:ditonton/presentation/widgets/tv_series_card_list.dart';

class OnTheAirTvSeriesPage extends StatefulWidget {
  static const ROUTE_NAME = '/top-rated-tv-series';

  @override
  _OnTheAirTvSeriesPageState createState() => _OnTheAirTvSeriesPageState();
}

class _OnTheAirTvSeriesPageState extends State<OnTheAirTvSeriesPage> {
  @override
  void initState() {
    super.initState();
    context.read<OnTheAirTvSeriesBloc>().add(
      OnTheAirTvSeriesEvent.fetchOnTheAirTvSeries(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('On Going Tv Series')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<OnTheAirTvSeriesBloc, OnTheAirTvSeriesState>(
          builder: (context, state) {
            if (state.requestState == RequestState.Loading) {
              return Center(child: CircularProgressIndicator());
            } else if (state.requestState == RequestState.Loaded) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  final tvSeries = state.tvSeries[index];
                  return TvSeriesCard(tvSeries);
                },
                itemCount: state.tvSeries.length,
              );
            } else {
              return Center(
                key: Key('error_message'),
                child: Text(
                  state.requestState == RequestState.Empty
                      ? 'Empty Data'
                      : state.message,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
