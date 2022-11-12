extension DebugLog on String {
  void log({String widgetName = ''}) {
    if (widgetName.isEmpty) {
      print('Debug :: ${this}');
    } else {
      print('Debug from ${widgetName} :: ${this}');
    }
  }
}
