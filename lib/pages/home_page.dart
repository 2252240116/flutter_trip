
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app_trip/dao/home_dao.dart';
import 'package:flutter_app_trip/model/home_model.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage>
with AutomaticKeepAliveClientMixin{
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  void initState() {
    super.initState();

    _initData();

  }

  Future _initData() async {
    //通过dio获取model
    HomeModel model = await HomeDao.fetch();
    //model2map
    Map map =model.toJson();
    //map2json
    String jsonstring =json.encode(map);
    print(
        "将mode2json"+jsonstring
    );
    print(
        "model数据:${model.localNavList?[0]?.title}"
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  @override
  bool get wantKeepAlive => true;
}
