void main() {
  var b = FlutterWidgetsBinding();

  /*
flutter: BindingBase initInstances
flutter: SchedulerBinding initInstances
flutter: WidgetsBinding initInstances, scheduler = 20
flutter: RendererBinding initInstances, scheduler = 20
flutter: GestureBinding initInstances
*/
}

class BindingBase {
  BindingBase() {
    initInstances();
  }

  void initInstances() {
    print('BindingBase initInstances');
  }

  int platformDispatcher = 1;
}

mixin SchedulerBinding on BindingBase {
  @override
  void initInstances() {
    super.initInstances();
    print('SchedulerBinding initInstances');
  }

  int scheduler = 10;
}

mixin GestureBinding on BindingBase {
  @override
  void initInstances() {
    super.initInstances();
    print('GestureBinding initInstances');
  }

  int gesture = 2;
}

mixin RendererBinding on BindingBase, SchedulerBinding {
  @override
  void initInstances() {
    super.initInstances();
    print('RendererBinding initInstances, scheduler = $scheduler');
  }
}

mixin WidgetsBinding on BindingBase, SchedulerBinding {
  @override
  void initInstances() {
    super.initInstances();
    print('WidgetsBinding initInstances, scheduler = $scheduler');
  }

  @override
  int scheduler = 20;
}

class FlutterWidgetsBinding extends BindingBase
    with SchedulerBinding, WidgetsBinding, RendererBinding, GestureBinding {}
