import 'package:equatable/equatable.dart';

import 'genre_model.dart';
import 'season_model.dart';
import '../../domain/entities/tv_series_detail.dart';

class TvSeriesDetailResponse extends Equatable {
  const TvSeriesDetailResponse({
    required this.adult,
    required this.backdropPath,
    required this.episodeRunTime,
    required this.firstAirDate,
    required this.genres,
    required this.homepage,
    required this.id,
    required this.inProduction,
    required this.languages,
    required this.lastAirDate,
    required this.name,
    required this.numberOfEpisodes,
    required this.numberOfSeasons,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.seasons,
    required this.status,
    required this.tagline,
    required this.type,
    required this.voteAverage,
    required this.voteCount,
  });

  final bool adult;
  final String? backdropPath;
  final List<int> episodeRunTime;
  final String firstAirDate;
  final List<GenreModel> genres;
  final String homepage;
  final int id;
  final bool inProduction;
  final List<String> languages;
  final String lastAirDate;
  final String name;
  final int numberOfEpisodes;
  final int numberOfSeasons;
  final String overview;
  final double popularity;
  final String posterPath;
  final List<SeasonModel> seasons;
  final String status;
  final String tagline;
  final String type;
  final double voteAverage;
  final int voteCount;

  factory TvSeriesDetailResponse.fromJson(Map<String, dynamic> json) {
    final genreList = (json['genres'] as List)
        .map((item) => GenreModel.fromJson(item))
        .toList();

    final seasonList = (json['seasons'] as List)
        .map((item) => SeasonModel.fromJson(item))
        .toList();

    return TvSeriesDetailResponse(
      adult: json['adult'],
      backdropPath: json['backdrop_path'],
      episodeRunTime: List<int>.from(json['episode_run_time'].map((x) => x)),
      firstAirDate: json['first_air_date'],
      genres: genreList,
      homepage: json['homepage'] ?? '',
      id: json['id'],
      inProduction: json['in_production'],
      languages: List<String>.from(json['languages'].map((x) => x)),
      lastAirDate: json['last_air_date'],
      name: json['name'],
      numberOfEpisodes: json['number_of_episodes'],
      numberOfSeasons: json['number_of_seasons'],
      overview: json['overview'],
      popularity: json['popularity'].toDouble(),
      posterPath: json['poster_path'],
      seasons: seasonList,
      status: json['status'],
      tagline: json['tagline'],
      type: json['type'],
      voteAverage: json['vote_average'].toDouble(),
      voteCount: json['vote_count'],
    );
  }

  Map<String, dynamic> toJson() => {
    'adult': adult,
    'backdrop_path': backdropPath,
    'episode_run_time': List<dynamic>.from(episodeRunTime.map((x) => x)),
    'first_air_date': firstAirDate,
    'genres': List<dynamic>.from(genres.map((x) => x.toJson())),
    'homepage': homepage,
    'id': id,
    'in_production': inProduction,
    'languages': List<dynamic>.from(languages.map((x) => x)),
    'last_air_date': lastAirDate,
    'name': name,
    'number_of_episodes': numberOfEpisodes,
    'number_of_seasons': numberOfSeasons,
    'overview': overview,
    'popularity': popularity,
    'poster_path': posterPath,
    'seasons': List<dynamic>.from(seasons.map((x) => x.toJson())),
    'status': status,
    'tagline': tagline,
    'type': type,
    'vote_average': voteAverage,
    'vote_count': voteCount,
  };

  TvSeriesDetail toEntity() {
    return TvSeriesDetail(
      adult: adult,
      backdropPath: backdropPath,
      episodeRunTime: episodeRunTime,
      firstAirDate: firstAirDate,
      genres: genres.map((genre) => genre.toEntity()).toList(),
      homepage: homepage,
      id: id,
      inProduction: inProduction,
      languages: languages,
      lastAirDate: lastAirDate,
      name: name,
      numberOfEpisodes: numberOfEpisodes,
      numberOfSeasons: numberOfSeasons,
      overview: overview,
      popularity: popularity,
      posterPath: posterPath,
      seasons: seasons.map((season) => season.toEntity()).toList(),
      status: status,
      tagline: tagline,
      type: type,
      voteAverage: voteAverage,
      voteCount: voteCount,
    );
  }

  @override
  List<Object?> get props => [
    adult,
    backdropPath,
    episodeRunTime,
    firstAirDate,
    genres,
    homepage,
    id,
    inProduction,
    languages,
    lastAirDate,
    name,
    numberOfEpisodes,
    numberOfSeasons,
    overview,
    popularity,
    posterPath,
    seasons,
    status,
    tagline,
    type,
    voteAverage,
    voteCount,
  ];
}
