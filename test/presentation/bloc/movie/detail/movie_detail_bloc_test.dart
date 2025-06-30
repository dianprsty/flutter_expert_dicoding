import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/entities/movie.dart';
import 'package:ditonton/domain/usecases/movies/get_movie_detail.dart';
import 'package:ditonton/domain/usecases/movies/get_movie_recommendations.dart';
import 'package:ditonton/domain/usecases/movies/get_watchlist_status.dart';
import 'package:ditonton/domain/usecases/movies/remove_watchlist.dart';
import 'package:ditonton/domain/usecases/movies/save_watchlist.dart';
import 'package:ditonton/presentation/bloc/movie/detail/movie_detail_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../dummy_data/dummy_objects.dart';
import 'movie_detail_bloc_test.mocks.dart';

@GenerateMocks([
  GetMovieDetail,
  GetMovieRecommendations,
  GetWatchListStatus,
  SaveWatchlist,
  RemoveWatchlist,
])
void main() {
  late MockGetMovieDetail mockGetMovieDetail;
  late MockGetMovieRecommendations mockGetMovieRecommendations;
  late MockGetWatchListStatus mockGetWatchListStatus;
  late MockSaveWatchlist mockSaveWatchlist;
  late MockRemoveWatchlist mockRemoveWatchlist;
  late MovieDetailBloc movieDetailBloc;

  setUp(() {
    mockGetMovieDetail = MockGetMovieDetail();
    mockGetMovieRecommendations = MockGetMovieRecommendations();
    mockGetWatchListStatus = MockGetWatchListStatus();
    mockSaveWatchlist = MockSaveWatchlist();
    mockRemoveWatchlist = MockRemoveWatchlist();
    movieDetailBloc = MovieDetailBloc(
      getMovieDetail: mockGetMovieDetail,
      getMovieRecommendations: mockGetMovieRecommendations,
      getWatchListStatus: mockGetWatchListStatus,
      saveWatchlist: mockSaveWatchlist,
      removeWatchlist: mockRemoveWatchlist,
    );
  });

  const tId = 1;
  final tMovie = Movie(
    adult: false,
    backdropPath: '/muth4OYamXf41G2evdrLEg8d3om.jpg',
    genreIds: [14, 28],
    id: 557,
    originalTitle: 'Spider-Man',
    overview:
        'After being bitten by a genetically altered spider, '
        'nerdy high school student Peter Parker is endowed with '
        'amazing powers to become the Amazing superhero known as Spider-Man.',
    popularity: 60.441,
    posterPath: '/rweIrveL43TaxUN0akQEaAXL6x0.jpg',
    releaseDate: '2002-05-01',
    title: 'Spider-Man',
    video: false,
    voteAverage: 7.2,
    voteCount: 13507,
  );

  final tMovieList = [tMovie];

  void arrangeUsecase() {
    when(
      mockGetMovieDetail.execute(tId),
    ).thenAnswer((_) async => Right(testMovieDetail));
    when(
      mockGetMovieRecommendations.execute(tId),
    ).thenAnswer((_) async => Right(tMovieList));
  }

  test('initial state should be empty', () {
    expect(movieDetailBloc.state, MovieDetailState());
  });

  blocTest<MovieDetailBloc, MovieDetailState>(
    'Should emit [Loading, Loaded] when data is gotten successfully',
    build: () {
      arrangeUsecase();
      return movieDetailBloc;
    },
    act: (bloc) => bloc.add(const MovieDetailEvent.fetchMovieDetail(tId)),
    expect: () => [
      MovieDetailState(movieState: RequestState.Loading),
      MovieDetailState(
        movieState: RequestState.Loaded,
        movieDetail: testMovieDetail,
        recommendationState: RequestState.Loaded,
        movieRecommendations: tMovieList,
      ),
    ],
    verify: (bloc) {
      verify(mockGetMovieDetail.execute(tId));
      verify(mockGetMovieRecommendations.execute(tId));
    },
  );

  blocTest<MovieDetailBloc, MovieDetailState>(
    'Should emit [Loading, Error] when get detail data is unsuccessful',
    build: () {
      when(
        mockGetMovieDetail.execute(tId),
      ).thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      when(
        mockGetMovieRecommendations.execute(tId),
      ).thenAnswer((_) async => Right(tMovieList));
      return movieDetailBloc;
    },
    act: (bloc) => bloc.add(const MovieDetailEvent.fetchMovieDetail(tId)),
    expect: () => [
      MovieDetailState(movieState: RequestState.Loading),
      MovieDetailState(
        movieState: RequestState.Error,
        message: 'Server Failure',
      ),
    ],
    verify: (bloc) {
      verify(mockGetMovieDetail.execute(tId));
    },
  );

  blocTest<MovieDetailBloc, MovieDetailState>(
    'Should emit [Loading, Loaded, Error] when '
    'get recommendation data is unsuccessful',
    build: () {
      when(
        mockGetMovieDetail.execute(tId),
      ).thenAnswer((_) async => Right(testMovieDetail));
      when(
        mockGetMovieRecommendations.execute(tId),
      ).thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      return movieDetailBloc;
    },
    act: (bloc) => bloc.add(const MovieDetailEvent.fetchMovieDetail(tId)),
    expect: () => [
      MovieDetailState(movieState: RequestState.Loading),
      MovieDetailState(
        movieState: RequestState.Loaded,
        movieDetail: testMovieDetail,
        recommendationState: RequestState.Error,
        message: 'Server Failure',
      ),
    ],
    verify: (bloc) {
      verify(mockGetMovieDetail.execute(tId));
      verify(mockGetMovieRecommendations.execute(tId));
    },
  );

  blocTest<MovieDetailBloc, MovieDetailState>(
    'Should emit [Watchlist Added] when add to watchlist is successful',
    build: () {
      when(
        mockSaveWatchlist.execute(testMovieDetail),
      ).thenAnswer((_) async => const Right('Added to Watchlist'));
      when(
        mockGetWatchListStatus.execute(testMovieDetail.id),
      ).thenAnswer((_) async => true);
      return movieDetailBloc;
    },
    act: (bloc) => bloc.add(MovieDetailEvent.addWatchlist(testMovieDetail)),
    expect: () => [
      MovieDetailState(
        watchlistMessage: 'Added to Watchlist',
        isAddedToWatchlist: true,
      ),
    ],
    verify: (bloc) {
      verify(mockSaveWatchlist.execute(testMovieDetail));
      verify(mockGetWatchListStatus.execute(testMovieDetail.id));
    },
  );

  blocTest<MovieDetailBloc, MovieDetailState>(
    'Should emit [Watchlist Error] when add to watchlist is unsuccessful',
    build: () {
      when(
        mockSaveWatchlist.execute(testMovieDetail),
      ).thenAnswer((_) async => Left(DatabaseFailure('Database Failure')));
      when(
        mockGetWatchListStatus.execute(testMovieDetail.id),
      ).thenAnswer((_) async => false);
      return movieDetailBloc;
    },
    act: (bloc) => bloc.add(MovieDetailEvent.addWatchlist(testMovieDetail)),
    expect: () => [
      MovieDetailState(
        watchlistMessage: 'Database Failure',
        isAddedToWatchlist: false,
      ),
    ],
    verify: (bloc) {
      verify(mockSaveWatchlist.execute(testMovieDetail));
      verify(mockGetWatchListStatus.execute(testMovieDetail.id));
    },
  );

  blocTest<MovieDetailBloc, MovieDetailState>(
    'Should emit [Watchlist Removed] when remove from watchlist is successful',
    build: () {
      when(
        mockRemoveWatchlist.execute(testMovieDetail),
      ).thenAnswer((_) async => const Right('Removed from Watchlist'));
      when(
        mockGetWatchListStatus.execute(testMovieDetail.id),
      ).thenAnswer((_) async => false);
      return movieDetailBloc;
    },
    act: (bloc) =>
        bloc.add(MovieDetailEvent.removeFromWatchlist(testMovieDetail)),
    expect: () => [
      MovieDetailState(
        watchlistMessage: 'Removed from Watchlist',
        isAddedToWatchlist: false,
      ),
    ],
    verify: (bloc) {
      verify(mockRemoveWatchlist.execute(testMovieDetail));
      verify(mockGetWatchListStatus.execute(testMovieDetail.id));
    },
  );

  blocTest<MovieDetailBloc, MovieDetailState>(
    'Should emit [Watchlist Error] when remove from watchlist is unsuccessful',
    build: () {
      when(
        mockRemoveWatchlist.execute(testMovieDetail),
      ).thenAnswer((_) async => Left(DatabaseFailure('Database Failure')));
      when(
        mockGetWatchListStatus.execute(testMovieDetail.id),
      ).thenAnswer((_) async => true);
      return movieDetailBloc;
    },
    act: (bloc) =>
        bloc.add(MovieDetailEvent.removeFromWatchlist(testMovieDetail)),
    expect: () => [
      MovieDetailState(
        watchlistMessage: 'Database Failure',
        isAddedToWatchlist: true,
      ),
    ],
    verify: (bloc) {
      verify(mockRemoveWatchlist.execute(testMovieDetail));
      verify(mockGetWatchListStatus.execute(testMovieDetail.id));
    },
  );

  blocTest<MovieDetailBloc, MovieDetailState>(
    'Should emit [Watchlist Status] when get watchlist status',
    build: () {
      when(mockGetWatchListStatus.execute(tId)).thenAnswer((_) async => true);
      return movieDetailBloc;
    },
    act: (bloc) => bloc.add(const MovieDetailEvent.loadWatchlistStatus(tId)),
    expect: () => [MovieDetailState(isAddedToWatchlist: true)],
    verify: (bloc) {
      verify(mockGetWatchListStatus.execute(tId));
    },
  );
}
