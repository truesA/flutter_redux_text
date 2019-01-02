import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_vscode/actions/counter_actions.dart';
import 'package:flutter_vscode/models/app_state.dart';

class HomePage extends StatelessWidget {
  String title;

  HomePage(this.title);

  @override
  Widget build(BuildContext context) {
    ///StoreConnector 可以在不同的布局 获取想要的state 然后处理 （把状态和当前的使用到状态的地方进行连接）
    return StoreConnector<AppState, int>(
      converter: (store) => store.state.count, //拿到store 需要用的数据
      builder: (context, count) {
        ///来接受数据 值 或者 对象
        return new MaterialApp(
          title: title,
          home: new Container(
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Center(child: new Text("$count")),
                new FloatingActionButton(
                  onPressed: () => actionsAdd(context),
                  child: new Icon(Icons.add),
                ),
                new FloatingActionButton(
                  onPressed: () => actionsRemove(context),
                  child: new Icon(Icons.remove),
                )
              ],
            ),
          ),
        );
      },
    );

    return new MaterialApp(
      title: title,
      home: new Center(child: new Text(title)),
    );
  }

  actionsAdd(BuildContext context) {
    var store = StoreProvider.of<AppState>(context);
    store.dispatch(IncrementCountAction());
  }

  actionsRemove(BuildContext context) {
    var store = StoreProvider.of<AppState>(context);
    store.dispatch(DecrememtCountAction());
  }
}
