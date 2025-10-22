import 'package:flutter/material.dart';

class ChangeNotifierEx extends StatefulWidget {
  const ChangeNotifierEx({super.key});

  @override
  State<StatefulWidget> createState() => ChangeNotifierExState();
}

class ChangeNotifierExState extends State<ChangeNotifierEx> {
  final clickModel = ClickModel();

  @override
  void initState() {
    super.initState();
    // clickModel.addListener(() {
    //   setState(() {});
    // });
  }

  @override
  void dispose() {
    clickModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Hello'),
        ),
        body: Center(
          child: Column(
            children: [
              Text("click model v.1 = ${clickModel.ctr}"),
              MyListenableBuilder(
                  listenable: clickModel,
                  child: ClickPrint(value: clickModel.ctr),
                  builder: (context, child) => Column(
                        children: [
                          child!, //podczas rebuild child jest zawsze tym saym widgetem - a wiec nie potrzeba wywolywac build na nim, skoro jest tym samy widgetem (a widgety są immutable)
                          // const ClickPrint(value: clickModel.ctr),
                          Text('MyListenable = ${clickModel.ctr}'),
                        ],
                      )),
              ListenableBuilder(
                  listenable: clickModel,
                  builder: (context, child) =>
                      Text("listenable builder = ${clickModel.ctr}")),
              MyChangeNotifierListener<ClickModel>(
                  create: () => ClickModel(),
                  listener: (model) => Column(
                        children: [
                          Text("${model.ctr}"),
                          SizedBox(
                            height: 20,
                          ),
                          TextButton.icon(
                              onPressed: () {
                                model.inc();
                              },
                              icon: Icon(Icons.add),
                              label: Text('Kliknij'))
                        ],
                      )),
              ElevatedButton(
                  onPressed: () {
                    setState(() {});
                  },
                  child: Text('Set state'))
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              clickModel.inc();
            }),
      ),
    );
  }
}

class ClickModel with ChangeNotifier {
  int _ctr = 0;
  int get ctr => _ctr;

  void inc() {
    _ctr++;
    notifyListeners();
  }
}

class MyChangeNotifierListener<T extends ChangeNotifier>
    extends StatefulWidget {
  const MyChangeNotifierListener(
      {super.key, required this.create, required this.listener});
  final T Function() create;
  final Widget Function(T model) listener;

  @override
  State<MyChangeNotifierListener> createState() =>
      _MyChangeNotifierListenerState<T>();
}

class _MyChangeNotifierListenerState<T extends ChangeNotifier>
    extends State<MyChangeNotifierListener<T>> {
  late T _model;

  @override
  void initState() {
    super.initState();
    _model = widget.create();
    _model.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.listener(_model);
  }
}

class MyListenableBuilder extends StatefulWidget {
  const MyListenableBuilder(
      {super.key, required this.listenable, required this.builder, this.child});
  final Listenable listenable;
  final Widget? child;
  final Widget Function(BuildContext context, Widget? child) builder;

  @override
  State<MyListenableBuilder> createState() => _MyListenableBuilderState();
}

class _MyListenableBuilderState extends State<MyListenableBuilder> {
  @override
  void initState() {
    super.initState();
    widget.listenable.addListener(_handleChange);
  }

  void _handleChange() {
    setState(() {});
  }

  @override
  void dispose() {
    widget.listenable.removeListener(_handleChange);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, widget.child);
  }
}

class ClickPrint extends StatelessWidget {
  const ClickPrint({super.key, this.value = 0});

  static int ctr = 0;
  final int value;

  @override
  Widget build(BuildContext context) {
    print('click print ${ctr++}');
    return Text('Click print $ctr, $value');
  }
}
