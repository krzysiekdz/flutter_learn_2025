import 'dart:async';
import 'dart:isolate';

void main4() {
  Isolate.run(() {
    computeMany('first', 10);
  });

  Isolate.run(() {
    computeMany('second', 10);
  });

  Isolate.run(() {
    computeMany('third', 10);
  });

  Isolate.run(() {
    computeMany('fourth', 10);
  });

  Isolate.run(() {
    computeMany('5', 10);
  });

  Isolate.run(() {
    computeMany('6', 10);
  });

  Isolate.run(() {
    computeMany('7', 10);
  });

  Isolate.run(() {
    computeMany('8', 10);
  });

  Isolate.run(() {
    computeMany('9', 10);
  });

  Isolate.run(() {
    computeMany('10', 10);
  });

  print('main() finished');
}

void computeMany(String label, int end) {
  for (var i = 0; i < end; i++) {
    compute(label, i);
  }
}

void compute(String label, int iter) {
  for (var i = 0; i < 3000000000; i++) {}
  print('$label = $iter');
}

void main3() async {
  print('main() start');
  Future<int>(() async {
    print('future 1');
    await Future.delayed(Duration(seconds: 3));
    print('future 1 after');
    return 100;
  });
  scheduleMicrotask(() {
    print('microtask');
  });
  Future<int>(() {
    print('future 2');
    return 100;
  });
  print('main() before end');
  await Future.delayed(Duration(seconds: 2));
  print('main() end');
}

void main2() async {
  Stream<int> s = getValues();
  print(s);
  final s1 =
      await s; //nie robimy await na stream, bo stream moze zwracac wiele wartosci asychnronicznie
  print(s1);
  // s.asBroadcastStream();

  print('------1---------');
  s.listen((i) {
    //nie mozna zrobic 2 razy listen pod ten sam stream (jesli nie jest broadcast)
    print('listener 1 got data = $i');
  });
  print('------2---------');
  getValues().listen((i) {
    print('listener 2 got data = $i');
  });
  print('------3---------');
}

Stream<int> getValues() async* {
  print('start');
  for (var i = 0; i < 10; i++) {
    await Future.delayed(Duration(seconds: 1));
    print('generating next value => $i');
    yield i;
  }
  print('stop');
}
