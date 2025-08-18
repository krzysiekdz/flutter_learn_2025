part of '../index.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  late final TodoPageViewModel vm;
  final controller = TextEditingController(text: '');

  @override
  void initState() {
    super.initState();
    vm = TodoPageViewModel(locator<TodoServiceImpl>());
    vm.init(initialState: TodoPageViewState(category: 'SPRZEDAZ'));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void showAddNewItem() {
    showAdaptiveDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: TextField(
                decoration: InputDecoration(label: Text('Nowa rzecz')),
                controller: controller,
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Anuluj')),
                FilledButton(
                    onPressed: () {
                      vm.add(Todo(title: controller.text));
                      controller.clear();
                      Navigator.of(context).pop();
                    },
                    child: Text('Zapisz'))
              ],
            ));
  }

  Widget buildCheckbox(Todo item) {
    return Checkbox(
        value: item.isDone,
        onChanged: (_) {
          vm.toggleDone(item);
        });
  }

  Widget buildList(List<Todo> items) {
    if (items.isEmpty) {
      return Container(
        width: double.infinity,
        padding: EdgeInsets.all(12),
        color: Colors.blue[200],
        child: const Text(
          'Lista jest pusta',
          textAlign: TextAlign.center,
        ),
      );
    }
    return Column(
      children: [
        for (final item in items)
          Column(
            children: [
              ListTile(
                title: Text(item.title),
                tileColor: Colors.blue[200],
                leading: buildCheckbox(item),
                trailing: IconButton(
                    onPressed: () {
                      vm.remove(item);
                    },
                    icon: Icon(Icons.delete_forever_outlined)),
              ),
              SizedBox(
                height: 1,
              )
            ],
          )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: vm.stateNotifier,
      builder: (context, state, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue,
            title: Text('Lista rzeczy ${state.category}'),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                children: [
                  Text('Do zrobienia', style: TextStyle(fontSize: 18)),
                  buildList(state.items.where((e) => !e.isDone).toList()),
                  SizedBox(
                    height: 24,
                  ),
                  Text('Zrobione', style: TextStyle(fontSize: 18)),
                  buildList(state.items.where((e) => e.isDone).toList()),
                ],
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: showAddNewItem,
            child: Icon(Icons.add),
          ),
        );
      },
    );
  }
}
