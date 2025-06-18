import 'package:ditonton/domain/usecases/tv_series/get_watchlist_tv_status.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../helpers/test_helper.mocks.dart';

void main() {
  late GetWatchlistTvStatus usecase;
  late MockTvSeriesRepository mockTvSeriesRepository;

  setUp(() {
    mockTvSeriesRepository = MockTvSeriesRepository();
    usecase = GetWatchlistTvStatus(mockTvSeriesRepository);
  });

  test('should get watchlist status from repository', () async {
    // arrange
    when(
      mockTvSeriesRepository.isAddedToWatchlistTv(1),
    ).thenAnswer((_) async => true);
    // act
    final result = await usecase.execute(1);
    // assert
    expect(result, true);
  });
}