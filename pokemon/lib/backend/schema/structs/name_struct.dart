// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NameStruct extends BaseStruct {
  NameStruct({
    List<String>? name,
  }) : _name = name;

  // "name" field.
  List<String>? _name;
  List<String> get name => _name ?? const [];
  set name(List<String>? val) => _name = val;

  void updateName(Function(List<String>) updateFn) {
    updateFn(_name ??= []);
  }

  bool hasName() => _name != null;

  static NameStruct fromMap(Map<String, dynamic> data) => NameStruct(
        name: getDataList(data['name']),
      );

  static NameStruct? maybeFromMap(dynamic data) =>
      data is Map ? NameStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
          isList: true,
        ),
      }.withoutNulls;

  static NameStruct fromSerializableMap(Map<String, dynamic> data) =>
      NameStruct(
        name: deserializeParam<String>(
          data['name'],
          ParamType.String,
          true,
        ),
      );

  @override
  String toString() => 'NameStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is NameStruct && listEquality.equals(name, other.name);
  }

  @override
  int get hashCode => const ListEquality().hash([name]);
}

NameStruct createNameStruct() => NameStruct();
