// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_movie_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SearchMovieEvent {

 String get query;
/// Create a copy of SearchMovieEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchMovieEventCopyWith<SearchMovieEvent> get copyWith => _$SearchMovieEventCopyWithImpl<SearchMovieEvent>(this as SearchMovieEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchMovieEvent&&(identical(other.query, query) || other.query == query));
}


@override
int get hashCode => Object.hash(runtimeType,query);

@override
String toString() {
  return 'SearchMovieEvent(query: $query)';
}


}

/// @nodoc
abstract mixin class $SearchMovieEventCopyWith<$Res>  {
  factory $SearchMovieEventCopyWith(SearchMovieEvent value, $Res Function(SearchMovieEvent) _then) = _$SearchMovieEventCopyWithImpl;
@useResult
$Res call({
 String query
});




}
/// @nodoc
class _$SearchMovieEventCopyWithImpl<$Res>
    implements $SearchMovieEventCopyWith<$Res> {
  _$SearchMovieEventCopyWithImpl(this._self, this._then);

  final SearchMovieEvent _self;
  final $Res Function(SearchMovieEvent) _then;

/// Create a copy of SearchMovieEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? query = null,}) {
  return _then(_self.copyWith(
query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc


class _OnQueryChanged implements SearchMovieEvent {
  const _OnQueryChanged(this.query);
  

@override final  String query;

/// Create a copy of SearchMovieEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OnQueryChangedCopyWith<_OnQueryChanged> get copyWith => __$OnQueryChangedCopyWithImpl<_OnQueryChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OnQueryChanged&&(identical(other.query, query) || other.query == query));
}


@override
int get hashCode => Object.hash(runtimeType,query);

@override
String toString() {
  return 'SearchMovieEvent.onQueryChanged(query: $query)';
}


}

/// @nodoc
abstract mixin class _$OnQueryChangedCopyWith<$Res> implements $SearchMovieEventCopyWith<$Res> {
  factory _$OnQueryChangedCopyWith(_OnQueryChanged value, $Res Function(_OnQueryChanged) _then) = __$OnQueryChangedCopyWithImpl;
@override @useResult
$Res call({
 String query
});




}
/// @nodoc
class __$OnQueryChangedCopyWithImpl<$Res>
    implements _$OnQueryChangedCopyWith<$Res> {
  __$OnQueryChangedCopyWithImpl(this._self, this._then);

  final _OnQueryChanged _self;
  final $Res Function(_OnQueryChanged) _then;

/// Create a copy of SearchMovieEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? query = null,}) {
  return _then(_OnQueryChanged(
null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$SearchMovieState {

 RequestState get state; List<Movie> get searchResult; String get message;
/// Create a copy of SearchMovieState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchMovieStateCopyWith<SearchMovieState> get copyWith => _$SearchMovieStateCopyWithImpl<SearchMovieState>(this as SearchMovieState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchMovieState&&(identical(other.state, state) || other.state == state)&&const DeepCollectionEquality().equals(other.searchResult, searchResult)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,state,const DeepCollectionEquality().hash(searchResult),message);

@override
String toString() {
  return 'SearchMovieState(state: $state, searchResult: $searchResult, message: $message)';
}


}

/// @nodoc
abstract mixin class $SearchMovieStateCopyWith<$Res>  {
  factory $SearchMovieStateCopyWith(SearchMovieState value, $Res Function(SearchMovieState) _then) = _$SearchMovieStateCopyWithImpl;
@useResult
$Res call({
 RequestState state, List<Movie> searchResult, String message
});




}
/// @nodoc
class _$SearchMovieStateCopyWithImpl<$Res>
    implements $SearchMovieStateCopyWith<$Res> {
  _$SearchMovieStateCopyWithImpl(this._self, this._then);

  final SearchMovieState _self;
  final $Res Function(SearchMovieState) _then;

/// Create a copy of SearchMovieState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? state = null,Object? searchResult = null,Object? message = null,}) {
  return _then(_self.copyWith(
state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as RequestState,searchResult: null == searchResult ? _self.searchResult : searchResult // ignore: cast_nullable_to_non_nullable
as List<Movie>,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc


class _SearchMovieState implements SearchMovieState {
   _SearchMovieState({this.state = RequestState.Empty, final  List<Movie> searchResult = const [], this.message = ''}): _searchResult = searchResult;
  

@override@JsonKey() final  RequestState state;
 final  List<Movie> _searchResult;
@override@JsonKey() List<Movie> get searchResult {
  if (_searchResult is EqualUnmodifiableListView) return _searchResult;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_searchResult);
}

@override@JsonKey() final  String message;

/// Create a copy of SearchMovieState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchMovieStateCopyWith<_SearchMovieState> get copyWith => __$SearchMovieStateCopyWithImpl<_SearchMovieState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchMovieState&&(identical(other.state, state) || other.state == state)&&const DeepCollectionEquality().equals(other._searchResult, _searchResult)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,state,const DeepCollectionEquality().hash(_searchResult),message);

@override
String toString() {
  return 'SearchMovieState(state: $state, searchResult: $searchResult, message: $message)';
}


}

/// @nodoc
abstract mixin class _$SearchMovieStateCopyWith<$Res> implements $SearchMovieStateCopyWith<$Res> {
  factory _$SearchMovieStateCopyWith(_SearchMovieState value, $Res Function(_SearchMovieState) _then) = __$SearchMovieStateCopyWithImpl;
@override @useResult
$Res call({
 RequestState state, List<Movie> searchResult, String message
});




}
/// @nodoc
class __$SearchMovieStateCopyWithImpl<$Res>
    implements _$SearchMovieStateCopyWith<$Res> {
  __$SearchMovieStateCopyWithImpl(this._self, this._then);

  final _SearchMovieState _self;
  final $Res Function(_SearchMovieState) _then;

/// Create a copy of SearchMovieState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? state = null,Object? searchResult = null,Object? message = null,}) {
  return _then(_SearchMovieState(
state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as RequestState,searchResult: null == searchResult ? _self._searchResult : searchResult // ignore: cast_nullable_to_non_nullable
as List<Movie>,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
