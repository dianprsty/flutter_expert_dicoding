// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'popular_movie_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PopularMovieEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PopularMovieEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PopularMovieEvent()';
}


}

/// @nodoc
class $PopularMovieEventCopyWith<$Res>  {
$PopularMovieEventCopyWith(PopularMovieEvent _, $Res Function(PopularMovieEvent) __);
}


/// @nodoc


class _FetchPopularMovies implements PopularMovieEvent {
  const _FetchPopularMovies();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FetchPopularMovies);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PopularMovieEvent.fetchPopularMovies()';
}


}




/// @nodoc
mixin _$PopularMovieState {

 RequestState get requestState; List<Movie> get movies; String get message;
/// Create a copy of PopularMovieState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PopularMovieStateCopyWith<PopularMovieState> get copyWith => _$PopularMovieStateCopyWithImpl<PopularMovieState>(this as PopularMovieState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PopularMovieState&&(identical(other.requestState, requestState) || other.requestState == requestState)&&const DeepCollectionEquality().equals(other.movies, movies)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,requestState,const DeepCollectionEquality().hash(movies),message);

@override
String toString() {
  return 'PopularMovieState(requestState: $requestState, movies: $movies, message: $message)';
}


}

/// @nodoc
abstract mixin class $PopularMovieStateCopyWith<$Res>  {
  factory $PopularMovieStateCopyWith(PopularMovieState value, $Res Function(PopularMovieState) _then) = _$PopularMovieStateCopyWithImpl;
@useResult
$Res call({
 RequestState requestState, List<Movie> movies, String message
});




}
/// @nodoc
class _$PopularMovieStateCopyWithImpl<$Res>
    implements $PopularMovieStateCopyWith<$Res> {
  _$PopularMovieStateCopyWithImpl(this._self, this._then);

  final PopularMovieState _self;
  final $Res Function(PopularMovieState) _then;

/// Create a copy of PopularMovieState
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


class _PopularMovieState implements PopularMovieState {
   _PopularMovieState({this.requestState = RequestState.Empty, final  List<Movie> movies = const [], this.message = ''}): _movies = movies;
  

@override@JsonKey() final  RequestState requestState;
 final  List<Movie> _movies;
@override@JsonKey() List<Movie> get movies {
  if (_movies is EqualUnmodifiableListView) return _movies;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_movies);
}

@override@JsonKey() final  String message;

/// Create a copy of PopularMovieState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PopularMovieStateCopyWith<_PopularMovieState> get copyWith => __$PopularMovieStateCopyWithImpl<_PopularMovieState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PopularMovieState&&(identical(other.requestState, requestState) || other.requestState == requestState)&&const DeepCollectionEquality().equals(other._movies, _movies)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,requestState,const DeepCollectionEquality().hash(_movies),message);

@override
String toString() {
  return 'PopularMovieState(requestState: $requestState, movies: $movies, message: $message)';
}


}

/// @nodoc
abstract mixin class _$PopularMovieStateCopyWith<$Res> implements $PopularMovieStateCopyWith<$Res> {
  factory _$PopularMovieStateCopyWith(_PopularMovieState value, $Res Function(_PopularMovieState) _then) = __$PopularMovieStateCopyWithImpl;
@override @useResult
$Res call({
 RequestState requestState, List<Movie> movies, String message
});




}
/// @nodoc
class __$PopularMovieStateCopyWithImpl<$Res>
    implements _$PopularMovieStateCopyWith<$Res> {
  __$PopularMovieStateCopyWithImpl(this._self, this._then);

  final _PopularMovieState _self;
  final $Res Function(_PopularMovieState) _then;

/// Create a copy of PopularMovieState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? requestState = null,Object? movies = null,Object? message = null,}) {
  return _then(_PopularMovieState(
requestState: null == requestState ? _self.requestState : requestState // ignore: cast_nullable_to_non_nullable
as RequestState,movies: null == movies ? _self._movies : movies // ignore: cast_nullable_to_non_nullable
as List<Movie>,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
