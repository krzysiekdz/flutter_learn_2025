import 'package:meta/meta.dart';

abstract class Key {}

@immutable
abstract class Widget {
  const Widget({this.key});
  final Key? key;

  @protected
  @factory
  Element createElement();
}

@immutable
abstract class StatelessWidget extends Widget {
  const StatelessWidget({super.key});
  Widget build();
}

@immutable
abstract class StatefulWidget extends Widget {
  const StatefulWidget({super.key});
  State<StatefulWidget> createState();
}

abstract class State<T extends StatefulWidget> {
  late final T widget;
  Widget build();
}

abstract class BuildContext {
  Widget get widget;
  bool get mounted;
}

abstract class Element implements BuildContext {}
