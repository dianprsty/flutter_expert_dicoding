// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tv_series_detail_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TvSeriesDetailEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TvSeriesDetailEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TvSeriesDetailEvent()';
}


}

/// @nodoc
class $TvSeriesDetailEventCopyWith<$Res>  {
$TvSeriesDetailEventCopyWith(TvSeriesDetailEvent _, $Res Function(TvSeriesDetailEvent) __);
}


/// @nodoc


class _FetchTvSeriesDetail implements TvSeriesDetailEvent {
  const _FetchTvSeriesDetail(this.id);
  

 final  int id;

/// Create a copy of TvSeriesDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FetchTvSeriesDetailCopyWith<_FetchTvSeriesDetail> get copyWith => __$FetchTvSeriesDetailCopyWithImpl<_FetchTvSeriesDetail>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FetchTvSeriesDetail&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'TvSeriesDetailEvent.fetchTvSeriesDetail(id: $id)';
}


}

/// @nodoc
abstract mixin class _$FetchTvSeriesDetailCopyWith<$Res> implements $TvSeriesDetailEventCopyWith<$Res> {
  factory _$FetchTvSeriesDetailCopyWith(_FetchTvSeriesDetail value, $Res Function(_FetchTvSeriesDetail) _then) = __$FetchTvSeriesDetailCopyWithImpl;
@useResult
$Res call({
 int id
});




}
/// @nodoc
class __$FetchTvSeriesDetailCopyWithImpl<$Res>
    implements _$FetchTvSeriesDetailCopyWith<$Res> {
  __$FetchTvSeriesDetailCopyWithImpl(this._self, this._then);

  final _FetchTvSeriesDetail _self;
  final $Res Function(_FetchTvSeriesDetail) _then;

/// Create a copy of TvSeriesDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(_FetchTvSeriesDetail(
null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _AddWatchlist implements TvSeriesDetailEvent {
  const _AddWatchlist(this.tvSeries);
  

 final  TvSeriesDetail tvSeries;

/// Create a copy of TvSeriesDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddWatchlistCopyWith<_AddWatchlist> get copyWith => __$AddWatchlistCopyWithImpl<_AddWatchlist>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddWatchlist&&(identical(other.tvSeries, tvSeries) || other.tvSeries == tvSeries));
}


@override
int get hashCode => Object.hash(runtimeType,tvSeries);

@override
String toString() {
  return 'TvSeriesDetailEvent.addWatchlist(tvSeries: $tvSeries)';
}


}

/// @nodoc
abstract mixin class _$AddWatchlistCopyWith<$Res> implements $TvSeriesDetailEventCopyWith<$Res> {
  factory _$AddWatchlistCopyWith(_AddWatchlist value, $Res Function(_AddWatchlist) _then) = __$AddWatchlistCopyWithImpl;
@useResult
$Res call({
 TvSeriesDetail tvSeries
});




}
/// @nodoc
class __$AddWatchlistCopyWithImpl<$Res>
    implements _$AddWatchlistCopyWith<$Res> {
  __$AddWatchlistCopyWithImpl(this._self, this._then);

  final _AddWatchlist _self;
  final $Res Function(_AddWatchlist) _then;

/// Create a copy of TvSeriesDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? tvSeries = null,}) {
  return _then(_AddWatchlist(
null == tvSeries ? _self.tvSeries : tvSeries // ignore: cast_nullable_to_non_nullable
as TvSeriesDetail,
  ));
}


}

/// @nodoc


class _RemoveFromWatchlist implements TvSeriesDetailEvent {
  const _RemoveFromWatchlist(this.tvSeries);
  

 final  TvSeriesDetail tvSeries;

/// Create a copy of TvSeriesDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RemoveFromWatchlistCopyWith<_RemoveFromWatchlist> get copyWith => __$RemoveFromWatchlistCopyWithImpl<_RemoveFromWatchlist>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RemoveFromWatchlist&&(identical(other.tvSeries, tvSeries) || other.tvSeries == tvSeries));
}


@override
int get hashCode => Object.hash(runtimeType,tvSeries);

@override
String toString() {
  return 'TvSeriesDetailEvent.removeFromWatchlist(tvSeries: $tvSeries)';
}


}

/// @nodoc
abstract mixin class _$RemoveFromWatchlistCopyWith<$Res> implements $TvSeriesDetailEventCopyWith<$Res> {
  factory _$RemoveFromWatchlistCopyWith(_RemoveFromWatchlist value, $Res Function(_RemoveFromWatchlist) _then) = __$RemoveFromWatchlistCopyWithImpl;
@useResult
$Res call({
 TvSeriesDetail tvSeries
});




}
/// @nodoc
class __$RemoveFromWatchlistCopyWithImpl<$Res>
    implements _$RemoveFromWatchlistCopyWith<$Res> {
  __$RemoveFromWatchlistCopyWithImpl(this._self, this._then);

  final _RemoveFromWatchlist _self;
  final $Res Function(_RemoveFromWatchlist) _then;

/// Create a copy of TvSeriesDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? tvSeries = null,}) {
  return _then(_RemoveFromWatchlist(
null == tvSeries ? _self.tvSeries : tvSeries // ignore: cast_nullable_to_non_nullable
as TvSeriesDetail,
  ));
}


}

/// @nodoc


class _LoadWatchlistStatus implements TvSeriesDetailEvent {
  const _LoadWatchlistStatus(this.id);
  

 final  int id;

/// Create a copy of TvSeriesDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadWatchlistStatusCopyWith<_LoadWatchlistStatus> get copyWith => __$LoadWatchlistStatusCopyWithImpl<_LoadWatchlistStatus>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadWatchlistStatus&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'TvSeriesDetailEvent.loadWatchlistStatus(id: $id)';
}


}

/// @nodoc
abstract mixin class _$LoadWatchlistStatusCopyWith<$Res> implements $TvSeriesDetailEventCopyWith<$Res> {
  factory _$LoadWatchlistStatusCopyWith(_LoadWatchlistStatus value, $Res Function(_LoadWatchlistStatus) _then) = __$LoadWatchlistStatusCopyWithImpl;
@useResult
$Res call({
 int id
});




}
/// @nodoc
class __$LoadWatchlistStatusCopyWithImpl<$Res>
    implements _$LoadWatchlistStatusCopyWith<$Res> {
  __$LoadWatchlistStatusCopyWithImpl(this._self, this._then);

  final _LoadWatchlistStatus _self;
  final $Res Function(_LoadWatchlistStatus) _then;

/// Create a copy of TvSeriesDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(_LoadWatchlistStatus(
null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$TvSeriesDetailState {

 RequestState get tvSeriesState; TvSeriesDetail? get tvSeriesDetail; RequestState get recommendationState; List<TvSeries> get tvSeriesRecommendations; bool get isAddedToWatchlist; String get message; String get watchlistMessage;
/// Create a copy of TvSeriesDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TvSeriesDetailStateCopyWith<TvSeriesDetailState> get copyWith => _$TvSeriesDetailStateCopyWithImpl<TvSeriesDetailState>(this as TvSeriesDetailState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TvSeriesDetailState&&(identical(other.tvSeriesState, tvSeriesState) || other.tvSeriesState == tvSeriesState)&&(identical(other.tvSeriesDetail, tvSeriesDetail) || other.tvSeriesDetail == tvSeriesDetail)&&(identical(other.recommendationState, recommendationState) || other.recommendationState == recommendationState)&&const DeepCollectionEquality().equals(other.tvSeriesRecommendations, tvSeriesRecommendations)&&(identical(other.isAddedToWatchlist, isAddedToWatchlist) || other.isAddedToWatchlist == isAddedToWatchlist)&&(identical(other.message, message) || other.message == message)&&(identical(other.watchlistMessage, watchlistMessage) || other.watchlistMessage == watchlistMessage));
}


@override
int get hashCode => Object.hash(runtimeType,tvSeriesState,tvSeriesDetail,recommendationState,const DeepCollectionEquality().hash(tvSeriesRecommendations),isAddedToWatchlist,message,watchlistMessage);

@override
String toString() {
  return 'TvSeriesDetailState(tvSeriesState: $tvSeriesState, tvSeriesDetail: $tvSeriesDetail, recommendationState: $recommendationState, tvSeriesRecommendations: $tvSeriesRecommendations, isAddedToWatchlist: $isAddedToWatchlist, message: $message, watchlistMessage: $watchlistMessage)';
}


}

/// @nodoc
abstract mixin class $TvSeriesDetailStateCopyWith<$Res>  {
  factory $TvSeriesDetailStateCopyWith(TvSeriesDetailState value, $Res Function(TvSeriesDetailState) _then) = _$TvSeriesDetailStateCopyWithImpl;
@useResult
$Res call({
 RequestState tvSeriesState, TvSeriesDetail? tvSeriesDetail, RequestState recommendationState, List<TvSeries> tvSeriesRecommendations, bool isAddedToWatchlist, String message, String watchlistMessage
});




}
/// @nodoc
class _$TvSeriesDetailStateCopyWithImpl<$Res>
    implements $TvSeriesDetailStateCopyWith<$Res> {
  _$TvSeriesDetailStateCopyWithImpl(this._self, this._then);

  final TvSeriesDetailState _self;
  final $Res Function(TvSeriesDetailState) _then;

/// Create a copy of TvSeriesDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tvSeriesState = null,Object? tvSeriesDetail = freezed,Object? recommendationState = null,Object? tvSeriesRecommendations = null,Object? isAddedToWatchlist = null,Object? message = null,Object? watchlistMessage = null,}) {
  return _then(_self.copyWith(
tvSeriesState: null == tvSeriesState ? _self.tvSeriesState : tvSeriesState // ignore: cast_nullable_to_non_nullable
as RequestState,tvSeriesDetail: freezed == tvSeriesDetail ? _self.tvSeriesDetail : tvSeriesDetail // ignore: cast_nullable_to_non_nullable
as TvSeriesDetail?,recommendationState: null == recommendationState ? _self.recommendationState : recommendationState // ignore: cast_nullable_to_non_nullable
as RequestState,tvSeriesRecommendations: null == tvSeriesRecommendations ? _self.tvSeriesRecommendations : tvSeriesRecommendations // ignore: cast_nullable_to_non_nullable
as List<TvSeries>,isAddedToWatchlist: null == isAddedToWatchlist ? _self.isAddedToWatchlist : isAddedToWatchlist // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,watchlistMessage: null == watchlistMessage ? _self.watchlistMessage : watchlistMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc


class _TvSeriesDetailState implements TvSeriesDetailState {
   _TvSeriesDetailState({this.tvSeriesState = RequestState.Empty, this.tvSeriesDetail = null, this.recommendationState = RequestState.Empty, final  List<TvSeries> tvSeriesRecommendations = const [], this.isAddedToWatchlist = false, this.message = '', this.watchlistMessage = ''}): _tvSeriesRecommendations = tvSeriesRecommendations;
  

@override@JsonKey() final  RequestState tvSeriesState;
@override@JsonKey() final  TvSeriesDetail? tvSeriesDetail;
@override@JsonKey() final  RequestState recommendationState;
 final  List<TvSeries> _tvSeriesRecommendations;
@override@JsonKey() List<TvSeries> get tvSeriesRecommendations {
  if (_tvSeriesRecommendations is EqualUnmodifiableListView) return _tvSeriesRecommendations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tvSeriesRecommendations);
}

@override@JsonKey() final  bool isAddedToWatchlist;
@override@JsonKey() final  String message;
@override@JsonKey() final  String watchlistMessage;

/// Create a copy of TvSeriesDetailState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TvSeriesDetailStateCopyWith<_TvSeriesDetailState> get copyWith => __$TvSeriesDetailStateCopyWithImpl<_TvSeriesDetailState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TvSeriesDetailState&&(identical(other.tvSeriesState, tvSeriesState) || other.tvSeriesState == tvSeriesState)&&(identical(other.tvSeriesDetail, tvSeriesDetail) || other.tvSeriesDetail == tvSeriesDetail)&&(identical(other.recommendationState, recommendationState) || other.recommendationState == recommendationState)&&const DeepCollectionEquality().equals(other._tvSeriesRecommendations, _tvSeriesRecommendations)&&(identical(other.isAddedToWatchlist, isAddedToWatchlist) || other.isAddedToWatchlist == isAddedToWatchlist)&&(identical(other.message, message) || other.message == message)&&(identical(other.watchlistMessage, watchlistMessage) || other.watchlistMessage == watchlistMessage));
}


@override
int get hashCode => Object.hash(runtimeType,tvSeriesState,tvSeriesDetail,recommendationState,const DeepCollectionEquality().hash(_tvSeriesRecommendations),isAddedToWatchlist,message,watchlistMessage);

@override
String toString() {
  return 'TvSeriesDetailState(tvSeriesState: $tvSeriesState, tvSeriesDetail: $tvSeriesDetail, recommendationState: $recommendationState, tvSeriesRecommendations: $tvSeriesRecommendations, isAddedToWatchlist: $isAddedToWatchlist, message: $message, watchlistMessage: $watchlistMessage)';
}


}

/// @nodoc
abstract mixin class _$TvSeriesDetailStateCopyWith<$Res> implements $TvSeriesDetailStateCopyWith<$Res> {
  factory _$TvSeriesDetailStateCopyWith(_TvSeriesDetailState value, $Res Function(_TvSeriesDetailState) _then) = __$TvSeriesDetailStateCopyWithImpl;
@override @useResult
$Res call({
 RequestState tvSeriesState, TvSeriesDetail? tvSeriesDetail, RequestState recommendationState, List<TvSeries> tvSeriesRecommendations, bool isAddedToWatchlist, String message, String watchlistMessage
});




}
/// @nodoc
class __$TvSeriesDetailStateCopyWithImpl<$Res>
    implements _$TvSeriesDetailStateCopyWith<$Res> {
  __$TvSeriesDetailStateCopyWithImpl(this._self, this._then);

  final _TvSeriesDetailState _self;
  final $Res Function(_TvSeriesDetailState) _then;

/// Create a copy of TvSeriesDetailState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tvSeriesState = null,Object? tvSeriesDetail = freezed,Object? recommendationState = null,Object? tvSeriesRecommendations = null,Object? isAddedToWatchlist = null,Object? message = null,Object? watchlistMessage = null,}) {
  return _then(_TvSeriesDetailState(
tvSeriesState: null == tvSeriesState ? _self.tvSeriesState : tvSeriesState // ignore: cast_nullable_to_non_nullable
as RequestState,tvSeriesDetail: freezed == tvSeriesDetail ? _self.tvSeriesDetail : tvSeriesDetail // ignore: cast_nullable_to_non_nullable
as TvSeriesDetail?,recommendationState: null == recommendationState ? _self.recommendationState : recommendationState // ignore: cast_nullable_to_non_nullable
as RequestState,tvSeriesRecommendations: null == tvSeriesRecommendations ? _self._tvSeriesRecommendations : tvSeriesRecommendations // ignore: cast_nullable_to_non_nullable
as List<TvSeries>,isAddedToWatchlist: null == isAddedToWatchlist ? _self.isAddedToWatchlist : isAddedToWatchlist // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,watchlistMessage: null == watchlistMessage ? _self.watchlistMessage : watchlistMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
