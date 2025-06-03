// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ImagesListStruct extends BaseStruct {
  ImagesListStruct({
    String? small,
    String? large,
  })  : _small = small,
        _large = large;

  // "small" field.
  String? _small;
  String get small => _small ?? '';
  set small(String? val) => _small = val;

  bool hasSmall() => _small != null;

  // "large" field.
  String? _large;
  String get large => _large ?? '';
  set large(String? val) => _large = val;

  bool hasLarge() => _large != null;

  static ImagesListStruct fromMap(Map<String, dynamic> data) =>
      ImagesListStruct(
        small: data['small'] as String?,
        large: data['large'] as String?,
      );

  static ImagesListStruct? maybeFromMap(dynamic data) => data is Map
      ? ImagesListStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'small': _small,
        'large': _large,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'small': serializeParam(
          _small,
          ParamType.String,
        ),
        'large': serializeParam(
          _large,
          ParamType.String,
        ),
      }.withoutNulls;

  static ImagesListStruct fromSerializableMap(Map<String, dynamic> data) =>
      ImagesListStruct(
        small: deserializeParam(
          data['small'],
          ParamType.String,
          false,
        ),
        large: deserializeParam(
          data['large'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ImagesListStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ImagesListStruct &&
        small == other.small &&
        large == other.large;
  }

  @override
  int get hashCode => const ListEquality().hash([small, large]);
}

ImagesListStruct createImagesListStruct({
  String? small,
  String? large,
}) =>
    ImagesListStruct(
      small: small,
      large: large,
    );
