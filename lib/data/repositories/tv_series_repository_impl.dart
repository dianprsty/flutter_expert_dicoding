import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../common/exception.dart';
import '../../common/failure.dart';
import '../../domain/entities/tv_series.dart';
import '../../domain/entities/tv_series_detail.dart';
import '../../domain/repositories/tv_series_repository.dart';
import '../datasources/tv_series_local_data_source.dart';
import '../datasources/tv_series_remote_data_source.dart';
import '../models/tv_series_table.dart';

class TvSeriesRepositoryImpl implements TvSeriesRepository {
  final TvSeriesRemoteDataSource remoteDataSource;
  final TvSeriesLocalDataSource localDataSource;

  TvSeriesRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, List<TvSeries>>> getOnTheAirTvSeries() async {
    try {
      final result = await remoteDataSource.getOnTheAirTvSeries();
      return Right(result.map((model) => model.toEntity()).toList());
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    } on HandshakeException {
      return Left(CertificateFailure('Cannot access resource'));
    } catch (e) {
      return Left(ServerFailure('Failed to get data'));
    }
  }

  @override
  Future<Either<Failure, TvSeriesDetail>> getTvSeriesDetail(int id) async {
    try {
      final result = await remoteDataSource.getTvSeriesDetail(id);
      return Right(result.toEntity());
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    } on HandshakeException {
      return Left(CertificateFailure('Cannot access resource'));
    } catch (e) {
      return Left(ServerFailure('Failed to get data'));
    }
  }

  @override
  Future<Either<Failure, List<TvSeries>>> getTvSeriesRecommendations(
    int id,
  ) async {
    try {
      final result = await remoteDataSource.getTvSeriesRecommendations(id);
      return Right(result.map((model) => model.toEntity()).toList());
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    } on HandshakeException {
      return Left(CertificateFailure('Cannot access resource'));
    } catch (e) {
      return Left(ServerFailure('Failed to get data'));
    }
  }

  @override
  Future<Either<Failure, List<TvSeries>>> getPopularTvSeries() async {
    try {
      final result = await remoteDataSource.getPopularTvSeries();
      return Right(result.map((model) => model.toEntity()).toList());
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    } on HandshakeException {
      return Left(CertificateFailure('Cannot access resource'));
    } catch (e) {
      return Left(ServerFailure('Failed to get data'));
    }
  }

  @override
  Future<Either<Failure, List<TvSeries>>> getTopRatedTvSeries() async {
    try {
      final result = await remoteDataSource.getTopRatedTvSeries();
      return Right(result.map((model) => model.toEntity()).toList());
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    } on HandshakeException {
      return Left(CertificateFailure('Cannot access resource'));
    } catch (e) {
      return Left(ServerFailure('Failed to get data'));
    }
  }

  @override
  Future<Either<Failure, List<TvSeries>>> searchTvSeries(String query) async {
    try {
      final result = await remoteDataSource.searchTvSeries(query);
      return Right(result.map((model) => model.toEntity()).toList());
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    } on HandshakeException {
      return Left(CertificateFailure('Cannot access resource'));
    } catch (e) {
      return Left(ServerFailure('Failed to get data'));
    }
  }

  @override
  Future<Either<Failure, String>> saveWatchlistTv(
    TvSeriesDetail tvSeries,
  ) async {
    try {
      final result = await localDataSource.insertWatchlistTv(
        TvSeriesTable.fromEntity(tvSeries),
      );
      return Right(result);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Either<Failure, String>> removeWatchlistTv(
    TvSeriesDetail tvSeries,
  ) async {
    try {
      final result = await localDataSource.removeWatchlistTv(
        TvSeriesTable.fromEntity(tvSeries),
      );
      return Right(result);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    }
  }

  @override
  Future<bool> isAddedToWatchlistTv(int id) async {
    final result = await localDataSource.getTvSeriesById(id);
    return result != null;
  }

  @override
  Future<Either<Failure, List<TvSeries>>> getWatchlistTvSeries() async {
    final result = await localDataSource.getWatchlistTvSeriess();
    return Right(result.map((data) => data.toEntity()).toList());
  }
}
