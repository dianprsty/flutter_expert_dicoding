// /domain/entities/movie.dart
import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final bool? adult;
  final String? backdropPath;
  final List<int>? genreIds;
  final int id;
  final String? originalTitle;
  final String? overview;
  final double? popularity;
  final String? posterPath;
  final String? releaseDate;
  final String? title;
  final bool? video;
  final double? voteAverage;
  final int? voteCount;

  const Movie({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  const Movie.watchlist({
    required this.id,
    required String this.overview,
    required String this.posterPath,
    required String this.title,
  }) : adult = null,
       backdropPath = null,
       genreIds = null,
       originalTitle = null,
       popularity = null,
       releaseDate = null,
       video = null,
       voteAverage = null,
       voteCount = null;

  @override
  List<Object?> get props => [
    adult,
    backdropPath,
    genreIds,
    id,
    originalTitle,
    overview,
    popularity,
    posterPath,
    releaseDate,
    title,
    video,
    voteAverage,
    voteCount,
  ];
}
