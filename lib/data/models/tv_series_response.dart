import 'package:equatable/equatable.dart';

import 'tv_series_model.dart';

class TvSeriesResponse extends Equatable {
  final List<TvSeriesModel> tvSeriesList;

  const TvSeriesResponse({required this.tvSeriesList});

  factory TvSeriesResponse.fromJson(Map<String, dynamic> json) =>
      TvSeriesResponse(
        tvSeriesList: List<TvSeriesModel>.from(
          (json['results'] as List)
              .map((x) => TvSeriesModel.fromJson(x))
              .where((element) => element.posterPath != null),
        ),
      );

  Map<String, dynamic> toJson() {
    return {'results': tvSeriesList.map((series) => series.toJson()).toList()};
  }

  @override
  List<Object?> get props => [tvSeriesList];
}
