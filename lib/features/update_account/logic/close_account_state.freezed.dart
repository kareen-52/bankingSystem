// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'close_account_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CloseAccountState<T> {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CloseAccountState<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CloseAccountState<$T>()';
}


}

/// @nodoc
class $CloseAccountStateCopyWith<T,$Res>  {
$CloseAccountStateCopyWith(CloseAccountState<T> _, $Res Function(CloseAccountState<T>) __);
}


/// Adds pattern-matching-related methods to [CloseAccountState].
extension CloseAccountStatePatterns<T> on CloseAccountState<T> {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial<T> value)?  initial,TResult Function( CloseAccountLoading<T> value)?  closeAccountLoading,TResult Function( CloseAccountSuccess<T> value)?  closeAccountSuccess,TResult Function( CloseAccountError<T> value)?  closeAccountError,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case CloseAccountLoading() when closeAccountLoading != null:
return closeAccountLoading(_that);case CloseAccountSuccess() when closeAccountSuccess != null:
return closeAccountSuccess(_that);case CloseAccountError() when closeAccountError != null:
return closeAccountError(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial<T> value)  initial,required TResult Function( CloseAccountLoading<T> value)  closeAccountLoading,required TResult Function( CloseAccountSuccess<T> value)  closeAccountSuccess,required TResult Function( CloseAccountError<T> value)  closeAccountError,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case CloseAccountLoading():
return closeAccountLoading(_that);case CloseAccountSuccess():
return closeAccountSuccess(_that);case CloseAccountError():
return closeAccountError(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial<T> value)?  initial,TResult? Function( CloseAccountLoading<T> value)?  closeAccountLoading,TResult? Function( CloseAccountSuccess<T> value)?  closeAccountSuccess,TResult? Function( CloseAccountError<T> value)?  closeAccountError,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case CloseAccountLoading() when closeAccountLoading != null:
return closeAccountLoading(_that);case CloseAccountSuccess() when closeAccountSuccess != null:
return closeAccountSuccess(_that);case CloseAccountError() when closeAccountError != null:
return closeAccountError(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  closeAccountLoading,TResult Function( T data)?  closeAccountSuccess,TResult Function( ApiErrorModel apiErrorModel)?  closeAccountError,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case CloseAccountLoading() when closeAccountLoading != null:
return closeAccountLoading();case CloseAccountSuccess() when closeAccountSuccess != null:
return closeAccountSuccess(_that.data);case CloseAccountError() when closeAccountError != null:
return closeAccountError(_that.apiErrorModel);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  closeAccountLoading,required TResult Function( T data)  closeAccountSuccess,required TResult Function( ApiErrorModel apiErrorModel)  closeAccountError,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case CloseAccountLoading():
return closeAccountLoading();case CloseAccountSuccess():
return closeAccountSuccess(_that.data);case CloseAccountError():
return closeAccountError(_that.apiErrorModel);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  closeAccountLoading,TResult? Function( T data)?  closeAccountSuccess,TResult? Function( ApiErrorModel apiErrorModel)?  closeAccountError,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case CloseAccountLoading() when closeAccountLoading != null:
return closeAccountLoading();case CloseAccountSuccess() when closeAccountSuccess != null:
return closeAccountSuccess(_that.data);case CloseAccountError() when closeAccountError != null:
return closeAccountError(_that.apiErrorModel);case _:
  return null;

}
}

}

/// @nodoc


class _Initial<T> implements CloseAccountState<T> {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CloseAccountState<$T>.initial()';
}


}




/// @nodoc


class CloseAccountLoading<T> implements CloseAccountState<T> {
  const CloseAccountLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CloseAccountLoading<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CloseAccountState<$T>.closeAccountLoading()';
}


}




/// @nodoc


class CloseAccountSuccess<T> implements CloseAccountState<T> {
  const CloseAccountSuccess(this.data);
  

 final  T data;

/// Create a copy of CloseAccountState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CloseAccountSuccessCopyWith<T, CloseAccountSuccess<T>> get copyWith => _$CloseAccountSuccessCopyWithImpl<T, CloseAccountSuccess<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CloseAccountSuccess<T>&&const DeepCollectionEquality().equals(other.data, data));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'CloseAccountState<$T>.closeAccountSuccess(data: $data)';
}


}

/// @nodoc
abstract mixin class $CloseAccountSuccessCopyWith<T,$Res> implements $CloseAccountStateCopyWith<T, $Res> {
  factory $CloseAccountSuccessCopyWith(CloseAccountSuccess<T> value, $Res Function(CloseAccountSuccess<T>) _then) = _$CloseAccountSuccessCopyWithImpl;
@useResult
$Res call({
 T data
});




}
/// @nodoc
class _$CloseAccountSuccessCopyWithImpl<T,$Res>
    implements $CloseAccountSuccessCopyWith<T, $Res> {
  _$CloseAccountSuccessCopyWithImpl(this._self, this._then);

  final CloseAccountSuccess<T> _self;
  final $Res Function(CloseAccountSuccess<T>) _then;

/// Create a copy of CloseAccountState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = freezed,}) {
  return _then(CloseAccountSuccess<T>(
freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as T,
  ));
}


}

/// @nodoc


class CloseAccountError<T> implements CloseAccountState<T> {
  const CloseAccountError(this.apiErrorModel);
  

 final  ApiErrorModel apiErrorModel;

/// Create a copy of CloseAccountState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CloseAccountErrorCopyWith<T, CloseAccountError<T>> get copyWith => _$CloseAccountErrorCopyWithImpl<T, CloseAccountError<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CloseAccountError<T>&&(identical(other.apiErrorModel, apiErrorModel) || other.apiErrorModel == apiErrorModel));
}


@override
int get hashCode => Object.hash(runtimeType,apiErrorModel);

@override
String toString() {
  return 'CloseAccountState<$T>.closeAccountError(apiErrorModel: $apiErrorModel)';
}


}

/// @nodoc
abstract mixin class $CloseAccountErrorCopyWith<T,$Res> implements $CloseAccountStateCopyWith<T, $Res> {
  factory $CloseAccountErrorCopyWith(CloseAccountError<T> value, $Res Function(CloseAccountError<T>) _then) = _$CloseAccountErrorCopyWithImpl;
@useResult
$Res call({
 ApiErrorModel apiErrorModel
});




}
/// @nodoc
class _$CloseAccountErrorCopyWithImpl<T,$Res>
    implements $CloseAccountErrorCopyWith<T, $Res> {
  _$CloseAccountErrorCopyWithImpl(this._self, this._then);

  final CloseAccountError<T> _self;
  final $Res Function(CloseAccountError<T>) _then;

/// Create a copy of CloseAccountState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? apiErrorModel = null,}) {
  return _then(CloseAccountError<T>(
null == apiErrorModel ? _self.apiErrorModel : apiErrorModel // ignore: cast_nullable_to_non_nullable
as ApiErrorModel,
  ));
}


}

// dart format on
