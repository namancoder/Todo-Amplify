import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_flutter/amplify.dart';

import 'models/Todo.dart';

class TodoRepository {
  Future<List<Todo>> getTodos() async {
    try {
      final todos = await Amplify.DataStore.query(Todo.classType);
      return todos;
    } catch (e) {
      throw e;
    }
  }

  Future<void> createTodo(String title) async {
    final newtodo = Todo(
        title: title,
        isDone: false,
        id: "",
        timeAdded: DateTime.now().toString());
    try {
      await Amplify.DataStore.save(newtodo);
    } catch (e) {
      throw e;
    }
  }

  void updateTodoIsComplete(Todo todo, bool isComplete) async {
    {
      final updatedTodo = todo.copyWith(isDone: isComplete);
      try {
        await Amplify.DataStore.save(updatedTodo);
      } catch (e) {
        throw e;
      }
    }
  }
}
