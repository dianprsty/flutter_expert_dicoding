// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_movie_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HomeMovieEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeMovieEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeMovieEvent()';
}


}

/// @nodoc
class $HomeMovieEventCopyWith<$Res>  {
$HomeMovieEventCopyWith(HomeMovieEvent _, $Res Function(HomeMovieEvent) __);
}


/// @nodoc


class _FetchNowPlayingMovies implements HomeMovieEvent {
  const _FetchNowPlayingMovies();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FetchNowPlayingMovies);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeMovieEvent.fetchNowPlayingMovies()';
}


}




/// @nodoc


class _FetchPopularMovies implements HomeMovieEvent {
  const _FetchPopularMovies();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FetchPopularMovies);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeMovieEvent.fetchPopularMovies()';
}


}




/// @nodoc


class _FetchTopRatedMovies implements HomeMovieEvent {
  const _FetchTopRatedMovies();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FetchTopRatedMovies);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeMovieEvent.fetchTopRatedMovies()';
}


}




/// @nodoc
mixin _$HomeMovieState {

 RequestState get nowPlayingState; List<Movie> get nowPlayingMovies; RequestState get popularState; List<Movie> get popularMovies; RequestState get topRatedState; List<Movie> get topRatedMovies; String get message;
/// Create a copy of HomeMovieState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeMovieStateCopyWith<HomeMovieState> get copyWith => _$HomeMovieStateCopyWithImpl<HomeMovieState>(this as HomeMovieState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeMovieState&&(identical(other.nowPlayingState, nowPlayingState) || other.nowPlayingState == nowPlayingState)&&const DeepCollectionEquality().equals(other.nowPlayingMovies, nowPlayingMovies)&&(identical(other.popularState, popularState) || other.popularState == popularState)&&const DeepCollectionEquality().equals(other.popularMovies, popularMovies)&&(identical(other.topRatedState, topRatedState) || other.topRatedState == topRatedState)&&const DeepCollectionEquality().equals(other.topRatedMovies, topRatedMovies)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,nowPlayingState,const DeepCollectionEquality().hash(nowPlayingMovies),popularState,const DeepCollectionEquality().hash(popularMovies),topRatedState,const DeepCollectionEquality().hash(topRatedMovies),message);

@override
String toString() {
  return 'HomeMovieState(nowPlayingState: $nowPlayingState, nowPlayingMovies: $nowPlayingMovies, popularState: $popularState, popularMovies: $popularMovies, topRatedState: $topRatedState, topRatedMovies: $topRatedMovies, message: $message)';
}


}

/// @nodoc
abstract mixin class $HomeMovieStateCopyWith<$Res>  {
  factory $HomeMovieStateCopyWith(HomeMovieState value, $Res Function(HomeMovieState) _then) = _$HomeMovieStateCopyWithImpl;
@useResult
$Res call({
 RequestState nowPlayingState, List<Movie> nowPlayingMovies, RequestState popularState, List<Movie> popularMovies, RequestState topRatedState, List<Movie> topRatedMovies, String message
});




}
/// @nodoc
class _$HomeMovieStateCopyWithImpl<$Res>
    implements $HomeMovieStateCopyWith<$Res> {
  _$HomeMovieStateCopyWithImpl(this._self, this._then);

  final HomeMovieState _self;
  final $Res Function(HomeMovieState) _then;

/// Create a copy of HomeMovieState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? nowPlayingState = null,Object? nowPlayingMovies = null,Object? popularState = null,Object? popularMovies = null,Object? topRatedState = null,Object? topRatedMovies = null,Object? message = null,}) {
  return _then(_self.copyWith(
nowPlayingState: null == nowPlayingState ? _self.nowPlayingState : nowPlayingState // ignore: cast_nullable_to_non_nullable
as RequestState,nowPlayingMovies: null == nowPlayingMovies ? _self.nowPlayingMovies : nowPlayingMovies // ignore: cast_nullable_to_non_nullable
as List<Movie>,popularState: null == popularState ? _self.popularState : popularState // ignore: cast_nullable_to_non_nullable
as RequestState,popularMovies: null == popularMovies ? _self.popularMovies : popularMovies // ignore: cast_nullable_to_non_nullable
as List<Movie>,topRatedState: null == topRatedState ? _self.topRatedState : topRatedState // ignore: cast_nullable_to_non_nullable
as RequestState,topRatedMovies: null == topRatedMovies ? _self.topRatedMovies : topRatedMovies // ignore: cast_nullable_to_non_nullable
as List<Movie>,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc


class _HomeMovieState implements HomeMovieState {
   _HomeMovieState({this.nowPlayingState = RequestState.Empty, final  List<Movie> nowPlayingMovies = const [], this.popularState = RequestState.Empty, final  List<Movie> popularMovies = const [], this.topRatedState = RequestState.Empty, final  List<Movie> topRatedMovies = const [], this.message = ''}): _nowPlayingMovies = nowPlayingMovies,_popularMovies = popularMovies,_topRatedMovies = topRatedMovies;
  

@override@JsonKey() final  RequestState nowPlayingState;
 final  List<Movie> _nowPlayingMovies;
@override@JsonKey() List<Movie> get nowPlayingMovies {
  if (_nowPlayingMovies is EqualUnmodifiableListView) return _nowPlayingMovies;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_nowPlayingMovies);
}

@override@JsonKey() final  RequestState popularState;
 final  List<Movie> _popularMovies;
@override@JsonKey() List<Movie> get popularMovies {
  if (_popularMovies is EqualUnmodifiableListView) return _popularMovies;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_popularMovies);
}

@override@JsonKey() final  RequestState topRatedState;
 final  List<Movie> _topRatedMovies;
@override@JsonKey() List<Movie> get topRatedMovies {
  if (_topRatedMovies is EqualUnmodifiableListView) return _topRatedMovies;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_topRatedMovies);
}

@override@JsonKey() final  String message;

/// Create a copy of HomeMovieState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeMovieStateCopyWith<_HomeMovieState> get copyWith => __$HomeMovieStateCopyWithImpl<_HomeMovieState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeMovieState&&(identical(other.nowPlayingState, nowPlayingState) || other.nowPlayingState == nowPlayingState)&&const DeepCollectionEquality().equals(other._nowPlayingMovies, _nowPlayingMovies)&&(identical(other.popularState, popularState) || other.popularState == popularState)&&const DeepCollectionEquality().equals(other._popularMovies, _popularMovies)&&(identical(other.topRatedState, topRatedState) || other.topRatedState == topRatedState)&&const DeepCollectionEquality().equals(other._topRatedMovies, _topRatedMovies)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,nowPlayingState,const DeepCollectionEquality().hash(_nowPlayingMovies),popularState,const DeepCollectionEquality().hash(_popularMovies),topRatedState,const DeepCollectionEquality().hash(_topRatedMovies),message);

@override
String toString() {
  return 'HomeMovieState(nowPlayingState: $nowPlayingState, nowPlayingMovies: $nowPlayingMovies, popularState: $popularState, popularMovies: $popularMovies, topRatedState: $topRatedState, topRatedMovies: $topRatedMovies, message: $message)';
}


}

/// @nodoc
abstract mixin class _$HomeMovieStateCopyWith<$Res> implements $HomeMovieStateCopyWith<$Res> {
  factory _$HomeMovieStateCopyWith(_HomeMovieState value, $Res Function(_HomeMovieState) _then) = __$HomeMovieStateCopyWithImpl;
@override @useResult
$Res call({
 RequestState nowPlayingState, List<Movie> nowPlayingMovies, RequestState popularState, List<Movie> popularMovies, RequestState topRatedState, List<Movie> topRatedMovies, String message
});




}
/// @nodoc
class __$HomeMovieStateCopyWithImpl<$Res>
    implements _$HomeMovieStateCopyWith<$Res> {
  __$HomeMovieStateCopyWithImpl(this._self, this._then);

  final _HomeMovieState _self;
  final $Res Function(_HomeMovieState) _then;

/// Create a copy of HomeMovieState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? nowPlayingState = null,Object? nowPlayingMovies = null,Object? popularState = null,Object? popularMovies = null,Object? topRatedState = null,Object? topRatedMovies = null,Object? message = null,}) {
  return _then(_HomeMovieState(
nowPlayingState: null == nowPlayingState ? _self.nowPlayingState : nowPlayingState // ignore: cast_nullable_to_non_nullable
as RequestState,nowPlayingMovies: null == nowPlayingMovies ? _self._nowPlayingMovies : nowPlayingMovies // ignore: cast_nullable_to_non_nullable
as List<Movie>,popularState: null == popularState ? _self.popularState : popularState // ignore: cast_nullable_to_non_nullable
as RequestState,popularMovies: null == popularMovies ? _self._popularMovies : popularMovies // ignore: cast_nullable_to_non_nullable
as List<Movie>,topRatedState: null == topRatedState ? _self.topRatedState : topRatedState // ignore: cast_nullable_to_non_nullable
as RequestState,topRatedMovies: null == topRatedMovies ? _self._topRatedMovies : topRatedMovies // ignore: cast_nullable_to_non_nullable
as List<Movie>,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
