// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_employee_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CreateEmployeeState<T> {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateEmployeeState<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CreateEmployeeState<$T>()';
}


}

/// @nodoc
class $CreateEmployeeStateCopyWith<T,$Res>  {
$CreateEmployeeStateCopyWith(CreateEmployeeState<T> _, $Res Function(CreateEmployeeState<T>) __);
}


/// Adds pattern-matching-related methods to [CreateEmployeeState].
extension CreateEmployeeStatePatterns<T> on CreateEmployeeState<T> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial<T> value)?  initial,TResult Function( CreateEmployeeLoading<T> value)?  createEmployeeLoading,TResult Function( CreateEmployeeSuccess<T> value)?  createEmployeeSuccess,TResult Function( CreateEmployeeError<T> value)?  createEmployeeError,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case CreateEmployeeLoading() when createEmployeeLoading != null:
return createEmployeeLoading(_that);case CreateEmployeeSuccess() when createEmployeeSuccess != null:
return createEmployeeSuccess(_that);case CreateEmployeeError() when createEmployeeError != null:
return createEmployeeError(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial<T> value)  initial,required TResult Function( CreateEmployeeLoading<T> value)  createEmployeeLoading,required TResult Function( CreateEmployeeSuccess<T> value)  createEmployeeSuccess,required TResult Function( CreateEmployeeError<T> value)  createEmployeeError,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case CreateEmployeeLoading():
return createEmployeeLoading(_that);case CreateEmployeeSuccess():
return createEmployeeSuccess(_that);case CreateEmployeeError():
return createEmployeeError(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial<T> value)?  initial,TResult? Function( CreateEmployeeLoading<T> value)?  createEmployeeLoading,TResult? Function( CreateEmployeeSuccess<T> value)?  createEmployeeSuccess,TResult? Function( CreateEmployeeError<T> value)?  createEmployeeError,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case CreateEmployeeLoading() when createEmployeeLoading != null:
return createEmployeeLoading(_that);case CreateEmployeeSuccess() when createEmployeeSuccess != null:
return createEmployeeSuccess(_that);case CreateEmployeeError() when createEmployeeError != null:
return createEmployeeError(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  createEmployeeLoading,TResult Function( T data)?  createEmployeeSuccess,TResult Function( ApiErrorModel apiErrorModel)?  createEmployeeError,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case CreateEmployeeLoading() when createEmployeeLoading != null:
return createEmployeeLoading();case CreateEmployeeSuccess() when createEmployeeSuccess != null:
return createEmployeeSuccess(_that.data);case CreateEmployeeError() when createEmployeeError != null:
return createEmployeeError(_that.apiErrorModel);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  createEmployeeLoading,required TResult Function( T data)  createEmployeeSuccess,required TResult Function( ApiErrorModel apiErrorModel)  createEmployeeError,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case CreateEmployeeLoading():
return createEmployeeLoading();case CreateEmployeeSuccess():
return createEmployeeSuccess(_that.data);case CreateEmployeeError():
return createEmployeeError(_that.apiErrorModel);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  createEmployeeLoading,TResult? Function( T data)?  createEmployeeSuccess,TResult? Function( ApiErrorModel apiErrorModel)?  createEmployeeError,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case CreateEmployeeLoading() when createEmployeeLoading != null:
return createEmployeeLoading();case CreateEmployeeSuccess() when createEmployeeSuccess != null:
return createEmployeeSuccess(_that.data);case CreateEmployeeError() when createEmployeeError != null:
return createEmployeeError(_that.apiErrorModel);case _:
  return null;

}
}

}

/// @nodoc


class _Initial<T> implements CreateEmployeeState<T> {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CreateEmployeeState<$T>.initial()';
}


}




/// @nodoc


class CreateEmployeeLoading<T> implements CreateEmployeeState<T> {
  const CreateEmployeeLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateEmployeeLoading<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CreateEmployeeState<$T>.createEmployeeLoading()';
}


}




/// @nodoc


class CreateEmployeeSuccess<T> implements CreateEmployeeState<T> {
  const CreateEmployeeSuccess(this.data);
  

 final  T data;

/// Create a copy of CreateEmployeeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateEmployeeSuccessCopyWith<T, CreateEmployeeSuccess<T>> get copyWith => _$CreateEmployeeSuccessCopyWithImpl<T, CreateEmployeeSuccess<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateEmployeeSuccess<T>&&const DeepCollectionEquality().equals(other.data, data));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'CreateEmployeeState<$T>.createEmployeeSuccess(data: $data)';
}


}

/// @nodoc
abstract mixin class $CreateEmployeeSuccessCopyWith<T,$Res> implements $CreateEmployeeStateCopyWith<T, $Res> {
  factory $CreateEmployeeSuccessCopyWith(CreateEmployeeSuccess<T> value, $Res Function(CreateEmployeeSuccess<T>) _then) = _$CreateEmployeeSuccessCopyWithImpl;
@useResult
$Res call({
 T data
});




}
/// @nodoc
class _$CreateEmployeeSuccessCopyWithImpl<T,$Res>
    implements $CreateEmployeeSuccessCopyWith<T, $Res> {
  _$CreateEmployeeSuccessCopyWithImpl(this._self, this._then);

  final CreateEmployeeSuccess<T> _self;
  final $Res Function(CreateEmployeeSuccess<T>) _then;

/// Create a copy of CreateEmployeeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = freezed,}) {
  return _then(CreateEmployeeSuccess<T>(
freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as T,
  ));
}


}

/// @nodoc


class CreateEmployeeError<T> implements CreateEmployeeState<T> {
  const CreateEmployeeError(this.apiErrorModel);
  

 final  ApiErrorModel apiErrorModel;

/// Create a copy of CreateEmployeeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateEmployeeErrorCopyWith<T, CreateEmployeeError<T>> get copyWith => _$CreateEmployeeErrorCopyWithImpl<T, CreateEmployeeError<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateEmployeeError<T>&&(identical(other.apiErrorModel, apiErrorModel) || other.apiErrorModel == apiErrorModel));
}


@override
int get hashCode => Object.hash(runtimeType,apiErrorModel);

@override
String toString() {
  return 'CreateEmployeeState<$T>.createEmployeeError(apiErrorModel: $apiErrorModel)';
}


}

/// @nodoc
abstract mixin class $CreateEmployeeErrorCopyWith<T,$Res> implements $CreateEmployeeStateCopyWith<T, $Res> {
  factory $CreateEmployeeErrorCopyWith(CreateEmployeeError<T> value, $Res Function(CreateEmployeeError<T>) _then) = _$CreateEmployeeErrorCopyWithImpl;
@useResult
$Res call({
 ApiErrorModel apiErrorModel
});




}
/// @nodoc
class _$CreateEmployeeErrorCopyWithImpl<T,$Res>
    implements $CreateEmployeeErrorCopyWith<T, $Res> {
  _$CreateEmployeeErrorCopyWithImpl(this._self, this._then);

  final CreateEmployeeError<T> _self;
  final $Res Function(CreateEmployeeError<T>) _then;

/// Create a copy of CreateEmployeeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? apiErrorModel = null,}) {
  return _then(CreateEmployeeError<T>(
null == apiErrorModel ? _self.apiErrorModel : apiErrorModel // ignore: cast_nullable_to_non_nullable
as ApiErrorModel,
  ));
}


}

// dart format on
