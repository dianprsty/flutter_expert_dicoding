// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movie_detail_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MovieDetailEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MovieDetailEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MovieDetailEvent()';
}


}

/// @nodoc
class $MovieDetailEventCopyWith<$Res>  {
$MovieDetailEventCopyWith(MovieDetailEvent _, $Res Function(MovieDetailEvent) __);
}


/// @nodoc


class _FetchMovieDetail implements MovieDetailEvent {
  const _FetchMovieDetail(this.id);
  

 final  int id;

/// Create a copy of MovieDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FetchMovieDetailCopyWith<_FetchMovieDetail> get copyWith => __$FetchMovieDetailCopyWithImpl<_FetchMovieDetail>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FetchMovieDetail&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'MovieDetailEvent.fetchMovieDetail(id: $id)';
}


}

/// @nodoc
abstract mixin class _$FetchMovieDetailCopyWith<$Res> implements $MovieDetailEventCopyWith<$Res> {
  factory _$FetchMovieDetailCopyWith(_FetchMovieDetail value, $Res Function(_FetchMovieDetail) _then) = __$FetchMovieDetailCopyWithImpl;
@useResult
$Res call({
 int id
});




}
/// @nodoc
class __$FetchMovieDetailCopyWithImpl<$Res>
    implements _$FetchMovieDetailCopyWith<$Res> {
  __$FetchMovieDetailCopyWithImpl(this._self, this._then);

  final _FetchMovieDetail _self;
  final $Res Function(_FetchMovieDetail) _then;

/// Create a copy of MovieDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(_FetchMovieDetail(
null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _AddWatchlist implements MovieDetailEvent {
  const _AddWatchlist(this.movie);
  

 final  MovieDetail movie;

/// Create a copy of MovieDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddWatchlistCopyWith<_AddWatchlist> get copyWith => __$AddWatchlistCopyWithImpl<_AddWatchlist>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddWatchlist&&(identical(other.movie, movie) || other.movie == movie));
}


@override
int get hashCode => Object.hash(runtimeType,movie);

@override
String toString() {
  return 'MovieDetailEvent.addWatchlist(movie: $movie)';
}


}

/// @nodoc
abstract mixin class _$AddWatchlistCopyWith<$Res> implements $MovieDetailEventCopyWith<$Res> {
  factory _$AddWatchlistCopyWith(_AddWatchlist value, $Res Function(_AddWatchlist) _then) = __$AddWatchlistCopyWithImpl;
@useResult
$Res call({
 MovieDetail movie
});




}
/// @nodoc
class __$AddWatchlistCopyWithImpl<$Res>
    implements _$AddWatchlistCopyWith<$Res> {
  __$AddWatchlistCopyWithImpl(this._self, this._then);

  final _AddWatchlist _self;
  final $Res Function(_AddWatchlist) _then;

/// Create a copy of MovieDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? movie = null,}) {
  return _then(_AddWatchlist(
null == movie ? _self.movie : movie // ignore: cast_nullable_to_non_nullable
as MovieDetail,
  ));
}


}

/// @nodoc


class _RemoveFromWatchlist implements MovieDetailEvent {
  const _RemoveFromWatchlist(this.movie);
  

 final  MovieDetail movie;

/// Create a copy of MovieDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RemoveFromWatchlistCopyWith<_RemoveFromWatchlist> get copyWith => __$RemoveFromWatchlistCopyWithImpl<_RemoveFromWatchlist>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RemoveFromWatchlist&&(identical(other.movie, movie) || other.movie == movie));
}


@override
int get hashCode => Object.hash(runtimeType,movie);

@override
String toString() {
  return 'MovieDetailEvent.removeFromWatchlist(movie: $movie)';
}


}

/// @nodoc
abstract mixin class _$RemoveFromWatchlistCopyWith<$Res> implements $MovieDetailEventCopyWith<$Res> {
  factory _$RemoveFromWatchlistCopyWith(_RemoveFromWatchlist value, $Res Function(_RemoveFromWatchlist) _then) = __$RemoveFromWatchlistCopyWithImpl;
@useResult
$Res call({
 MovieDetail movie
});




}
/// @nodoc
class __$RemoveFromWatchlistCopyWithImpl<$Res>
    implements _$RemoveFromWatchlistCopyWith<$Res> {
  __$RemoveFromWatchlistCopyWithImpl(this._self, this._then);

  final _RemoveFromWatchlist _self;
  final $Res Function(_RemoveFromWatchlist) _then;

/// Create a copy of MovieDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? movie = null,}) {
  return _then(_RemoveFromWatchlist(
null == movie ? _self.movie : movie // ignore: cast_nullable_to_non_nullable
as MovieDetail,
  ));
}


}

/// @nodoc


class _LoadWatchlistStatus implements MovieDetailEvent {
  const _LoadWatchlistStatus(this.id);
  

 final  int id;

/// Create a copy of MovieDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadWatchlistStatusCopyWith<_LoadWatchlistStatus> get copyWith => __$LoadWatchlistStatusCopyWithImpl<_LoadWatchlistStatus>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadWatchlistStatus&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'MovieDetailEvent.loadWatchlistStatus(id: $id)';
}


}

/// @nodoc
abstract mixin class _$LoadWatchlistStatusCopyWith<$Res> implements $MovieDetailEventCopyWith<$Res> {
  factory _$LoadWatchlistStatusCopyWith(_LoadWatchlistStatus value, $Res Function(_LoadWatchlistStatus) _then) = __$LoadWatchlistStatusCopyWithImpl;
@useResult
$Res call({
 int id
});




}
/// @nodoc
class __$LoadWatchlistStatusCopyWithImpl<$Res>
    implements _$LoadWatchlistStatusCopyWith<$Res> {
  __$LoadWatchlistStatusCopyWithImpl(this._self, this._then);

  final _LoadWatchlistStatus _self;
  final $Res Function(_LoadWatchlistStatus) _then;

/// Create a copy of MovieDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(_LoadWatchlistStatus(
null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$MovieDetailState {

 RequestState get movieState; MovieDetail? get movieDetail; RequestState get recommendationState; List<Movie> get movieRecommendations; bool get isAddedToWatchlist; String get message; String get watchlistMessage;
/// Create a copy of MovieDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MovieDetailStateCopyWith<MovieDetailState> get copyWith => _$MovieDetailStateCopyWithImpl<MovieDetailState>(this as MovieDetailState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MovieDetailState&&(identical(other.movieState, movieState) || other.movieState == movieState)&&(identical(other.movieDetail, movieDetail) || other.movieDetail == movieDetail)&&(identical(other.recommendationState, recommendationState) || other.recommendationState == recommendationState)&&const DeepCollectionEquality().equals(other.movieRecommendations, movieRecommendations)&&(identical(other.isAddedToWatchlist, isAddedToWatchlist) || other.isAddedToWatchlist == isAddedToWatchlist)&&(identical(other.message, message) || other.message == message)&&(identical(other.watchlistMessage, watchlistMessage) || other.watchlistMessage == watchlistMessage));
}


@override
int get hashCode => Object.hash(runtimeType,movieState,movieDetail,recommendationState,const DeepCollectionEquality().hash(movieRecommendations),isAddedToWatchlist,message,watchlistMessage);

@override
String toString() {
  return 'MovieDetailState(movieState: $movieState, movieDetail: $movieDetail, recommendationState: $recommendationState, movieRecommendations: $movieRecommendations, isAddedToWatchlist: $isAddedToWatchlist, message: $message, watchlistMessage: $watchlistMessage)';
}


}

/// @nodoc
abstract mixin class $MovieDetailStateCopyWith<$Res>  {
  factory $MovieDetailStateCopyWith(MovieDetailState value, $Res Function(MovieDetailState) _then) = _$MovieDetailStateCopyWithImpl;
@useResult
$Res call({
 RequestState movieState, MovieDetail? movieDetail, RequestState recommendationState, List<Movie> movieRecommendations, bool isAddedToWatchlist, String message, String watchlistMessage
});




}
/// @nodoc
class _$MovieDetailStateCopyWithImpl<$Res>
    implements $MovieDetailStateCopyWith<$Res> {
  _$MovieDetailStateCopyWithImpl(this._self, this._then);

  final MovieDetailState _self;
  final $Res Function(MovieDetailState) _then;

/// Create a copy of MovieDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? movieState = null,Object? movieDetail = freezed,Object? recommendationState = null,Object? movieRecommendations = null,Object? isAddedToWatchlist = null,Object? message = null,Object? watchlistMessage = null,}) {
  return _then(_self.copyWith(
movieState: null == movieState ? _self.movieState : movieState // ignore: cast_nullable_to_non_nullable
as RequestState,movieDetail: freezed == movieDetail ? _self.movieDetail : movieDetail // ignore: cast_nullable_to_non_nullable
as MovieDetail?,recommendationState: null == recommendationState ? _self.recommendationState : recommendationState // ignore: cast_nullable_to_non_nullable
as RequestState,movieRecommendations: null == movieRecommendations ? _self.movieRecommendations : movieRecommendations // ignore: cast_nullable_to_non_nullable
as List<Movie>,isAddedToWatchlist: null == isAddedToWatchlist ? _self.isAddedToWatchlist : isAddedToWatchlist // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,watchlistMessage: null == watchlistMessage ? _self.watchlistMessage : watchlistMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc


class _MovieDetailState implements MovieDetailState {
   _MovieDetailState({this.movieState = RequestState.Empty, this.movieDetail = null, this.recommendationState = RequestState.Empty, final  List<Movie> movieRecommendations = const [], this.isAddedToWatchlist = false, this.message = '', this.watchlistMessage = ''}): _movieRecommendations = movieRecommendations;
  

@override@JsonKey() final  RequestState movieState;
@override@JsonKey() final  MovieDetail? movieDetail;
@override@JsonKey() final  RequestState recommendationState;
 final  List<Movie> _movieRecommendations;
@override@JsonKey() List<Movie> get movieRecommendations {
  if (_movieRecommendations is EqualUnmodifiableListView) return _movieRecommendations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_movieRecommendations);
}

@override@JsonKey() final  bool isAddedToWatchlist;
@override@JsonKey() final  String message;
@override@JsonKey() final  String watchlistMessage;

/// Create a copy of MovieDetailState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MovieDetailStateCopyWith<_MovieDetailState> get copyWith => __$MovieDetailStateCopyWithImpl<_MovieDetailState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MovieDetailState&&(identical(other.movieState, movieState) || other.movieState == movieState)&&(identical(other.movieDetail, movieDetail) || other.movieDetail == movieDetail)&&(identical(other.recommendationState, recommendationState) || other.recommendationState == recommendationState)&&const DeepCollectionEquality().equals(other._movieRecommendations, _movieRecommendations)&&(identical(other.isAddedToWatchlist, isAddedToWatchlist) || other.isAddedToWatchlist == isAddedToWatchlist)&&(identical(other.message, message) || other.message == message)&&(identical(other.watchlistMessage, watchlistMessage) || other.watchlistMessage == watchlistMessage));
}


@override
int get hashCode => Object.hash(runtimeType,movieState,movieDetail,recommendationState,const DeepCollectionEquality().hash(_movieRecommendations),isAddedToWatchlist,message,watchlistMessage);

@override
String toString() {
  return 'MovieDetailState(movieState: $movieState, movieDetail: $movieDetail, recommendationState: $recommendationState, movieRecommendations: $movieRecommendations, isAddedToWatchlist: $isAddedToWatchlist, message: $message, watchlistMessage: $watchlistMessage)';
}


}

/// @nodoc
abstract mixin class _$MovieDetailStateCopyWith<$Res> implements $MovieDetailStateCopyWith<$Res> {
  factory _$MovieDetailStateCopyWith(_MovieDetailState value, $Res Function(_MovieDetailState) _then) = __$MovieDetailStateCopyWithImpl;
@override @useResult
$Res call({
 RequestState movieState, MovieDetail? movieDetail, RequestState recommendationState, List<Movie> movieRecommendations, bool isAddedToWatchlist, String message, String watchlistMessage
});




}
/// @nodoc
class __$MovieDetailStateCopyWithImpl<$Res>
    implements _$MovieDetailStateCopyWith<$Res> {
  __$MovieDetailStateCopyWithImpl(this._self, this._then);

  final _MovieDetailState _self;
  final $Res Function(_MovieDetailState) _then;

/// Create a copy of MovieDetailState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? movieState = null,Object? movieDetail = freezed,Object? recommendationState = null,Object? movieRecommendations = null,Object? isAddedToWatchlist = null,Object? message = null,Object? watchlistMessage = null,}) {
  return _then(_MovieDetailState(
movieState: null == movieState ? _self.movieState : movieState // ignore: cast_nullable_to_non_nullable
as RequestState,movieDetail: freezed == movieDetail ? _self.movieDetail : movieDetail // ignore: cast_nullable_to_non_nullable
as MovieDetail?,recommendationState: null == recommendationState ? _self.recommendationState : recommendationState // ignore: cast_nullable_to_non_nullable
as RequestState,movieRecommendations: null == movieRecommendations ? _self._movieRecommendations : movieRecommendations // ignore: cast_nullable_to_non_nullable
as List<Movie>,isAddedToWatchlist: null == isAddedToWatchlist ? _self.isAddedToWatchlist : isAddedToWatchlist // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,watchlistMessage: null == watchlistMessage ? _self.watchlistMessage : watchlistMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
