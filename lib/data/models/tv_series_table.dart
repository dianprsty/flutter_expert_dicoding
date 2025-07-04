import 'package:equatable/equatable.dart';

import '../../domain/entities/tv_series.dart';
import '../../domain/entities/tv_series_detail.dart';

class TvSeriesTable extends Equatable {
  final int id;
  final String? name;
  final String? posterPath;
  final String? overview;

  const TvSeriesTable({
    required this.id,
    required this.name,
    required this.posterPath,
    required this.overview,
  });

  factory TvSeriesTable.fromEntity(TvSeriesDetail tvSeries) => TvSeriesTable(
    id: tvSeries.id,
    name: tvSeries.name,
    posterPath: tvSeries.posterPath,
    overview: tvSeries.overview,
  );

  factory TvSeriesTable.fromMap(Map<String, dynamic> map) => TvSeriesTable(
    id: map['id'],
    name: map['name'],
    posterPath: map['posterPath'],
    overview: map['overview'],
  );

  TvSeriesTable copyWith({
    int? id,
    String? name,
    String? posterPath,
    String? overview,
  }) => TvSeriesTable(
    id: id ?? this.id,
    name: name ?? this.name,
    posterPath: posterPath ?? this.posterPath,
    overview: overview ?? this.overview,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'posterPath': posterPath,
    'overview': overview,
  };

  TvSeries toEntity() => TvSeries.watchlist(
    id: id,
    overview: overview ?? '',
    posterPath: posterPath ?? '',
    name: name ?? '',
  );

  @override
  List<Object?> get props => [id, name, posterPath, overview];
}
