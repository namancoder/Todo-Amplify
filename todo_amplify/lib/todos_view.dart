import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_amplify/loading_view.dart';
import 'package:todo_amplify/todo_bloc.dart';

import 'models/Todo.dart';

class TodoView extends StatefulWidget {
  @override
  _TodoViewState createState() => _TodoViewState();
}

class _TodoViewState extends State<TodoView> {
  final _titleController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _navBar(),
      body: BlocBuilder<TodoCubit, TodoState>(builder: (context, state) {
        if (state is ListTodosSuccess) {
          return state.todos.isEmpty
              ? _emptyTodosView()
              : _todosListView(state.todos);
        } else if (state is ListTodosFailure) {
          return _exceptionView(state.exception);
        } else
          return LoadingView();
      }),
      floatingActionButton: _floatingactionbutton(),
    );
  }

  Widget _todosListView(List<Todo> todos) {
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        final todo = todos[index];
        return Card(
          child: CheckboxListTile(
              title: Text(todo.title),
              subtitle: Text(todo.timeAdded),
              value: todo.isDone,
              onChanged: (newValue) {
                BlocProvider.of<TodoCubit>(context)
                    .updateTodoIsComplete(todo, newValue!);
              }),
        );
      },
    );
  }

  Widget _exceptionView(String exception) {
    return Center(child: Text(exception.toString()));
  }

  Widget _newTodoView() {
    return SingleChildScrollView(
      child: AlertDialog(
        insetPadding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 300.0),
        title: Text('Create a Todo Task'),
        content: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: _titleController,
              onChanged: (value) {},
              decoration: InputDecoration(
                hintText: "Add",
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  BlocProvider.of<TodoCubit>(context)
                      .createTodo(_titleController.text);
                  _titleController.text = "";
                  Navigator.of(context).pop();
                },
                child: Text("Save")),
          ],
        ),
      ),
    );
  }

  Widget _floatingactionbutton() {
    return FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          showDialog(context: context, builder: (context) => _newTodoView());
        });
  }

  AppBar _navBar() {
    return AppBar(
      title: Center(child: Text("TODOS")),
    );
  }

  Widget _emptyTodosView() {
    return Center(
      child: Text("No todos yet"),
    );
  }
}
