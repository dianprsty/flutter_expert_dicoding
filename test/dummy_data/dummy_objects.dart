import 'package:ditonton/data/models/movie_table.dart';
import 'package:ditonton/data/models/tv_series_table.dart';
import 'package:ditonton/domain/entities/genre.dart';
import 'package:ditonton/domain/entities/movie.dart';
import 'package:ditonton/domain/entities/movie_detail.dart';
import 'package:ditonton/domain/entities/season.dart';
import 'package:ditonton/domain/entities/tv_series.dart';
import 'package:ditonton/domain/entities/tv_series_detail.dart';

final testMovie = Movie(
  adult: false,
  backdropPath: '/muth4OYamXf41G2evdrLEg8d3om.jpg',
  genreIds: [14, 28],
  id: 557,
  originalTitle: 'Spider-Man',
  overview:
      'After being bitten by a genetically altered spider, nerdy high school student Peter Parker is endowed with amazing powers to become the Amazing superhero known as Spider-Man.',
  popularity: 60.441,
  posterPath: '/rweIrveL43TaxUN0akQEaAXL6x0.jpg',
  releaseDate: '2002-05-01',
  title: 'Spider-Man',
  video: false,
  voteAverage: 7.2,
  voteCount: 13507,
);

final testMovieList = [testMovie];

final testMovieDetail = MovieDetail(
  adult: false,
  backdropPath: 'backdropPath',
  genres: [Genre(id: 1, name: 'Action')],
  id: 1,
  originalTitle: 'originalTitle',
  overview: 'overview',
  posterPath: 'posterPath',
  releaseDate: 'releaseDate',
  runtime: 120,
  title: 'title',
  voteAverage: 1,
  voteCount: 1,
);

final testWatchlistMovie = Movie.watchlist(
  id: 1,
  title: 'title',
  posterPath: 'posterPath',
  overview: 'overview',
);

final testMovieTable = MovieTable(
  id: 1,
  title: 'title',
  posterPath: 'posterPath',
  overview: 'overview',
);

final testMovieMap = {
  'id': 1,
  'overview': 'overview',
  'posterPath': 'posterPath',
  'title': 'title',
};

final testTvSeries = TvSeries(
  adult: false,
  backdropPath: '/muth4OYamXf41G2evdrLEg8d3om.jpg',
  genreIds: [14, 28],
  id: 1,
  originCountry: ['US'],
  originalLanguage: 'en',
  originalName: 'Game of Thrones',
  overview: 'Seven noble families fight for control of the mythical land of Westeros.',
  popularity: 60.441,
  posterPath: '/rweIrveL43TaxUN0akQEaAXL6x0.jpg',
  firstAirDate: '2011-04-17',
  name: 'Game of Thrones',
  voteAverage: 8.3,
  voteCount: 11504,
);

final testTvSeriesList = [testTvSeries];

final testSeason = Season(
  airDate: '2011-04-17',
  episodeCount: 10,
  id: 1,
  name: 'Season 1',
  overview: 'First season of Game of Thrones.',
  posterPath: '/rweIrveL43TaxUN0akQEaAXL6x0.jpg',
  seasonNumber: 1,
  voteAverage: 8.0,
);

final testTvSeriesDetail = TvSeriesDetail(
  adult: false,
  backdropPath: 'backdropPath',
  episodeRunTime: [60],
  firstAirDate: '2011-04-17',
  genres: [Genre(id: 1, name: 'Drama')],
  homepage: 'https://www.hbo.com/game-of-thrones',
  id: 1,
  inProduction: false,
  languages: ['en'],
  lastAirDate: '2019-05-19',
  name: 'Game of Thrones',
  numberOfEpisodes: 73,
  numberOfSeasons: 8,
  overview: 'Seven noble families fight for control of the mythical land of Westeros.',
  posterPath: 'posterPath',
  seasons: [testSeason],
  status: 'Ended',
  tagline: 'Winter is coming',
  voteAverage: 8.3,
  voteCount: 11504,
  popularity: 60.441,
  type: 'Scripted',
);

final testWatchlistTvSeries = TvSeries.watchlist(
  id: 1,
  name: 'Game of Thrones',
  posterPath: 'posterPath',
  overview: 'Seven noble families fight for control of the mythical land of Westeros.',
);

final testTvSeriesTable = TvSeriesTable(
  id: 1,
  name: 'Game of Thrones',
  posterPath: 'posterPath',
  overview: 'Seven noble families fight for control of the mythical land of Westeros.',
);

final testTvSeriesMap = {
  'id': 1,
  'name': 'Game of Thrones',
  'posterPath': 'posterPath',
  'overview': 'Seven noble families fight for control of the mythical land of Westeros.',
};
