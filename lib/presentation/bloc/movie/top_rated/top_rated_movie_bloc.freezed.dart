// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'top_rated_movie_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TopRatedMovieEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TopRatedMovieEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TopRatedMovieEvent()';
}


}

/// @nodoc
class $TopRatedMovieEventCopyWith<$Res>  {
$TopRatedMovieEventCopyWith(TopRatedMovieEvent _, $Res Function(TopRatedMovieEvent) __);
}


/// @nodoc


class _FetchTopRatedMovies implements TopRatedMovieEvent {
  const _FetchTopRatedMovies();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FetchTopRatedMovies);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TopRatedMovieEvent.fetchTopRatedMovies()';
}


}




/// @nodoc
mixin _$TopRatedMovieState {

 RequestState get requestState; List<Movie> get movies; String get message;
/// Create a copy of TopRatedMovieState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TopRatedMovieStateCopyWith<TopRatedMovieState> get copyWith => _$TopRatedMovieStateCopyWithImpl<TopRatedMovieState>(this as TopRatedMovieState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TopRatedMovieState&&(identical(other.requestState, requestState) || other.requestState == requestState)&&const DeepCollectionEquality().equals(other.movies, movies)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,requestState,const DeepCollectionEquality().hash(movies),message);

@override
String toString() {
  return 'TopRatedMovieState(requestState: $requestState, movies: $movies, message: $message)';
}


}

/// @nodoc
abstract mixin class $TopRatedMovieStateCopyWith<$Res>  {
  factory $TopRatedMovieStateCopyWith(TopRatedMovieState value, $Res Function(TopRatedMovieState) _then) = _$TopRatedMovieStateCopyWithImpl;
@useResult
$Res call({
 RequestState requestState, List<Movie> movies, String message
});




}
/// @nodoc
class _$TopRatedMovieStateCopyWithImpl<$Res>
    implements $TopRatedMovieStateCopyWith<$Res> {
  _$TopRatedMovieStateCopyWithImpl(this._self, this._then);

  final TopRatedMovieState _self;
  final $Res Function(TopRatedMovieState) _then;

/// Create a copy of TopRatedMovieState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? requestState = null,Object? movies = null,Object? message = null,}) {
  return _then(_self.copyWith(
requestState: null == requestState ? _self.requestState : requestState // ignore: cast_nullable_to_non_nullable
as RequestState,movies: null == movies ? _self.movies : movies // ignore: cast_nullable_to_non_nullable
as List<Movie>,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc


class _TopRatedMovieState implements TopRatedMovieState {
   _TopRatedMovieState({this.requestState = RequestState.Empty, final  List<Movie> movies = const [], this.message = ''}): _movies = movies;
  

@override@JsonKey() final  RequestState requestState;
 final  List<Movie> _movies;
@override@JsonKey() List<Movie> get movies {
  if (_movies is EqualUnmodifiableListView) return _movies;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_movies);
}

@override@JsonKey() final  String message;

/// Create a copy of TopRatedMovieState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TopRatedMovieStateCopyWith<_TopRatedMovieState> get copyWith => __$TopRatedMovieStateCopyWithImpl<_TopRatedMovieState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TopRatedMovieState&&(identical(other.requestState, requestState) || other.requestState == requestState)&&const DeepCollectionEquality().equals(other._movies, _movies)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,requestState,const DeepCollectionEquality().hash(_movies),message);

@override
String toString() {
  return 'TopRatedMovieState(requestState: $requestState, movies: $movies, message: $message)';
}


}

/// @nodoc
abstract mixin class _$TopRatedMovieStateCopyWith<$Res> implements $TopRatedMovieStateCopyWith<$Res> {
  factory _$TopRatedMovieStateCopyWith(_TopRatedMovieState value, $Res Function(_TopRatedMovieState) _then) = __$TopRatedMovieStateCopyWithImpl;
@override @useResult
$Res call({
 RequestState requestState, List<Movie> movies, String message
});




}
/// @nodoc
class __$TopRatedMovieStateCopyWithImpl<$Res>
    implements _$TopRatedMovieStateCopyWith<$Res> {
  __$TopRatedMovieStateCopyWithImpl(this._self, this._then);

  final _TopRatedMovieState _self;
  final $Res Function(_TopRatedMovieState) _then;

/// Create a copy of TopRatedMovieState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? requestState = null,Object? movies = null,Object? message = null,}) {
  return _then(_TopRatedMovieState(
requestState: null == requestState ? _self.requestState : requestState // ignore: cast_nullable_to_non_nullable
as RequestState,movies: null == movies ? _self._movies : movies // ignore: cast_nullable_to_non_nullable
as List<Movie>,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
