// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_tv_series_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HomeTvSeriesEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeTvSeriesEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeTvSeriesEvent()';
}


}

/// @nodoc
class $HomeTvSeriesEventCopyWith<$Res>  {
$HomeTvSeriesEventCopyWith(HomeTvSeriesEvent _, $Res Function(HomeTvSeriesEvent) __);
}


/// @nodoc


class _FetchOnTheAirTvSeries implements HomeTvSeriesEvent {
  const _FetchOnTheAirTvSeries();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FetchOnTheAirTvSeries);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeTvSeriesEvent.fetchOnTheAirTvSeries()';
}


}




/// @nodoc


class _FetchPopularTvSeries implements HomeTvSeriesEvent {
  const _FetchPopularTvSeries();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FetchPopularTvSeries);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeTvSeriesEvent.fetchPopularTvSeries()';
}


}




/// @nodoc


class _FetchTopRatedTvSeries implements HomeTvSeriesEvent {
  const _FetchTopRatedTvSeries();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FetchTopRatedTvSeries);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeTvSeriesEvent.fetchTopRatedTvSeries()';
}


}




/// @nodoc
mixin _$HomeTvSeriesState {

 RequestState get onTheAirState; List<TvSeries> get onTheAirTvSeries; RequestState get popularState; List<TvSeries> get popularTvSeries; RequestState get topRatedState; List<TvSeries> get topRatedTvSeries; String get message;
/// Create a copy of HomeTvSeriesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeTvSeriesStateCopyWith<HomeTvSeriesState> get copyWith => _$HomeTvSeriesStateCopyWithImpl<HomeTvSeriesState>(this as HomeTvSeriesState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeTvSeriesState&&(identical(other.onTheAirState, onTheAirState) || other.onTheAirState == onTheAirState)&&const DeepCollectionEquality().equals(other.onTheAirTvSeries, onTheAirTvSeries)&&(identical(other.popularState, popularState) || other.popularState == popularState)&&const DeepCollectionEquality().equals(other.popularTvSeries, popularTvSeries)&&(identical(other.topRatedState, topRatedState) || other.topRatedState == topRatedState)&&const DeepCollectionEquality().equals(other.topRatedTvSeries, topRatedTvSeries)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,onTheAirState,const DeepCollectionEquality().hash(onTheAirTvSeries),popularState,const DeepCollectionEquality().hash(popularTvSeries),topRatedState,const DeepCollectionEquality().hash(topRatedTvSeries),message);

@override
String toString() {
  return 'HomeTvSeriesState(onTheAirState: $onTheAirState, onTheAirTvSeries: $onTheAirTvSeries, popularState: $popularState, popularTvSeries: $popularTvSeries, topRatedState: $topRatedState, topRatedTvSeries: $topRatedTvSeries, message: $message)';
}


}

/// @nodoc
abstract mixin class $HomeTvSeriesStateCopyWith<$Res>  {
  factory $HomeTvSeriesStateCopyWith(HomeTvSeriesState value, $Res Function(HomeTvSeriesState) _then) = _$HomeTvSeriesStateCopyWithImpl;
@useResult
$Res call({
 RequestState onTheAirState, List<TvSeries> onTheAirTvSeries, RequestState popularState, List<TvSeries> popularTvSeries, RequestState topRatedState, List<TvSeries> topRatedTvSeries, String message
});




}
/// @nodoc
class _$HomeTvSeriesStateCopyWithImpl<$Res>
    implements $HomeTvSeriesStateCopyWith<$Res> {
  _$HomeTvSeriesStateCopyWithImpl(this._self, this._then);

  final HomeTvSeriesState _self;
  final $Res Function(HomeTvSeriesState) _then;

/// Create a copy of HomeTvSeriesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? onTheAirState = null,Object? onTheAirTvSeries = null,Object? popularState = null,Object? popularTvSeries = null,Object? topRatedState = null,Object? topRatedTvSeries = null,Object? message = null,}) {
  return _then(_self.copyWith(
onTheAirState: null == onTheAirState ? _self.onTheAirState : onTheAirState // ignore: cast_nullable_to_non_nullable
as RequestState,onTheAirTvSeries: null == onTheAirTvSeries ? _self.onTheAirTvSeries : onTheAirTvSeries // ignore: cast_nullable_to_non_nullable
as List<TvSeries>,popularState: null == popularState ? _self.popularState : popularState // ignore: cast_nullable_to_non_nullable
as RequestState,popularTvSeries: null == popularTvSeries ? _self.popularTvSeries : popularTvSeries // ignore: cast_nullable_to_non_nullable
as List<TvSeries>,topRatedState: null == topRatedState ? _self.topRatedState : topRatedState // ignore: cast_nullable_to_non_nullable
as RequestState,topRatedTvSeries: null == topRatedTvSeries ? _self.topRatedTvSeries : topRatedTvSeries // ignore: cast_nullable_to_non_nullable
as List<TvSeries>,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc


class _HomeTvSeriesState implements HomeTvSeriesState {
   _HomeTvSeriesState({this.onTheAirState = RequestState.Empty, final  List<TvSeries> onTheAirTvSeries = const [], this.popularState = RequestState.Empty, final  List<TvSeries> popularTvSeries = const [], this.topRatedState = RequestState.Empty, final  List<TvSeries> topRatedTvSeries = const [], this.message = ''}): _onTheAirTvSeries = onTheAirTvSeries,_popularTvSeries = popularTvSeries,_topRatedTvSeries = topRatedTvSeries;
  

@override@JsonKey() final  RequestState onTheAirState;
 final  List<TvSeries> _onTheAirTvSeries;
@override@JsonKey() List<TvSeries> get onTheAirTvSeries {
  if (_onTheAirTvSeries is EqualUnmodifiableListView) return _onTheAirTvSeries;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_onTheAirTvSeries);
}

@override@JsonKey() final  RequestState popularState;
 final  List<TvSeries> _popularTvSeries;
@override@JsonKey() List<TvSeries> get popularTvSeries {
  if (_popularTvSeries is EqualUnmodifiableListView) return _popularTvSeries;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_popularTvSeries);
}

@override@JsonKey() final  RequestState topRatedState;
 final  List<TvSeries> _topRatedTvSeries;
@override@JsonKey() List<TvSeries> get topRatedTvSeries {
  if (_topRatedTvSeries is EqualUnmodifiableListView) return _topRatedTvSeries;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_topRatedTvSeries);
}

@override@JsonKey() final  String message;

/// Create a copy of HomeTvSeriesState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeTvSeriesStateCopyWith<_HomeTvSeriesState> get copyWith => __$HomeTvSeriesStateCopyWithImpl<_HomeTvSeriesState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeTvSeriesState&&(identical(other.onTheAirState, onTheAirState) || other.onTheAirState == onTheAirState)&&const DeepCollectionEquality().equals(other._onTheAirTvSeries, _onTheAirTvSeries)&&(identical(other.popularState, popularState) || other.popularState == popularState)&&const DeepCollectionEquality().equals(other._popularTvSeries, _popularTvSeries)&&(identical(other.topRatedState, topRatedState) || other.topRatedState == topRatedState)&&const DeepCollectionEquality().equals(other._topRatedTvSeries, _topRatedTvSeries)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,onTheAirState,const DeepCollectionEquality().hash(_onTheAirTvSeries),popularState,const DeepCollectionEquality().hash(_popularTvSeries),topRatedState,const DeepCollectionEquality().hash(_topRatedTvSeries),message);

@override
String toString() {
  return 'HomeTvSeriesState(onTheAirState: $onTheAirState, onTheAirTvSeries: $onTheAirTvSeries, popularState: $popularState, popularTvSeries: $popularTvSeries, topRatedState: $topRatedState, topRatedTvSeries: $topRatedTvSeries, message: $message)';
}


}

/// @nodoc
abstract mixin class _$HomeTvSeriesStateCopyWith<$Res> implements $HomeTvSeriesStateCopyWith<$Res> {
  factory _$HomeTvSeriesStateCopyWith(_HomeTvSeriesState value, $Res Function(_HomeTvSeriesState) _then) = __$HomeTvSeriesStateCopyWithImpl;
@override @useResult
$Res call({
 RequestState onTheAirState, List<TvSeries> onTheAirTvSeries, RequestState popularState, List<TvSeries> popularTvSeries, RequestState topRatedState, List<TvSeries> topRatedTvSeries, String message
});




}
/// @nodoc
class __$HomeTvSeriesStateCopyWithImpl<$Res>
    implements _$HomeTvSeriesStateCopyWith<$Res> {
  __$HomeTvSeriesStateCopyWithImpl(this._self, this._then);

  final _HomeTvSeriesState _self;
  final $Res Function(_HomeTvSeriesState) _then;

/// Create a copy of HomeTvSeriesState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? onTheAirState = null,Object? onTheAirTvSeries = null,Object? popularState = null,Object? popularTvSeries = null,Object? topRatedState = null,Object? topRatedTvSeries = null,Object? message = null,}) {
  return _then(_HomeTvSeriesState(
onTheAirState: null == onTheAirState ? _self.onTheAirState : onTheAirState // ignore: cast_nullable_to_non_nullable
as RequestState,onTheAirTvSeries: null == onTheAirTvSeries ? _self._onTheAirTvSeries : onTheAirTvSeries // ignore: cast_nullable_to_non_nullable
as List<TvSeries>,popularState: null == popularState ? _self.popularState : popularState // ignore: cast_nullable_to_non_nullable
as RequestState,popularTvSeries: null == popularTvSeries ? _self._popularTvSeries : popularTvSeries // ignore: cast_nullable_to_non_nullable
as List<TvSeries>,topRatedState: null == topRatedState ? _self.topRatedState : topRatedState // ignore: cast_nullable_to_non_nullable
as RequestState,topRatedTvSeries: null == topRatedTvSeries ? _self._topRatedTvSeries : topRatedTvSeries // ignore: cast_nullable_to_non_nullable
as List<TvSeries>,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
