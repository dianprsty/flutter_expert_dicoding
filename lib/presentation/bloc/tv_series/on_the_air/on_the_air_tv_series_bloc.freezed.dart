// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'on_the_air_tv_series_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OnTheAirTvSeriesEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnTheAirTvSeriesEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OnTheAirTvSeriesEvent()';
}


}

/// @nodoc
class $OnTheAirTvSeriesEventCopyWith<$Res>  {
$OnTheAirTvSeriesEventCopyWith(OnTheAirTvSeriesEvent _, $Res Function(OnTheAirTvSeriesEvent) __);
}


/// @nodoc


class _FetchOnTheAirTvSeries implements OnTheAirTvSeriesEvent {
  const _FetchOnTheAirTvSeries();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FetchOnTheAirTvSeries);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OnTheAirTvSeriesEvent.fetchOnTheAirTvSeries()';
}


}




/// @nodoc
mixin _$OnTheAirTvSeriesState {

 RequestState get requestState; List<TvSeries> get tvSeries; String get message;
/// Create a copy of OnTheAirTvSeriesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OnTheAirTvSeriesStateCopyWith<OnTheAirTvSeriesState> get copyWith => _$OnTheAirTvSeriesStateCopyWithImpl<OnTheAirTvSeriesState>(this as OnTheAirTvSeriesState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnTheAirTvSeriesState&&(identical(other.requestState, requestState) || other.requestState == requestState)&&const DeepCollectionEquality().equals(other.tvSeries, tvSeries)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,requestState,const DeepCollectionEquality().hash(tvSeries),message);

@override
String toString() {
  return 'OnTheAirTvSeriesState(requestState: $requestState, tvSeries: $tvSeries, message: $message)';
}


}

/// @nodoc
abstract mixin class $OnTheAirTvSeriesStateCopyWith<$Res>  {
  factory $OnTheAirTvSeriesStateCopyWith(OnTheAirTvSeriesState value, $Res Function(OnTheAirTvSeriesState) _then) = _$OnTheAirTvSeriesStateCopyWithImpl;
@useResult
$Res call({
 RequestState requestState, List<TvSeries> tvSeries, String message
});




}
/// @nodoc
class _$OnTheAirTvSeriesStateCopyWithImpl<$Res>
    implements $OnTheAirTvSeriesStateCopyWith<$Res> {
  _$OnTheAirTvSeriesStateCopyWithImpl(this._self, this._then);

  final OnTheAirTvSeriesState _self;
  final $Res Function(OnTheAirTvSeriesState) _then;

/// Create a copy of OnTheAirTvSeriesState
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


class _OnTheAirState implements OnTheAirTvSeriesState {
   _OnTheAirState({this.requestState = RequestState.Empty, final  List<TvSeries> tvSeries = const [], this.message = ''}): _tvSeries = tvSeries;
  

@override@JsonKey() final  RequestState requestState;
 final  List<TvSeries> _tvSeries;
@override@JsonKey() List<TvSeries> get tvSeries {
  if (_tvSeries is EqualUnmodifiableListView) return _tvSeries;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tvSeries);
}

@override@JsonKey() final  String message;

/// Create a copy of OnTheAirTvSeriesState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OnTheAirStateCopyWith<_OnTheAirState> get copyWith => __$OnTheAirStateCopyWithImpl<_OnTheAirState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OnTheAirState&&(identical(other.requestState, requestState) || other.requestState == requestState)&&const DeepCollectionEquality().equals(other._tvSeries, _tvSeries)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,requestState,const DeepCollectionEquality().hash(_tvSeries),message);

@override
String toString() {
  return 'OnTheAirTvSeriesState(requestState: $requestState, tvSeries: $tvSeries, message: $message)';
}


}

/// @nodoc
abstract mixin class _$OnTheAirStateCopyWith<$Res> implements $OnTheAirTvSeriesStateCopyWith<$Res> {
  factory _$OnTheAirStateCopyWith(_OnTheAirState value, $Res Function(_OnTheAirState) _then) = __$OnTheAirStateCopyWithImpl;
@override @useResult
$Res call({
 RequestState requestState, List<TvSeries> tvSeries, String message
});




}
/// @nodoc
class __$OnTheAirStateCopyWithImpl<$Res>
    implements _$OnTheAirStateCopyWith<$Res> {
  __$OnTheAirStateCopyWithImpl(this._self, this._then);

  final _OnTheAirState _self;
  final $Res Function(_OnTheAirState) _then;

/// Create a copy of OnTheAirTvSeriesState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? requestState = null,Object? tvSeries = null,Object? message = null,}) {
  return _then(_OnTheAirState(
requestState: null == requestState ? _self.requestState : requestState // ignore: cast_nullable_to_non_nullable
as RequestState,tvSeries: null == tvSeries ? _self._tvSeries : tvSeries // ignore: cast_nullable_to_non_nullable
as List<TvSeries>,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
