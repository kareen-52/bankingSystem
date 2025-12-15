// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_account.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UpdateAccountState<T> {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateAccountState<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UpdateAccountState<$T>()';
}


}

/// @nodoc
class $UpdateAccountStateCopyWith<T,$Res>  {
$UpdateAccountStateCopyWith(UpdateAccountState<T> _, $Res Function(UpdateAccountState<T>) __);
}


/// Adds pattern-matching-related methods to [UpdateAccountState].
extension UpdateAccountStatePatterns<T> on UpdateAccountState<T> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial<T> value)?  initial,TResult Function( UpdateAccountLoading<T> value)?  updateAccountLoading,TResult Function( UpdateAccountSuccess<T> value)?  updateAccountSuccess,TResult Function( UpdateAccountError<T> value)?  updateAccountError,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case UpdateAccountLoading() when updateAccountLoading != null:
return updateAccountLoading(_that);case UpdateAccountSuccess() when updateAccountSuccess != null:
return updateAccountSuccess(_that);case UpdateAccountError() when updateAccountError != null:
return updateAccountError(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial<T> value)  initial,required TResult Function( UpdateAccountLoading<T> value)  updateAccountLoading,required TResult Function( UpdateAccountSuccess<T> value)  updateAccountSuccess,required TResult Function( UpdateAccountError<T> value)  updateAccountError,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case UpdateAccountLoading():
return updateAccountLoading(_that);case UpdateAccountSuccess():
return updateAccountSuccess(_that);case UpdateAccountError():
return updateAccountError(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial<T> value)?  initial,TResult? Function( UpdateAccountLoading<T> value)?  updateAccountLoading,TResult? Function( UpdateAccountSuccess<T> value)?  updateAccountSuccess,TResult? Function( UpdateAccountError<T> value)?  updateAccountError,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case UpdateAccountLoading() when updateAccountLoading != null:
return updateAccountLoading(_that);case UpdateAccountSuccess() when updateAccountSuccess != null:
return updateAccountSuccess(_that);case UpdateAccountError() when updateAccountError != null:
return updateAccountError(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  updateAccountLoading,TResult Function( T data)?  updateAccountSuccess,TResult Function( ApiErrorModel apiErrorModel)?  updateAccountError,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case UpdateAccountLoading() when updateAccountLoading != null:
return updateAccountLoading();case UpdateAccountSuccess() when updateAccountSuccess != null:
return updateAccountSuccess(_that.data);case UpdateAccountError() when updateAccountError != null:
return updateAccountError(_that.apiErrorModel);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  updateAccountLoading,required TResult Function( T data)  updateAccountSuccess,required TResult Function( ApiErrorModel apiErrorModel)  updateAccountError,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case UpdateAccountLoading():
return updateAccountLoading();case UpdateAccountSuccess():
return updateAccountSuccess(_that.data);case UpdateAccountError():
return updateAccountError(_that.apiErrorModel);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  updateAccountLoading,TResult? Function( T data)?  updateAccountSuccess,TResult? Function( ApiErrorModel apiErrorModel)?  updateAccountError,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case UpdateAccountLoading() when updateAccountLoading != null:
return updateAccountLoading();case UpdateAccountSuccess() when updateAccountSuccess != null:
return updateAccountSuccess(_that.data);case UpdateAccountError() when updateAccountError != null:
return updateAccountError(_that.apiErrorModel);case _:
  return null;

}
}

}

/// @nodoc


class _Initial<T> implements UpdateAccountState<T> {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UpdateAccountState<$T>.initial()';
}


}




/// @nodoc


class UpdateAccountLoading<T> implements UpdateAccountState<T> {
  const UpdateAccountLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateAccountLoading<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UpdateAccountState<$T>.updateAccountLoading()';
}


}




/// @nodoc


class UpdateAccountSuccess<T> implements UpdateAccountState<T> {
  const UpdateAccountSuccess(this.data);
  

 final  T data;

/// Create a copy of UpdateAccountState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateAccountSuccessCopyWith<T, UpdateAccountSuccess<T>> get copyWith => _$UpdateAccountSuccessCopyWithImpl<T, UpdateAccountSuccess<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateAccountSuccess<T>&&const DeepCollectionEquality().equals(other.data, data));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'UpdateAccountState<$T>.updateAccountSuccess(data: $data)';
}


}

/// @nodoc
abstract mixin class $UpdateAccountSuccessCopyWith<T,$Res> implements $UpdateAccountStateCopyWith<T, $Res> {
  factory $UpdateAccountSuccessCopyWith(UpdateAccountSuccess<T> value, $Res Function(UpdateAccountSuccess<T>) _then) = _$UpdateAccountSuccessCopyWithImpl;
@useResult
$Res call({
 T data
});




}
/// @nodoc
class _$UpdateAccountSuccessCopyWithImpl<T,$Res>
    implements $UpdateAccountSuccessCopyWith<T, $Res> {
  _$UpdateAccountSuccessCopyWithImpl(this._self, this._then);

  final UpdateAccountSuccess<T> _self;
  final $Res Function(UpdateAccountSuccess<T>) _then;

/// Create a copy of UpdateAccountState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = freezed,}) {
  return _then(UpdateAccountSuccess<T>(
freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as T,
  ));
}


}

/// @nodoc


class UpdateAccountError<T> implements UpdateAccountState<T> {
  const UpdateAccountError(this.apiErrorModel);
  

 final  ApiErrorModel apiErrorModel;

/// Create a copy of UpdateAccountState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateAccountErrorCopyWith<T, UpdateAccountError<T>> get copyWith => _$UpdateAccountErrorCopyWithImpl<T, UpdateAccountError<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateAccountError<T>&&(identical(other.apiErrorModel, apiErrorModel) || other.apiErrorModel == apiErrorModel));
}


@override
int get hashCode => Object.hash(runtimeType,apiErrorModel);

@override
String toString() {
  return 'UpdateAccountState<$T>.updateAccountError(apiErrorModel: $apiErrorModel)';
}


}

/// @nodoc
abstract mixin class $UpdateAccountErrorCopyWith<T,$Res> implements $UpdateAccountStateCopyWith<T, $Res> {
  factory $UpdateAccountErrorCopyWith(UpdateAccountError<T> value, $Res Function(UpdateAccountError<T>) _then) = _$UpdateAccountErrorCopyWithImpl;
@useResult
$Res call({
 ApiErrorModel apiErrorModel
});




}
/// @nodoc
class _$UpdateAccountErrorCopyWithImpl<T,$Res>
    implements $UpdateAccountErrorCopyWith<T, $Res> {
  _$UpdateAccountErrorCopyWithImpl(this._self, this._then);

  final UpdateAccountError<T> _self;
  final $Res Function(UpdateAccountError<T>) _then;

/// Create a copy of UpdateAccountState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? apiErrorModel = null,}) {
  return _then(UpdateAccountError<T>(
null == apiErrorModel ? _self.apiErrorModel : apiErrorModel // ignore: cast_nullable_to_non_nullable
as ApiErrorModel,
  ));
}


}

// dart format on
