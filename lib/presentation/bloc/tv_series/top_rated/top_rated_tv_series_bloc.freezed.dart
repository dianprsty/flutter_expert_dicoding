// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'top_rated_tv_series_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TopRatedTvSeriesEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TopRatedTvSeriesEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TopRatedTvSeriesEvent()';
}


}

/// @nodoc
class $TopRatedTvSeriesEventCopyWith<$Res>  {
$TopRatedTvSeriesEventCopyWith(TopRatedTvSeriesEvent _, $Res Function(TopRatedTvSeriesEvent) __);
}


/// @nodoc


class _FetchTopRatedTvSeries implements TopRatedTvSeriesEvent {
  const _FetchTopRatedTvSeries();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FetchTopRatedTvSeries);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TopRatedTvSeriesEvent.fetchTopRatedTvSeries()';
}


}




/// @nodoc
mixin _$TopRatedTvSeriesState {

 RequestState get requestState; List<TvSeries> get tvSeries; String get message;
/// Create a copy of TopRatedTvSeriesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TopRatedTvSeriesStateCopyWith<TopRatedTvSeriesState> get copyWith => _$TopRatedTvSeriesStateCopyWithImpl<TopRatedTvSeriesState>(this as TopRatedTvSeriesState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TopRatedTvSeriesState&&(identical(other.requestState, requestState) || other.requestState == requestState)&&const DeepCollectionEquality().equals(other.tvSeries, tvSeries)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,requestState,const DeepCollectionEquality().hash(tvSeries),message);

@override
String toString() {
  return 'TopRatedTvSeriesState(requestState: $requestState, tvSeries: $tvSeries, message: $message)';
}


}

/// @nodoc
abstract mixin class $TopRatedTvSeriesStateCopyWith<$Res>  {
  factory $TopRatedTvSeriesStateCopyWith(TopRatedTvSeriesState value, $Res Function(TopRatedTvSeriesState) _then) = _$TopRatedTvSeriesStateCopyWithImpl;
@useResult
$Res call({
 RequestState requestState, List<TvSeries> tvSeries, String message
});




}
/// @nodoc
class _$TopRatedTvSeriesStateCopyWithImpl<$Res>
    implements $TopRatedTvSeriesStateCopyWith<$Res> {
  _$TopRatedTvSeriesStateCopyWithImpl(this._self, this._then);

  final TopRatedTvSeriesState _self;
  final $Res Function(TopRatedTvSeriesState) _then;

/// Create a copy of TopRatedTvSeriesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? requestState = null,Object? tvSeries = null,Object? message = null,}) {
  return _then(_self.copyWith(
requestState: null == requestState ? _self.requestState : requestState // ignore: cast_nullable_to_non_nullable
as RequestState,tvSeries: null == tvSeries ? _self.tvSeries : tvSeries // ignore: cast_nullable_to_non_nullable
as List<TvSeries>,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc


class _TopRatedTvSeriesState implements TopRatedTvSeriesState {
   _TopRatedTvSeriesState({this.requestState = RequestState.Empty, final  List<TvSeries> tvSeries = const [], this.message = ''}): _tvSeries = tvSeries;
  

@override@JsonKey() final  RequestState requestState;
 final  List<TvSeries> _tvSeries;
@override@JsonKey() List<TvSeries> get tvSeries {
  if (_tvSeries is EqualUnmodifiableListView) return _tvSeries;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tvSeries);
}

@override@JsonKey() final  String message;

/// Create a copy of TopRatedTvSeriesState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TopRatedTvSeriesStateCopyWith<_TopRatedTvSeriesState> get copyWith => __$TopRatedTvSeriesStateCopyWithImpl<_TopRatedTvSeriesState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TopRatedTvSeriesState&&(identical(other.requestState, requestState) || other.requestState == requestState)&&const DeepCollectionEquality().equals(other._tvSeries, _tvSeries)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,requestState,const DeepCollectionEquality().hash(_tvSeries),message);

@override
String toString() {
  return 'TopRatedTvSeriesState(requestState: $requestState, tvSeries: $tvSeries, message: $message)';
}


}

/// @nodoc
abstract mixin class _$TopRatedTvSeriesStateCopyWith<$Res> implements $TopRatedTvSeriesStateCopyWith<$Res> {
  factory _$TopRatedTvSeriesStateCopyWith(_TopRatedTvSeriesState value, $Res Function(_TopRatedTvSeriesState) _then) = __$TopRatedTvSeriesStateCopyWithImpl;
@override @useResult
$Res call({
 RequestState requestState, List<TvSeries> tvSeries, String message
});




}
/// @nodoc
class __$TopRatedTvSeriesStateCopyWithImpl<$Res>
    implements _$TopRatedTvSeriesStateCopyWith<$Res> {
  __$TopRatedTvSeriesStateCopyWithImpl(this._self, this._then);

  final _TopRatedTvSeriesState _self;
  final $Res Function(_TopRatedTvSeriesState) _then;

/// Create a copy of TopRatedTvSeriesState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? requestState = null,Object? tvSeries = null,Object? message = null,}) {
  return _then(_TopRatedTvSeriesState(
requestState: null == requestState ? _self.requestState : requestState // ignore: cast_nullable_to_non_nullable
as RequestState,tvSeries: null == tvSeries ? _self._tvSeries : tvSeries // ignore: cast_nullable_to_non_nullable
as List<TvSeries>,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
