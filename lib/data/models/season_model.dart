import 'package:equatable/equatable.dart';

import 'package:ditonton/domain/entities/season.dart';

class SeasonModel extends Equatable {
  const SeasonModel({
    required this.airDate,
    required this.episodeCount,
    required this.id,
    required this.name,
    required this.overview,
    required this.posterPath,
    required this.seasonNumber,
    required this.voteAverage,
  });

  final String? airDate;
  final int episodeCount;
  final int id;
  final String name;
  final String overview;
  final String? posterPath;
  final int seasonNumber;
  final double voteAverage;

  factory SeasonModel.fromJson(Map<String, dynamic> json) => SeasonModel(
    airDate: json["air_date"],
    episodeCount: json["episode_count"],
    id: json["id"],
    name: json["name"],
    overview: json["overview"],
    posterPath: json["poster_path"],
    seasonNumber: json["season_number"],
    voteAverage: (json["vote_average"] is num)
        ? json["vote_average"].toDouble()
        : double.parse(json["vote_average"].toString()),
  );

  Map<String, dynamic> toJson() => {
    "air_date": airDate,
    "episode_count": episodeCount,
    "id": id,
    "name": name,
    "overview": overview,
    "poster_path": posterPath,
    "season_number": seasonNumber,
    "vote_average": voteAverage,
  };

  Season toEntity() {
    return Season(
      airDate: this.airDate,
      episodeCount: this.episodeCount,
      id: this.id,
      name: this.name,
      overview: this.overview,
      posterPath: this.posterPath,
      seasonNumber: this.seasonNumber,
      voteAverage: this.voteAverage,
    );
  }

  @override
  List<Object?> get props => [
    airDate,
    episodeCount,
    id,
    name,
    overview,
    posterPath,
    seasonNumber,
    voteAverage,
  ];
}
