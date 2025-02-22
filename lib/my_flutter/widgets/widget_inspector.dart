import 'package:flutter/foundation.dart';

mixin WidgetInspectorService {
  static WidgetInspectorService get instance => _instance;
  static WidgetInspectorService _instance = _WidgetInspectorService();
  final InspectorSelection selection = InspectorSelection();

  void performReassemble() {}
}

class _WidgetInspectorService with WidgetInspectorService {
  _WidgetInspectorService() {
    // selection.addListener(() => selectionChangedCallback?.call());
  }
}

class InspectorSelection with ChangeNotifier {}
