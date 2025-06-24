// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_tv_series_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SearchTvSeriesEvent {

 String get query;
/// Create a copy of SearchTvSeriesEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchTvSeriesEventCopyWith<SearchTvSeriesEvent> get copyWith => _$SearchTvSeriesEventCopyWithImpl<SearchTvSeriesEvent>(this as SearchTvSeriesEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchTvSeriesEvent&&(identical(other.query, query) || other.query == query));
}


@override
int get hashCode => Object.hash(runtimeType,query);

@override
String toString() {
  return 'SearchTvSeriesEvent(query: $query)';
}


}

/// @nodoc
abstract mixin class $SearchTvSeriesEventCopyWith<$Res>  {
  factory $SearchTvSeriesEventCopyWith(SearchTvSeriesEvent value, $Res Function(SearchTvSeriesEvent) _then) = _$SearchTvSeriesEventCopyWithImpl;
@useResult
$Res call({
 String query
});




}
/// @nodoc
class _$SearchTvSeriesEventCopyWithImpl<$Res>
    implements $SearchTvSeriesEventCopyWith<$Res> {
  _$SearchTvSeriesEventCopyWithImpl(this._self, this._then);

  final SearchTvSeriesEvent _self;
  final $Res Function(SearchTvSeriesEvent) _then;

/// Create a copy of SearchTvSeriesEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? query = null,}) {
  return _then(_self.copyWith(
query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc


class _OnQueryChanged implements SearchTvSeriesEvent {
  const _OnQueryChanged(this.query);
  

@override final  String query;

/// Create a copy of SearchTvSeriesEvent
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
  return 'SearchTvSeriesEvent.onQueryChanged(query: $query)';
}


}

/// @nodoc
abstract mixin class _$OnQueryChangedCopyWith<$Res> implements $SearchTvSeriesEventCopyWith<$Res> {
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

/// Create a copy of SearchTvSeriesEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? query = null,}) {
  return _then(_OnQueryChanged(
null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$SearchTvSeriesState {

 RequestState get state; List<TvSeries> get searchResult; String get message;
/// Create a copy of SearchTvSeriesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchTvSeriesStateCopyWith<SearchTvSeriesState> get copyWith => _$SearchTvSeriesStateCopyWithImpl<SearchTvSeriesState>(this as SearchTvSeriesState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchTvSeriesState&&(identical(other.state, state) || other.state == state)&&const DeepCollectionEquality().equals(other.searchResult, searchResult)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,state,const DeepCollectionEquality().hash(searchResult),message);

@override
String toString() {
  return 'SearchTvSeriesState(state: $state, searchResult: $searchResult, message: $message)';
}


}

/// @nodoc
abstract mixin class $SearchTvSeriesStateCopyWith<$Res>  {
  factory $SearchTvSeriesStateCopyWith(SearchTvSeriesState value, $Res Function(SearchTvSeriesState) _then) = _$SearchTvSeriesStateCopyWithImpl;
@useResult
$Res call({
 RequestState state, List<TvSeries> searchResult, String message
});




}
/// @nodoc
class _$SearchTvSeriesStateCopyWithImpl<$Res>
    implements $SearchTvSeriesStateCopyWith<$Res> {
  _$SearchTvSeriesStateCopyWithImpl(this._self, this._then);

  final SearchTvSeriesState _self;
  final $Res Function(SearchTvSeriesState) _then;

/// Create a copy of SearchTvSeriesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? state = null,Object? searchResult = null,Object? message = null,}) {
  return _then(_self.copyWith(
state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as RequestState,searchResult: null == searchResult ? _self.searchResult : searchResult // ignore: cast_nullable_to_non_nullable
as List<TvSeries>,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc


class _SearchTvSeriesState implements SearchTvSeriesState {
   _SearchTvSeriesState({this.state = RequestState.Empty, final  List<TvSeries> searchResult = const [], this.message = ''}): _searchResult = searchResult;
  

@override@JsonKey() final  RequestState state;
 final  List<TvSeries> _searchResult;
@override@JsonKey() List<TvSeries> get searchResult {
  if (_searchResult is EqualUnmodifiableListView) return _searchResult;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_searchResult);
}

@override@JsonKey() final  String message;

/// Create a copy of SearchTvSeriesState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchTvSeriesStateCopyWith<_SearchTvSeriesState> get copyWith => __$SearchTvSeriesStateCopyWithImpl<_SearchTvSeriesState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchTvSeriesState&&(identical(other.state, state) || other.state == state)&&const DeepCollectionEquality().equals(other._searchResult, _searchResult)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,state,const DeepCollectionEquality().hash(_searchResult),message);

@override
String toString() {
  return 'SearchTvSeriesState(state: $state, searchResult: $searchResult, message: $message)';
}


}

/// @nodoc
abstract mixin class _$SearchTvSeriesStateCopyWith<$Res> implements $SearchTvSeriesStateCopyWith<$Res> {
  factory _$SearchTvSeriesStateCopyWith(_SearchTvSeriesState value, $Res Function(_SearchTvSeriesState) _then) = __$SearchTvSeriesStateCopyWithImpl;
@override @useResult
$Res call({
 RequestState state, List<TvSeries> searchResult, String message
});




}
/// @nodoc
class __$SearchTvSeriesStateCopyWithImpl<$Res>
    implements _$SearchTvSeriesStateCopyWith<$Res> {
  __$SearchTvSeriesStateCopyWithImpl(this._self, this._then);

  final _SearchTvSeriesState _self;
  final $Res Function(_SearchTvSeriesState) _then;

/// Create a copy of SearchTvSeriesState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? state = null,Object? searchResult = null,Object? message = null,}) {
  return _then(_SearchTvSeriesState(
state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as RequestState,searchResult: null == searchResult ? _self._searchResult : searchResult // ignore: cast_nullable_to_non_nullable
as List<TvSeries>,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
