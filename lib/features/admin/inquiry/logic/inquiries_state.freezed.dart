// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'inquiries_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$InquiriesState<T> {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InquiriesState<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'InquiriesState<$T>()';
}


}

/// @nodoc
class $InquiriesStateCopyWith<T,$Res>  {
$InquiriesStateCopyWith(InquiriesState<T> _, $Res Function(InquiriesState<T>) __);
}


/// Adds pattern-matching-related methods to [InquiriesState].
extension InquiriesStatePatterns<T> on InquiriesState<T> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial<T> value)?  initial,TResult Function( InquiriesLoading<T> value)?  inquiriesLoading,TResult Function( InquiriesSuccess<T> value)?  inquiriesSuccess,TResult Function( InquiriesError<T> value)?  inquiriesError,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case InquiriesLoading() when inquiriesLoading != null:
return inquiriesLoading(_that);case InquiriesSuccess() when inquiriesSuccess != null:
return inquiriesSuccess(_that);case InquiriesError() when inquiriesError != null:
return inquiriesError(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial<T> value)  initial,required TResult Function( InquiriesLoading<T> value)  inquiriesLoading,required TResult Function( InquiriesSuccess<T> value)  inquiriesSuccess,required TResult Function( InquiriesError<T> value)  inquiriesError,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case InquiriesLoading():
return inquiriesLoading(_that);case InquiriesSuccess():
return inquiriesSuccess(_that);case InquiriesError():
return inquiriesError(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial<T> value)?  initial,TResult? Function( InquiriesLoading<T> value)?  inquiriesLoading,TResult? Function( InquiriesSuccess<T> value)?  inquiriesSuccess,TResult? Function( InquiriesError<T> value)?  inquiriesError,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case InquiriesLoading() when inquiriesLoading != null:
return inquiriesLoading(_that);case InquiriesSuccess() when inquiriesSuccess != null:
return inquiriesSuccess(_that);case InquiriesError() when inquiriesError != null:
return inquiriesError(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  inquiriesLoading,TResult Function( T data)?  inquiriesSuccess,TResult Function( ApiErrorModel apiErrorModel)?  inquiriesError,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case InquiriesLoading() when inquiriesLoading != null:
return inquiriesLoading();case InquiriesSuccess() when inquiriesSuccess != null:
return inquiriesSuccess(_that.data);case InquiriesError() when inquiriesError != null:
return inquiriesError(_that.apiErrorModel);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  inquiriesLoading,required TResult Function( T data)  inquiriesSuccess,required TResult Function( ApiErrorModel apiErrorModel)  inquiriesError,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case InquiriesLoading():
return inquiriesLoading();case InquiriesSuccess():
return inquiriesSuccess(_that.data);case InquiriesError():
return inquiriesError(_that.apiErrorModel);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  inquiriesLoading,TResult? Function( T data)?  inquiriesSuccess,TResult? Function( ApiErrorModel apiErrorModel)?  inquiriesError,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case InquiriesLoading() when inquiriesLoading != null:
return inquiriesLoading();case InquiriesSuccess() when inquiriesSuccess != null:
return inquiriesSuccess(_that.data);case InquiriesError() when inquiriesError != null:
return inquiriesError(_that.apiErrorModel);case _:
  return null;

}
}

}

/// @nodoc


class _Initial<T> implements InquiriesState<T> {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'InquiriesState<$T>.initial()';
}


}




/// @nodoc


class InquiriesLoading<T> implements InquiriesState<T> {
  const InquiriesLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InquiriesLoading<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'InquiriesState<$T>.inquiriesLoading()';
}


}




/// @nodoc


class InquiriesSuccess<T> implements InquiriesState<T> {
  const InquiriesSuccess(this.data);
  

 final  T data;

/// Create a copy of InquiriesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InquiriesSuccessCopyWith<T, InquiriesSuccess<T>> get copyWith => _$InquiriesSuccessCopyWithImpl<T, InquiriesSuccess<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InquiriesSuccess<T>&&const DeepCollectionEquality().equals(other.data, data));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'InquiriesState<$T>.inquiriesSuccess(data: $data)';
}


}

/// @nodoc
abstract mixin class $InquiriesSuccessCopyWith<T,$Res> implements $InquiriesStateCopyWith<T, $Res> {
  factory $InquiriesSuccessCopyWith(InquiriesSuccess<T> value, $Res Function(InquiriesSuccess<T>) _then) = _$InquiriesSuccessCopyWithImpl;
@useResult
$Res call({
 T data
});




}
/// @nodoc
class _$InquiriesSuccessCopyWithImpl<T,$Res>
    implements $InquiriesSuccessCopyWith<T, $Res> {
  _$InquiriesSuccessCopyWithImpl(this._self, this._then);

  final InquiriesSuccess<T> _self;
  final $Res Function(InquiriesSuccess<T>) _then;

/// Create a copy of InquiriesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = freezed,}) {
  return _then(InquiriesSuccess<T>(
freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as T,
  ));
}


}

/// @nodoc


class InquiriesError<T> implements InquiriesState<T> {
  const InquiriesError(this.apiErrorModel);
  

 final  ApiErrorModel apiErrorModel;

/// Create a copy of InquiriesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InquiriesErrorCopyWith<T, InquiriesError<T>> get copyWith => _$InquiriesErrorCopyWithImpl<T, InquiriesError<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InquiriesError<T>&&(identical(other.apiErrorModel, apiErrorModel) || other.apiErrorModel == apiErrorModel));
}


@override
int get hashCode => Object.hash(runtimeType,apiErrorModel);

@override
String toString() {
  return 'InquiriesState<$T>.inquiriesError(apiErrorModel: $apiErrorModel)';
}


}

/// @nodoc
abstract mixin class $InquiriesErrorCopyWith<T,$Res> implements $InquiriesStateCopyWith<T, $Res> {
  factory $InquiriesErrorCopyWith(InquiriesError<T> value, $Res Function(InquiriesError<T>) _then) = _$InquiriesErrorCopyWithImpl;
@useResult
$Res call({
 ApiErrorModel apiErrorModel
});




}
/// @nodoc
class _$InquiriesErrorCopyWithImpl<T,$Res>
    implements $InquiriesErrorCopyWith<T, $Res> {
  _$InquiriesErrorCopyWithImpl(this._self, this._then);

  final InquiriesError<T> _self;
  final $Res Function(InquiriesError<T>) _then;

/// Create a copy of InquiriesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? apiErrorModel = null,}) {
  return _then(InquiriesError<T>(
null == apiErrorModel ? _self.apiErrorModel : apiErrorModel // ignore: cast_nullable_to_non_nullable
as ApiErrorModel,
  ));
}


}

// dart format on
