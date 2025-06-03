import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import '/backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _PokemonName = prefs.getString('ff_PokemonName') ?? _PokemonName;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _PokemonName = '';
  String get PokemonName => _PokemonName;
  set PokemonName(String value) {
    _PokemonName = value;
    prefs.setString('ff_PokemonName', value);
  }

  bool _isSearchTrue = false;
  bool get isSearchTrue => _isSearchTrue;
  set isSearchTrue(bool value) {
    _isSearchTrue = value;
  }

  String _TxtSearch = '';
  String get TxtSearch => _TxtSearch;
  set TxtSearch(String value) {
    _TxtSearch = value;
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
