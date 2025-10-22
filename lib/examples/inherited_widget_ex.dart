import 'package:flutter/material.dart';

class InheritedWidgetExample extends StatefulWidget {
  const InheritedWidgetExample({super.key});

  @override
  State<StatefulWidget> createState() => InheritedWidgetExampleState();
}

class InheritedWidgetExampleState extends State<InheritedWidgetExample> {
  int ctr = 0;

  @override
  Widget build(BuildContext context) {
    print('app');
    return ClickProvider(
      ctr: 12,
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text('Hello'),
          ),
          body: ClickProvider(
            ctr: ctr + 10,
            child: Center(
              child: Column(
                children: [
                  const ClickPrinter(),
                  Text(identical(const A(x: 0), const A(x: 0))
                      ? 'true'
                      : 'false'),
                ],
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {
                setState(() {
                  ctr++;
                });
              }),
        ),
      ),
    );
  }
}

class ClickProvider extends InheritedWidget {
  const ClickProvider({super.key, required super.child, this.ctr = 0});

  final int ctr;

  @override
  bool updateShouldNotify(covariant ClickProvider oldWidget) {
    print('updateShouldNotify old=${oldWidget.ctr}, new=$ctr');
    return oldWidget.ctr != ctr;
    // return false;
  }

  static ClickProvider? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<ClickProvider>();
}

class ClickPrinter extends StatelessWidget {
  const ClickPrinter({super.key});

  @override
  Widget build(BuildContext context) {
    final ctr = ClickProvider.of(context)?.ctr ?? 0;
    print('ClickPrinter build $ctr');
    return Text('click = $ctr');
  }
}

// @immutable
class A extends StatelessWidget {
  const A({this.x = 0});
  final int x;

  // @override
  Widget build(BuildContext context) {
    return Text('A=$x');
  }
}
