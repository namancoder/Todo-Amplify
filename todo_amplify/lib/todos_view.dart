import 'package:flutter/material.dart';

class TodosView extends StatefulWidget {
  const TodosView({Key? key}) : super(key: key);

  @override
  _TodosViewState createState() => _TodosViewState();
}

class _TodosViewState extends State<TodosView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _navBar(),
      body: _emptyTodosView(),
      floatingActionButton: _floatingActionButton(),
    );
  }

  AppBar _navBar() {
    return AppBar(title: Text("TODOS"),);
  }

    Widget _emptyTodosView() {
    return Center(
      child: Text('No todos yet'),
    );
  }

    Widget _floatingActionButton() {
    return FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
        
        });
  }
}
