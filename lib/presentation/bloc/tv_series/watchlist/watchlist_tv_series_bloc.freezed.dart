// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'watchlist_tv_series_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WatchlistTvSeriesEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WatchlistTvSeriesEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WatchlistTvSeriesEvent()';
}


}

/// @nodoc
class $WatchlistTvSeriesEventCopyWith<$Res>  {
$WatchlistTvSeriesEventCopyWith(WatchlistTvSeriesEvent _, $Res Function(WatchlistTvSeriesEvent) __);
}


/// @nodoc


class _FetchWatchlistTvSeries implements WatchlistTvSeriesEvent {
  const _FetchWatchlistTvSeries();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FetchWatchlistTvSeries);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WatchlistTvSeriesEvent.fetchWatchlistTvSeries()';
}


}




/// @nodoc
mixin _$WatchlistTvSeriesState {

 RequestState get requestState; List<TvSeries> get watchlistTvSeries; String get message;
/// Create a copy of WatchlistTvSeriesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WatchlistTvSeriesStateCopyWith<WatchlistTvSeriesState> get copyWith => _$WatchlistTvSeriesStateCopyWithImpl<WatchlistTvSeriesState>(this as WatchlistTvSeriesState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WatchlistTvSeriesState&&(identical(other.requestState, requestState) || other.requestState == requestState)&&const DeepCollectionEquality().equals(other.watchlistTvSeries, watchlistTvSeries)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,requestState,const DeepCollectionEquality().hash(watchlistTvSeries),message);

@override
String toString() {
  return 'WatchlistTvSeriesState(requestState: $requestState, watchlistTvSeries: $watchlistTvSeries, message: $message)';
}


}

/// @nodoc
abstract mixin class $WatchlistTvSeriesStateCopyWith<$Res>  {
  factory $WatchlistTvSeriesStateCopyWith(WatchlistTvSeriesState value, $Res Function(WatchlistTvSeriesState) _then) = _$WatchlistTvSeriesStateCopyWithImpl;
@useResult
$Res call({
 RequestState requestState, List<TvSeries> watchlistTvSeries, String message
});




}
/// @nodoc
class _$WatchlistTvSeriesStateCopyWithImpl<$Res>
    implements $WatchlistTvSeriesStateCopyWith<$Res> {
  _$WatchlistTvSeriesStateCopyWithImpl(this._self, this._then);

  final WatchlistTvSeriesState _self;
  final $Res Function(WatchlistTvSeriesState) _then;

/// Create a copy of WatchlistTvSeriesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? requestState = null,Object? watchlistTvSeries = null,Object? message = null,}) {
  return _then(_self.copyWith(
requestState: null == requestState ? _self.requestState : requestState // ignore: cast_nullable_to_non_nullable
as RequestState,watchlistTvSeries: null == watchlistTvSeries ? _self.watchlistTvSeries : watchlistTvSeries // ignore: cast_nullable_to_non_nullable
as List<TvSeries>,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc


class _WatchlistTvSeriesState implements WatchlistTvSeriesState {
   _WatchlistTvSeriesState({this.requestState = RequestState.Empty, final  List<TvSeries> watchlistTvSeries = const [], this.message = ''}): _watchlistTvSeries = watchlistTvSeries;
  

@override@JsonKey() final  RequestState requestState;
 final  List<TvSeries> _watchlistTvSeries;
@override@JsonKey() List<TvSeries> get watchlistTvSeries {
  if (_watchlistTvSeries is EqualUnmodifiableListView) return _watchlistTvSeries;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_watchlistTvSeries);
}

@override@JsonKey() final  String message;

/// Create a copy of WatchlistTvSeriesState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WatchlistTvSeriesStateCopyWith<_WatchlistTvSeriesState> get copyWith => __$WatchlistTvSeriesStateCopyWithImpl<_WatchlistTvSeriesState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WatchlistTvSeriesState&&(identical(other.requestState, requestState) || other.requestState == requestState)&&const DeepCollectionEquality().equals(other._watchlistTvSeries, _watchlistTvSeries)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,requestState,const DeepCollectionEquality().hash(_watchlistTvSeries),message);

@override
String toString() {
  return 'WatchlistTvSeriesState(requestState: $requestState, watchlistTvSeries: $watchlistTvSeries, message: $message)';
}


}

/// @nodoc
abstract mixin class _$WatchlistTvSeriesStateCopyWith<$Res> implements $WatchlistTvSeriesStateCopyWith<$Res> {
  factory _$WatchlistTvSeriesStateCopyWith(_WatchlistTvSeriesState value, $Res Function(_WatchlistTvSeriesState) _then) = __$WatchlistTvSeriesStateCopyWithImpl;
@override @useResult
$Res call({
 RequestState requestState, List<TvSeries> watchlistTvSeries, String message
});




}
/// @nodoc
class __$WatchlistTvSeriesStateCopyWithImpl<$Res>
    implements _$WatchlistTvSeriesStateCopyWith<$Res> {
  __$WatchlistTvSeriesStateCopyWithImpl(this._self, this._then);

  final _WatchlistTvSeriesState _self;
  final $Res Function(_WatchlistTvSeriesState) _then;

/// Create a copy of WatchlistTvSeriesState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? requestState = null,Object? watchlistTvSeries = null,Object? message = null,}) {
  return _then(_WatchlistTvSeriesState(
requestState: null == requestState ? _self.requestState : requestState // ignore: cast_nullable_to_non_nullable
as RequestState,watchlistTvSeries: null == watchlistTvSeries ? _self._watchlistTvSeries : watchlistTvSeries // ignore: cast_nullable_to_non_nullable
as List<TvSeries>,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
