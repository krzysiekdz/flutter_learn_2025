// import 'package:flutter/widgets.dart';
// import 'package:flutter_learn_2025/stoper/app.dart';

import 'package:flutter_learn_2025/my_flutter/widgets.dart';

//zaczac od: root widget - tutaj tworzy sie hierarchia widgetow - powinny wiec dzialac elementy - monotwanie ich przez build ownera
//w utworzonych plikach stopniowo dodawac implementacje (na razie to puste odwloania)

void main() {
  // runApp(StoperApp());
  runApp(Test());
}

// zrobic wlasna warstwe widgetow - czyli korzystac w frameworka flutter, ale napisac wlasna warstwe widgetow
// czyli wszedzie tam, gdzie framework odwoluje sie do widgetow - nadpisac to wlasnymi klasami i je wywolywac

class Test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

  @override
  Element createElement() {
    // TODO: implement createElement
    throw UnimplementedError();
  }
}
