// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'watchlist_movie_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WatchlistMovieEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WatchlistMovieEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WatchlistMovieEvent()';
}


}

/// @nodoc
class $WatchlistMovieEventCopyWith<$Res>  {
$WatchlistMovieEventCopyWith(WatchlistMovieEvent _, $Res Function(WatchlistMovieEvent) __);
}


/// @nodoc


class _FetchWatchlistMovies implements WatchlistMovieEvent {
  const _FetchWatchlistMovies();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FetchWatchlistMovies);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WatchlistMovieEvent.fetchWatchlistMovies()';
}


}




/// @nodoc
mixin _$WatchlistMovieState {

 RequestState get requestState; List<Movie> get watchlistMovies; String get message;
/// Create a copy of WatchlistMovieState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WatchlistMovieStateCopyWith<WatchlistMovieState> get copyWith => _$WatchlistMovieStateCopyWithImpl<WatchlistMovieState>(this as WatchlistMovieState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WatchlistMovieState&&(identical(other.requestState, requestState) || other.requestState == requestState)&&const DeepCollectionEquality().equals(other.watchlistMovies, watchlistMovies)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,requestState,const DeepCollectionEquality().hash(watchlistMovies),message);

@override
String toString() {
  return 'WatchlistMovieState(requestState: $requestState, watchlistMovies: $watchlistMovies, message: $message)';
}


}

/// @nodoc
abstract mixin class $WatchlistMovieStateCopyWith<$Res>  {
  factory $WatchlistMovieStateCopyWith(WatchlistMovieState value, $Res Function(WatchlistMovieState) _then) = _$WatchlistMovieStateCopyWithImpl;
@useResult
$Res call({
 RequestState requestState, List<Movie> watchlistMovies, String message
});




}
/// @nodoc
class _$WatchlistMovieStateCopyWithImpl<$Res>
    implements $WatchlistMovieStateCopyWith<$Res> {
  _$WatchlistMovieStateCopyWithImpl(this._self, this._then);

  final WatchlistMovieState _self;
  final $Res Function(WatchlistMovieState) _then;

/// Create a copy of WatchlistMovieState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? requestState = null,Object? watchlistMovies = null,Object? message = null,}) {
  return _then(_self.copyWith(
requestState: null == requestState ? _self.requestState : requestState // ignore: cast_nullable_to_non_nullable
as RequestState,watchlistMovies: null == watchlistMovies ? _self.watchlistMovies : watchlistMovies // ignore: cast_nullable_to_non_nullable
as List<Movie>,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc


class _WatchlistMovieState implements WatchlistMovieState {
  const _WatchlistMovieState({this.requestState = RequestState.Empty, final  List<Movie> watchlistMovies = const [], this.message = ''}): _watchlistMovies = watchlistMovies;
  

@override@JsonKey() final  RequestState requestState;
 final  List<Movie> _watchlistMovies;
@override@JsonKey() List<Movie> get watchlistMovies {
  if (_watchlistMovies is EqualUnmodifiableListView) return _watchlistMovies;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_watchlistMovies);
}

@override@JsonKey() final  String message;

/// Create a copy of WatchlistMovieState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WatchlistMovieStateCopyWith<_WatchlistMovieState> get copyWith => __$WatchlistMovieStateCopyWithImpl<_WatchlistMovieState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WatchlistMovieState&&(identical(other.requestState, requestState) || other.requestState == requestState)&&const DeepCollectionEquality().equals(other._watchlistMovies, _watchlistMovies)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,requestState,const DeepCollectionEquality().hash(_watchlistMovies),message);

@override
String toString() {
  return 'WatchlistMovieState(requestState: $requestState, watchlistMovies: $watchlistMovies, message: $message)';
}


}

/// @nodoc
abstract mixin class _$WatchlistMovieStateCopyWith<$Res> implements $WatchlistMovieStateCopyWith<$Res> {
  factory _$WatchlistMovieStateCopyWith(_WatchlistMovieState value, $Res Function(_WatchlistMovieState) _then) = __$WatchlistMovieStateCopyWithImpl;
@override @useResult
$Res call({
 RequestState requestState, List<Movie> watchlistMovies, String message
});




}
/// @nodoc
class __$WatchlistMovieStateCopyWithImpl<$Res>
    implements _$WatchlistMovieStateCopyWith<$Res> {
  __$WatchlistMovieStateCopyWithImpl(this._self, this._then);

  final _WatchlistMovieState _self;
  final $Res Function(_WatchlistMovieState) _then;

/// Create a copy of WatchlistMovieState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? requestState = null,Object? watchlistMovies = null,Object? message = null,}) {
  return _then(_WatchlistMovieState(
requestState: null == requestState ? _self.requestState : requestState // ignore: cast_nullable_to_non_nullable
as RequestState,watchlistMovies: null == watchlistMovies ? _self._watchlistMovies : watchlistMovies // ignore: cast_nullable_to_non_nullable
as List<Movie>,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
