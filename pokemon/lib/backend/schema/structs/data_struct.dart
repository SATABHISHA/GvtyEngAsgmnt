// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DataStruct extends BaseStruct {
  DataStruct({
    List<String>? name,
    List<String>? imageLst,
  })  : _name = name,
        _imageLst = imageLst;

  // "Name" field.
  List<String>? _name;
  List<String> get name => _name ?? const [];
  set name(List<String>? val) => _name = val;

  void updateName(Function(List<String>) updateFn) {
    updateFn(_name ??= []);
  }

  bool hasName() => _name != null;

  // "ImageLst" field.
  List<String>? _imageLst;
  List<String> get imageLst => _imageLst ?? const [];
  set imageLst(List<String>? val) => _imageLst = val;

  void updateImageLst(Function(List<String>) updateFn) {
    updateFn(_imageLst ??= []);
  }

  bool hasImageLst() => _imageLst != null;

  static DataStruct fromMap(Map<String, dynamic> data) => DataStruct(
        name: getDataList(data['Name']),
        imageLst: getDataList(data['ImageLst']),
      );

  static DataStruct? maybeFromMap(dynamic data) =>
      data is Map ? DataStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'Name': _name,
        'ImageLst': _imageLst,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Name': serializeParam(
          _name,
          ParamType.String,
          isList: true,
        ),
        'ImageLst': serializeParam(
          _imageLst,
          ParamType.String,
          isList: true,
        ),
      }.withoutNulls;

  static DataStruct fromSerializableMap(Map<String, dynamic> data) =>
      DataStruct(
        name: deserializeParam<String>(
          data['Name'],
          ParamType.String,
          true,
        ),
        imageLst: deserializeParam<String>(
          data['ImageLst'],
          ParamType.String,
          true,
        ),
      );

  @override
  String toString() => 'DataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is DataStruct &&
        listEquality.equals(name, other.name) &&
        listEquality.equals(imageLst, other.imageLst);
  }

  @override
  int get hashCode => const ListEquality().hash([name, imageLst]);
}

DataStruct createDataStruct() => DataStruct();
