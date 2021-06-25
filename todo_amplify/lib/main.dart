import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_amplify/todo_bloc.dart';
import 'package:todo_amplify/todo_repository.dart';
import 'package:todo_amplify/todos_view.dart';

// Amplify Flutter Packages
import 'package:amplify_flutter/amplify.dart';
// import 'package:amplify_api/amplify_api.dart'; // UNCOMMENT this line once backend is deployed
import 'package:amplify_datastore/amplify_datastore.dart';

// Generated in previous step
import 'loading_view.dart';
import 'models/ModelProvider.dart';
import 'amplifyconfiguration.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _amplifyConfigured = false;

  @override
  void initState() {
    _configureAmplify();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
          create: (context) => TodoCubit()..getTodos(),
          child: _amplifyConfigured ? TodoView() : LoadingView()),
    );
  }

  void _configureAmplify() async {
    // Amplify.addPlugin(AmplifyAPI()); // UNCOMMENT this line once backend is deployed
    Amplify.addPlugin(AmplifyDataStore(modelProvider: ModelProvider.instance));

    // Once Plugins are added, configure Amplify
    try {
      await Amplify.configure(amplifyconfig);

      
    } catch (e) {
      print(e);
    }
    setState(() {
        _amplifyConfigured = true;
      });
  }
}
