import 'package:flutter/material.dart';

class Todo {
  final String title;
  final String description;

  Todo({ @required this.title, @required this.description })
    : assert(title != null),
      assert(description != null);
}

void main() => runApp(MaterialApp(
  title: 'Navigation',
  home: TodoScreen(
    todos: List<Todo>.generate(20, (i) => Todo(
      title: 'TODO $i',
      description: 'TODO $i の詳細',
    )),
  ),
));

class TodoScreen extends StatelessWidget {
  final List<Todo> _todos;

  TodoScreen({ Key key, @required List<Todo> todos })
    : assert(todos != null),
    this._todos = todos,
    super(key: key);

  final appBarStyle = AppBar(
    leading: Icon(Icons.menu),
      title: Text('TODOリスト'),
      shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(15),
        ),
      ),
    );

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: appBarStyle,
    body: ListView.builder(
      itemCount: _todos.length,
      itemBuilder: (context, index) => ListTile(
        title: Text(_todos[index].title),
        onTap: (){
          //Todo処理
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailScreen(todo: _todos[index]),
            ),
          );
        }
      ),
    ),
  );
}

class DetailScreen extends StatelessWidget {
  final Todo _todo;
   DetailScreen({ Key key, @required Todo todo })
      :assert(todo != null),
      this._todo = todo,
      super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text('TODOリスト詳細'),
      shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(15),
        ),
      ),
    ),
    body: Center(
          child: Text(_todo.description),
        ),
    );
}
