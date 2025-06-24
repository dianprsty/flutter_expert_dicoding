// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'popular_tv_series_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PopularTvSeriesEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PopularTvSeriesEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PopularTvSeriesEvent()';
}


}

/// @nodoc
class $PopularTvSeriesEventCopyWith<$Res>  {
$PopularTvSeriesEventCopyWith(PopularTvSeriesEvent _, $Res Function(PopularTvSeriesEvent) __);
}


/// @nodoc


class _FetchPopularTvSeries implements PopularTvSeriesEvent {
  const _FetchPopularTvSeries();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FetchPopularTvSeries);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PopularTvSeriesEvent.fetchPopularTvSeries()';
}


}




/// @nodoc
mixin _$PopularTvSeriesState {

 RequestState get requestState; List<TvSeries> get tvSeries; String get message;
/// Create a copy of PopularTvSeriesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PopularTvSeriesStateCopyWith<PopularTvSeriesState> get copyWith => _$PopularTvSeriesStateCopyWithImpl<PopularTvSeriesState>(this as PopularTvSeriesState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PopularTvSeriesState&&(identical(other.requestState, requestState) || other.requestState == requestState)&&const DeepCollectionEquality().equals(other.tvSeries, tvSeries)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,requestState,const DeepCollectionEquality().hash(tvSeries),message);

@override
String toString() {
  return 'PopularTvSeriesState(requestState: $requestState, tvSeries: $tvSeries, message: $message)';
}


}

/// @nodoc
abstract mixin class $PopularTvSeriesStateCopyWith<$Res>  {
  factory $PopularTvSeriesStateCopyWith(PopularTvSeriesState value, $Res Function(PopularTvSeriesState) _then) = _$PopularTvSeriesStateCopyWithImpl;
@useResult
$Res call({
 RequestState requestState, List<TvSeries> tvSeries, String message
});




}
/// @nodoc
class _$PopularTvSeriesStateCopyWithImpl<$Res>
    implements $PopularTvSeriesStateCopyWith<$Res> {
  _$PopularTvSeriesStateCopyWithImpl(this._self, this._then);

  final PopularTvSeriesState _self;
  final $Res Function(PopularTvSeriesState) _then;

/// Create a copy of PopularTvSeriesState
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


class _PopularTvSeriesState implements PopularTvSeriesState {
   _PopularTvSeriesState({this.requestState = RequestState.Empty, final  List<TvSeries> tvSeries = const [], this.message = ''}): _tvSeries = tvSeries;
  

@override@JsonKey() final  RequestState requestState;
 final  List<TvSeries> _tvSeries;
@override@JsonKey() List<TvSeries> get tvSeries {
  if (_tvSeries is EqualUnmodifiableListView) return _tvSeries;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tvSeries);
}

@override@JsonKey() final  String message;

/// Create a copy of PopularTvSeriesState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PopularTvSeriesStateCopyWith<_PopularTvSeriesState> get copyWith => __$PopularTvSeriesStateCopyWithImpl<_PopularTvSeriesState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PopularTvSeriesState&&(identical(other.requestState, requestState) || other.requestState == requestState)&&const DeepCollectionEquality().equals(other._tvSeries, _tvSeries)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,requestState,const DeepCollectionEquality().hash(_tvSeries),message);

@override
String toString() {
  return 'PopularTvSeriesState(requestState: $requestState, tvSeries: $tvSeries, message: $message)';
}


}

/// @nodoc
abstract mixin class _$PopularTvSeriesStateCopyWith<$Res> implements $PopularTvSeriesStateCopyWith<$Res> {
  factory _$PopularTvSeriesStateCopyWith(_PopularTvSeriesState value, $Res Function(_PopularTvSeriesState) _then) = __$PopularTvSeriesStateCopyWithImpl;
@override @useResult
$Res call({
 RequestState requestState, List<TvSeries> tvSeries, String message
});




}
/// @nodoc
class __$PopularTvSeriesStateCopyWithImpl<$Res>
    implements _$PopularTvSeriesStateCopyWith<$Res> {
  __$PopularTvSeriesStateCopyWithImpl(this._self, this._then);

  final _PopularTvSeriesState _self;
  final $Res Function(_PopularTvSeriesState) _then;

/// Create a copy of PopularTvSeriesState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? requestState = null,Object? tvSeries = null,Object? message = null,}) {
  return _then(_PopularTvSeriesState(
requestState: null == requestState ? _self.requestState : requestState // ignore: cast_nullable_to_non_nullable
as RequestState,tvSeries: null == tvSeries ? _self._tvSeries : tvSeries // ignore: cast_nullable_to_non_nullable
as List<TvSeries>,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
