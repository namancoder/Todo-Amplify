import 'package:flutter/material.dart';
import 'package:todo_amplify/todos_view.dart';


// Amplify Flutter Packages
import 'package:amplify_flutter/amplify.dart';
// import 'package:amplify_api/amplify_api.dart'; // UNCOMMENT this line once backend is deployed
import 'package:amplify_datastore/amplify_datastore.dart';

// Generated in previous step
import 'models/ModelProvider.dart';
import 'amplifyconfiguration.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

    bool _amplifyConfigured = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TodosView(),
    );
  }

    void _configureAmplify() async {

    Amplify.addPlugin(AmplifyDataStore(modelProvider: ModelProvider.instance));

    // Once Plugins are added, configure Amplify
    try {
          await Amplify.configure(amplifyconfig);

      setState(() {
       _amplifyConfigured = true;
      });
    } catch (e) {
      print(e);
    }
  }
}
