import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/entities/movie.dart';
import 'package:ditonton/domain/usecases/movies/get_now_playing_movies.dart';
import 'package:ditonton/domain/usecases/movies/get_popular_movies.dart';
import 'package:ditonton/domain/usecases/movies/get_top_rated_movies.dart';
import 'package:ditonton/presentation/bloc/movie/home/home_movie_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'home_movie_bloc_test.mocks.dart';

@GenerateMocks([GetNowPlayingMovies, GetPopularMovies, GetTopRatedMovies])
void main() {
  late MockGetNowPlayingMovies mockGetNowPlayingMovies;
  late MockGetPopularMovies mockGetPopularMovies;
  late MockGetTopRatedMovies mockGetTopRatedMovies;
  late HomeMovieBloc homeMovieBloc;

  setUp(() {
    mockGetNowPlayingMovies = MockGetNowPlayingMovies();
    mockGetPopularMovies = MockGetPopularMovies();
    mockGetTopRatedMovies = MockGetTopRatedMovies();
    homeMovieBloc = HomeMovieBloc(
      getNowPlayingMovies: mockGetNowPlayingMovies,
      getPopularMovies: mockGetPopularMovies,
      getTopRatedMovies: mockGetTopRatedMovies,
    );
  });

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

  group('Now Playing Movies', () {
    test('initial state should be empty', () {
      expect(homeMovieBloc.state, HomeMovieState());
    });

    blocTest<HomeMovieBloc, HomeMovieState>(
      'Should emit [Loading, Loaded] when data is gotten successfully',
      build: () {
        when(
          mockGetNowPlayingMovies.execute(),
        ).thenAnswer((_) async => Right(tMovieList));
        return homeMovieBloc;
      },
      act: (bloc) => bloc.add(const HomeMovieEvent.fetchNowPlayingMovies()),
      expect: () => [
        HomeMovieState(nowPlayingState: RequestState.Loading),
        HomeMovieState(
          nowPlayingState: RequestState.Loaded,
          nowPlayingMovies: tMovieList,
        ),
      ],
      verify: (bloc) {
        verify(mockGetNowPlayingMovies.execute());
      },
    );

    blocTest<HomeMovieBloc, HomeMovieState>(
      'Should emit [Loading, Error] when get data is unsuccessful',
      build: () {
        when(
          mockGetNowPlayingMovies.execute(),
        ).thenAnswer((_) async => Left(ServerFailure('Server Failure')));
        return homeMovieBloc;
      },
      act: (bloc) => bloc.add(const HomeMovieEvent.fetchNowPlayingMovies()),
      expect: () => [
        HomeMovieState(nowPlayingState: RequestState.Loading),
        HomeMovieState(
          nowPlayingState: RequestState.Error,
          message: 'Server Failure',
        ),
      ],
      verify: (bloc) {
        verify(mockGetNowPlayingMovies.execute());
      },
    );
  });

  group('Popular Movies', () {
    blocTest<HomeMovieBloc, HomeMovieState>(
      'Should emit [Loading, Loaded] when data is gotten successfully',
      build: () {
        when(
          mockGetPopularMovies.execute(),
        ).thenAnswer((_) async => Right(tMovieList));
        return homeMovieBloc;
      },
      act: (bloc) => bloc.add(const HomeMovieEvent.fetchPopularMovies()),
      expect: () => [
        HomeMovieState(popularState: RequestState.Loading),
        HomeMovieState(
          popularState: RequestState.Loaded,
          popularMovies: tMovieList,
        ),
      ],
      verify: (bloc) {
        verify(mockGetPopularMovies.execute());
      },
    );

    blocTest<HomeMovieBloc, HomeMovieState>(
      'Should emit [Loading, Error] when get data is unsuccessful',
      build: () {
        when(
          mockGetPopularMovies.execute(),
        ).thenAnswer((_) async => Left(ServerFailure('Server Failure')));
        return homeMovieBloc;
      },
      act: (bloc) => bloc.add(const HomeMovieEvent.fetchPopularMovies()),
      expect: () => [
        HomeMovieState(popularState: RequestState.Loading),
        HomeMovieState(
          popularState: RequestState.Error,
          message: 'Server Failure',
        ),
      ],
      verify: (bloc) {
        verify(mockGetPopularMovies.execute());
      },
    );
  });

  group('Top Rated Movies', () {
    blocTest<HomeMovieBloc, HomeMovieState>(
      'Should emit [Loading, Loaded] when data is gotten successfully',
      build: () {
        when(
          mockGetTopRatedMovies.execute(),
        ).thenAnswer((_) async => Right(tMovieList));
        return homeMovieBloc;
      },
      act: (bloc) => bloc.add(const HomeMovieEvent.fetchTopRatedMovies()),
      expect: () => [
        HomeMovieState(topRatedState: RequestState.Loading),
        HomeMovieState(
          topRatedState: RequestState.Loaded,
          topRatedMovies: tMovieList,
        ),
      ],
      verify: (bloc) {
        verify(mockGetTopRatedMovies.execute());
      },
    );

    blocTest<HomeMovieBloc, HomeMovieState>(
      'Should emit [Loading, Error] when get data is unsuccessful',
      build: () {
        when(
          mockGetTopRatedMovies.execute(),
        ).thenAnswer((_) async => Left(ServerFailure('Server Failure')));
        return homeMovieBloc;
      },
      act: (bloc) => bloc.add(const HomeMovieEvent.fetchTopRatedMovies()),
      expect: () => [
        HomeMovieState(topRatedState: RequestState.Loading),
        HomeMovieState(
          topRatedState: RequestState.Error,
          message: 'Server Failure',
        ),
      ],
      verify: (bloc) {
        verify(mockGetTopRatedMovies.execute());
      },
    );
  });
}
