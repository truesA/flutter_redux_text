import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_vscode/models/app_state.dart';
import 'package:flutter_vscode/pages/home_page.dart';
import 'package:flutter_vscode/reducers/app_reducer.dart';
import 'package:redux/redux.dart';

void main() => runApp(new ReduxApp());

class ReduxApp extends StatelessWidget { 
  String title = "Redux";
  final store = new Store<AppState>(
    appReducer,
    initialState: new AppState(),
    middleware: [],
  );

  @override
  Widget build(BuildContext context) {
    // Wrap your MaterialApp in a StoreProvider
    return new StoreProvider(
      // new
      store: store, // new
      child: new MaterialApp(
        title: title,
        home: new HomePage(title),
      ),
    );
  }
}
