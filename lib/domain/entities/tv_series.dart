// /domain/entities/tv_series.dart
import 'package:equatable/equatable.dart';

class TvSeries extends Equatable {
  final bool? adult;
  final String? backdropPath;
  final List<int>? genreIds;
  final int id;
  final List<String>? originCountry;
  final String? originalLanguage;
  final String? originalName;
  final String? overview;
  final double? popularity;
  final String? posterPath;
  final String? firstAirDate;
  final String? name;
  final double? voteAverage;
  final int? voteCount;

  const TvSeries({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originCountry,
    required this.originalLanguage,
    required this.originalName,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.firstAirDate,
    required this.name,
    required this.voteAverage,
    required this.voteCount,
  });

  const TvSeries.watchlist({
    required int id,
    required String overview,
    required String posterPath,
    required String name,
  }) : id = id,
       overview = overview,
       adult = null,
       backdropPath = null,
       genreIds = null,
       originCountry = null,
       originalLanguage = null,
       originalName = null,
       popularity = null,
       posterPath = posterPath,
       firstAirDate = null,
       name = name,
       voteAverage = null,
       voteCount = null;

  @override
  List<Object?> get props => [
    adult,
    backdropPath,
    genreIds,
    id,
    originCountry,
    originalLanguage,
    originalName,
    overview,
    popularity,
    posterPath,
    firstAirDate,
    name,
    voteAverage,
    voteCount,
  ];
}
