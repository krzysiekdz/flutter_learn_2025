import 'package:flutter/foundation.dart';
import 'focus_manager.dart';
// import 'package:meta/meta.dart';

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
  Widget build(BuildContext context);
}

@immutable
abstract class StatefulWidget extends Widget {
  const StatefulWidget({super.key});
  State<StatefulWidget> createState();
}

abstract class State<T extends StatefulWidget> {
  late T _widget;
  T get widget => _widget;
  Widget build(BuildContext context);
}

abstract interface class BuildContext {
  // Widget get widget;
  // bool get mounted;
}

abstract class Element implements BuildContext {
  Widget widget;
  Element(this.widget);
}

class BuildOwner {
  VoidCallback? onBuildScheduled;
  FocusManager focusManager;

  BuildOwner({this.onBuildScheduled, FocusManager? focusManager})
      : focusManager =
            focusManager ?? (FocusManager()..registerGlobalHandlers());

  @pragma('vm:notify-debugger-on-exception')
  void buildScope(Element context, [VoidCallback? callback]) {}

  void finalizeTree() {}

  void reassemble(Element root) {
    if (!kReleaseMode) {
      FlutterTimeline.startSync('Preparing Hot Reload (widgets)');
    }
    try {
      // assert(root._parent == null);
      // assert(root.owner == this);
      // root.reassemble();
    } finally {
      if (!kReleaseMode) {
        FlutterTimeline.finishSync();
      }
    }
  }
}

mixin RootElementMixin on Element {
  /// Set the owner of the element. The owner will be propagated to all the
  /// descendants of this element.
  ///
  /// The owner manages the dirty elements list.
  ///
  /// The [WidgetsBinding] introduces the primary owner,
  /// [WidgetsBinding.buildOwner], and assigns it to the widget tree in the call
  /// to [runApp]. The binding is responsible for driving the build pipeline by
  /// calling the build owner's [BuildOwner.buildScope] method. See
  /// [WidgetsBinding.drawFrame].
  // ignore: use_setters_to_change_properties, (API predates enforcing the lint)
  void assignOwner(BuildOwner owner) {
    // _owner = owner;
    // _parentBuildScope = BuildScope();
  }

  @override
  void mount(Element? parent, Object? newSlot) {
    // Root elements should never have parents.
    // assert(parent == null);
    // assert(newSlot == null);
    // super.mount(parent, newSlot);
  }
}
