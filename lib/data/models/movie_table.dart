import 'package:equatable/equatable.dart';

import '../../domain/entities/movie.dart';
import '../../domain/entities/movie_detail.dart';

class MovieTable extends Equatable {
  final int id;
  final String? title;
  final String? posterPath;
  final String? overview;

  const MovieTable({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.overview,
  });

  factory MovieTable.fromEntity(MovieDetail movie) => MovieTable(
    id: movie.id,
    title: movie.title,
    posterPath: movie.posterPath,
    overview: movie.overview,
  );

  factory MovieTable.fromMap(Map<String, dynamic> map) => MovieTable(
    id: map['id'],
    title: map['title'],
    posterPath: map['posterPath'],
    overview: map['overview'],
  );

  MovieTable copyWith({
    int? id,
    String? title,
    String? posterPath,
    String? overview,
  }) => MovieTable(
    id: id ?? this.id,
    title: title ?? this.title,
    posterPath: posterPath ?? this.posterPath,
    overview: overview ?? this.overview,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'posterPath': posterPath,
    'overview': overview,
  };

  Movie toEntity() => Movie.watchlist(
    id: id,
    overview: overview ?? '',
    posterPath: posterPath ?? '',
    title: title ?? '',
  );

  @override
  List<Object?> get props => [id, title, posterPath, overview];
}
