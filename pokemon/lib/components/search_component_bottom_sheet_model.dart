import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'search_component_bottom_sheet_widget.dart'
    show SearchComponentBottomSheetWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SearchComponentBottomSheetModel
    extends FlutterFlowModel<SearchComponentBottomSheetWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextFieldSearch widget.
  FocusNode? textFieldSearchFocusNode;
  TextEditingController? textFieldSearchTextController;
  String? Function(BuildContext, String?)?
      textFieldSearchTextControllerValidator;
  // Stores action output result for [Backend Call - API (SearchPokemonCards)] action in Button widget.
  ApiCallResponse? apiResult39g;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldSearchFocusNode?.dispose();
    textFieldSearchTextController?.dispose();
  }
}
