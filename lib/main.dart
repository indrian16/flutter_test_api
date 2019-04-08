import 'package:flutter/material.dart';
import 'package:flutter_rest_api/model/post_model.dart';
import 'package:flutter_rest_api/service/post_service.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Simple Rest API',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: HomePage(title: 'Simple Rest API'),
    );
  }
}

class HomePage extends StatefulWidget {

  final String title;

  HomePage({Key key, this.title}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder<Post>(
        future: getPost(),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (!snapshot.hasError) {
              return Text('${snapshot.data.title}');
            } else {
              return Text('Error ${snapshot.error}');
            }
          }else {
            return CircularProgressIndicator();
          }
        },
      )
    );
  }
}