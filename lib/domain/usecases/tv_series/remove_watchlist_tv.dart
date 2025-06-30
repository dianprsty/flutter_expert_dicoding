import 'package:dartz/dartz.dart';

import '../../../common/failure.dart';
import '../../entities/tv_series_detail.dart';
import '../../repositories/tv_series_repository.dart';

class RemoveWatchlistTv {
  final TvSeriesRepository repository;

  RemoveWatchlistTv(this.repository);

  Future<Either<Failure, String>> execute(TvSeriesDetail tvSeries) {
    return repository.removeWatchlistTv(tvSeries);
  }
}
